import Foundation

func setTest()
{
    let oddDigits: Set = [ 1, 3, 5, 7, 9 ]
    let evenDigits: Set = [2, 4, 6, 8]
    let primeDigits: Set = [2, 3, 5, 7]
    
    let intersectList = oddDigits.intersection(evenDigits)
    print(intersectList)
    
    let differenceList = oddDigits.symmetricDifference(primeDigits).sorted()
    print(differenceList)
    
    let unionList = oddDigits.union(evenDigits).sorted(by: >)
    print(unionList)
    
    let subractList = oddDigits.subtracting(primeDigits).sorted()
    print(subractList)
    
}

print(setTest())

