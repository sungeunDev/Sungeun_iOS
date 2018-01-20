import Foundation


func dicTest()
{
    var dic: [String: Any] = ["name":"sungeun", "age":27, "job":"Developer", "isSingle":true]
    
    //print(dic)
    
    dic.updateValue(true, forKey: "isSingle")
    
    dic.updateValue("adress", forKey: "성남시")
    dic.updateValue("name", forKey: "eun")
    
    // dic.updateValue("isSingle", forKey: false)
    
    dic.removeValue(forKey: "job")
    print(dic.count)
    print(dic.isEmpty)
    
    let introduce: String = "제 이름은 " + (dic["name"] as! String) + " 입니다."
    print(introduce)
    let doubleAge = (dic["age"] as! Int) * 2
}

print(dicTest())

