//
//  ViewController.swift
//  test
//
//  Created by Mac on 2016/01/08.
//  Copyright © 2016年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get path of /Documents
        let paths = NSSearchPathForDirectoriesInDomains( .DocumentDirectory, .UserDomainMask, true)
        //let paths =NSSearchPathForDirectoriesInDomains(.DownloadsDirectory, .UserDomainMask, ture)
        // generate to /Documents/swift2objectc.db
        //let _path = paths[0].stringByAppendingPathComponent("test.db")
        let path = paths[0].stringByAppendingString("test.db")
        // make instance of FMDatabase
        let db = FMDatabase(path: path)
        print(path)
        
        // database open and create database
        db.open()
        
        //create table
        //var sql = "CREATE TABLE IF NOT EXISTS sample (user_id INTEGER PRIMARY KEY, user_name TEXT);"
        //let ret = db.executeUpdate(sql, withArgumentsInArray: nil)
        
        // insert data
        //let sql = "INSERT INTO sample (user_id, user_name) VALUES (?, ?);"
        //db.executeUpdate(sql, withArgumentsInArray: [2, "shinsaku"])
        
        // read data
        let sql2 = "SELECT user_id, user_name FROM sample ORDER BY user_id;"
        let results = db.executeQuery(sql2, withArgumentsInArray: nil)
        
        while results.next() {
            let user_id = results.intForColumn("user_id")
            let user_name = results.stringForColumnIndex(1)
            // print data
            dataview.text = dataview.text + "user_id = \(user_id), user_name = \(user_name)\n"
            print("user_id = \(user_id), user_name = \(user_name)")
        }
        
        // database close
        db.close()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

