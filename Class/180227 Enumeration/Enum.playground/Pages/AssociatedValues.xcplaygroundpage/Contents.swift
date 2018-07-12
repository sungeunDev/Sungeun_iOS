import UIKit

// Swift Programming, p102

// 연관값
enum MainDish {
  case pasta(taste: String)
  case pizza(dough: String, topping: String)
  case chicken(withSauce: Bool)
  case rice
}

var dinner: MainDish = MainDish.pasta(taste: "Cream")
dinner = .pizza(dough: "Cheese", topping: "Pepperoni")


// 연관값을 특정하게 한정 지으려면, 연관 값의 타입을 열거형으로 지정하면 됨
enum PastaTaste {
  case cream, tomato
}

enum PizzaDough {
  case cheeseCrust, thin, original
}

enum PizzaTopping {
  case pepperoni, cheese, bacon
}

enum MainDishVer2 {
  case pasta(taste: PastaTaste)
  case pizza(dough: PizzaDough, topping: PizzaTopping)
  case chicken(withSauce: Bool)
  case rice
}

var dinnerVer2 = MainDishVer2.pasta(taste: .tomato)
dinnerVer2 = MainDishVer2.pizza(dough: .thin, topping: .cheese)
