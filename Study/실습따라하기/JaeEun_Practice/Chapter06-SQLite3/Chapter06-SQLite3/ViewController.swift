//
//  ViewController.swift
//  Chapter06-SQLite3
//
//  Created by sungnni on 2018. 8. 27..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

/***************************************************
 < iOS에서 SQLite 이용하기 >
 ***************************************************/
class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
    var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체 (stmp = statement. 구문)
    /***************************************************
     < OpaquePointer >
     -. 스위프트는 C 기반이 아니기 때문에 libsqlite3 라이브러리에서 제공하는 타입을 사용할 수 없음.
     -. OpaquePointer Type: A wrapper around an opaque C pointer
     -. Swift에서 표현할 수없는 유형에 대한 C 포인터를 나타내는 데 사용됨.
     
     < sqlite3, sqlite3_stmt type >
     -. Objective-C에는 sqlite3, sqlite3_stmt Type이 존재하지만 스위프트에는 없기 때문에 OpaquePointer로 정의
     -. sqlite3: DB 연결 정보를 저장
     -. sqlite3_stmt: DB에 보낼 SQL 구문이 컴파일된 상태로 저장
     ***************************************************/
    
    // 앱 내 문서 디렉토리 경로에서 SQLite DB파일을 찾는다.
//    let fileManager = FileManager() // 파일 매니저 객체 생성
    // 앱 내 문서 디렉토리 경로를 찾아 URL 객체로 생성
//    let docPathURL = fileManager.urls(for: .documentDirectory,
//                                      in: .userDomainMask).first!
    // URL객체에 db.sqlite 파일 경로를 추가한 SQLite3 데이터베이스 경로 생성
//    let dbPath = docPathURL.appendingPathComponent("db.sqlite").path
    let dbPath = "/User/sungnni/db.sqlite"
    //    print(dbPath)
    
    // SQL 구문 생성.
    // - IF NOT EXISTS: 테이블이 존재하지 않을 경우에만 생성
    // - sequence 라는 테이블을 생성
    // - INTEGER를 타입으로 갖는 칼럼명 num 칼럼 1개 생성
    let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTERGER)"
    
    /***************************************************
     < open -> prepare -> step -> finalize -> close >
     - DB연결(db객체 생성)
     -> SQL 구문 전달 준비(stmt객체 생성)
     -> 컴파일된 SQL구문 객체를 DB에 전달
     -> 컴파일된 SQL 구문 삭제(stmt 해제)
     -> DB연결 종료(db 해제)
     ***************************************************/
  
    if sqlite3_open(dbPath, &db) == SQLITE_OK {
      if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK {
        if sqlite3_step(stmt) == SQLITE_DONE {
          print("Create Table Success!")
        }
        sqlite3_finalize(stmt)
      } else {
        print("Prepare Statement Fail")
      }
      sqlite3_close(db)
    } else {
      print("Database Connect Fail")
      return
    }
    
    
  }
  
  
}

