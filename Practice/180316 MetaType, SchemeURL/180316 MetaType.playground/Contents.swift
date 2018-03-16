
let int: Int = 3

let someInt = Swift.Int.init(3)
print(someInt)

let someintSelf: Int = int.self
let someIntSelf: Int.Type = Int.self
print(someintSelf)
print(someIntSelf)

let someintType = type(of: int)
let someIntType = type(of: Int())


let someIntMetaType = type(of: type(of: int))


class someClass {
}

print("\n---------- [ a = someClass() ] -----------\n")
let a = someClass()
print(a)
print(type(of: a))
print(type(of: a.self))

print("\n---------- [ b = someClass.self ] -----------\n")
let b = someClass.self
print(b)
print(type(of: b))
print(type(of: b.self))
