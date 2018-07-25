/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import RealmSwift

func delay(seconds: Double, completion: ()->Void) {
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        Realm.Configuration.defaultConfiguration = config
        
        TestData.defaults()
        return true
        
        //        schemaVersion: 3,
        //
        //        schemaVerion이나, schema 자체에 변화가 생기면 호출됨
        //        migrationBlock: { { migration, oldSchemaVersion in
        //            if oldSchemaVersion < 1 {
        //            }
        //            if oldSchemaVersion < 2 {
        //            }
        //            if oldSchemaVersion < 3 {
        //            }
        //            )
        //            })
        /***************************************************
         마이그레이션을 할 때는 선형으로 해야 함을 주의하세요.
         버전이 4까지 올라갔다면 이전 버전에서 일어난 변화를 모두 커버해줘야 합니다.
         또한 스키마 버전을 구분할 때 if else 문을 사용하면 이전의 if문을 통과해버릴 수 있으므로
         각 버전에서 일어나는 내용을 모두 적용할 수 있도록 if 문으로 만들어 주세요.
         ***************************************************/
        //
        //            deleteRealmIfMigrationNeeded: true)
    }
    
}
