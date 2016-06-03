//
//  DBManager.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/22.
//  Copyright © 2016年 lidong. All rights reserved.
//

/**
 *数据库管理
 */
class DBManager {
    
    var db: COpaquePointer = nil
    
    private static let instance = DBManager()
    // 单例  全局的数据访问接口
    class var sharedInstance: DBManager
    {
        return instance
    }
    //打开数据库
    func openDatabase(dbName: String) -> Bool
    {
        let documentPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
             NSSearchPathDomainMask.UserDomainMask, true)
        let documnetPath = documentPaths[0]
        print("documnetPath= \(documnetPath)")
        let error = sqlite3_open(documnetPath+dbName, &db)
        if error != SQLITE_OK {
            print("SQLiteDB - failed to open DB!")
            sqlite3_close(db)
        }
        return error == SQLITE_OK
    }
    //创建数据库表
    func createTable() -> Bool
    {
        
        
        let sql =
            "CREATE TABLE IF NOT EXISTS T_Employee ( \n" +
            "'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \n" +
            "'name' TEXT NOT NULL, \n" +
            "'age' TEXT NOT NULL, \n" +
            "'department_id' TEXT );"
        // 返回结果
        return sqlite3_exec(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, nil, nil, nil) == SQLITE_OK
    }
    //执行SQL （插入，修改，删除）
    func execSql(sql: String) -> Bool
    {
        // 返回结果
       let d =  sqlite3_exec(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, nil, nil, nil) == SQLITE_OK
    
        return d
    }
    
    func closeDb() -> Bool {
        return sqlite3_close(db) == SQLITE_OK
    }
    
    
    func selectAll(sql:String) -> Array<Employee> {
       
        var mArrs:Array<Employee> = []
        var stmt: COpaquePointer = nil
        if sqlite3_prepare_v2(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, &stmt, nil) == SQLITE_OK {
           
            while sqlite3_step(stmt) == SQLITE_ROW {
                let e = Employee()
                
                let id1 =  sqlite3_column_int(stmt, 0)
                print("id = \(id1)")
                let chars = UnsafePointer<CChar>(sqlite3_column_text(stmt, 1))
                let str = String(CString: chars, encoding: NSUTF8StringEncoding)!
                print("name \(str)")

                let chars1 = UnsafePointer<CChar>(sqlite3_column_text(stmt, 2))
                let str1 = String(CString: chars1, encoding: NSUTF8StringEncoding)!
                print("年龄 \(str1)")
                
                e.id = id1
                e.name = str
                e.age = str1
                mArrs.append(e)
            }
            sqlite3_finalize(stmt)
            closeDb()
        }
        
        return mArrs
        
    }
    
    
    
    ///  执行 SQL 返回一个结果集(对象数组)
    ///
    ///  :param: sql SQL 字符串
    func recordSet(sql: String) {
        // 1. 准备语句
        var stmt: COpaquePointer = nil
        /**
         1. 数据库句柄
         2. SQL 的 C 语言的字符串
         3. SQL 的 C 语言的字符串长度 strlen，-1 会自动计算
         4. stmt 的指针
         5. 通常传入 nil
         */
        if sqlite3_prepare_v2(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, &stmt, nil) == SQLITE_OK {
            // 单步获取SQL执行的结果 -> sqlite3_setup 对应一条记录
            while sqlite3_step(stmt) == SQLITE_ROW {
                // 获取每一条记录的数据
                recordData(stmt)
            }
        }
    }
    ///  获取每一条数据的记录
    ///
    ///  :param: stmt prepared_statement 对象
    func recordData(stmt: COpaquePointer) {
        // 获取到记录
        let count = sqlite3_column_count(stmt)
        print("获取到记录，共有多少列 \(count)")
        // 遍历每一列的数据
        for i in 0..<count {
            let type = sqlite3_column_type(stmt, i)
            // 根据字段的类型，提取对应列的值
            switch type {
            case SQLITE_INTEGER:
                print("整数 \(sqlite3_column_int64(stmt, i))")
            case SQLITE_FLOAT:
                print("小数 \(sqlite3_column_double(stmt, i))")
            case SQLITE_NULL:
                print("空 \(NSNull())")
            case SQLITE_TEXT:
                let chars = UnsafePointer<CChar>(sqlite3_column_text(stmt, i))
                let str = String(CString: chars, encoding: NSUTF8StringEncoding)!
                print("字符串 \(str)")
            case let type:
                print("不支持的类型 \(type)")
            }
        }
    }
    
}
