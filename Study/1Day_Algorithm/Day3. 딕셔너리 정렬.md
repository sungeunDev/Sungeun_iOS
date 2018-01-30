딕셔너리 정렬


딕셔너리는 들어있는 값에 순서가 없지만, 키를 기준으로 정렬하고 싶습니다. 그래서 키와 값을 튜플로 구성하고, 이를 순서대로 리스트에 넣으려고 합니다.
예를들어 {김철수:78, 이하나:97, 정진원:88}이 있다면 각각의 키와 값을

(김철수, 78)
(이하나, 97)
(정진원, 88)
과 같이 튜플로 분리하고 키를 기준으로 정렬해서 다음과 같은 리스트를 만들면 됩니다.
[ (김철수, 78), (이하나, 97), (정진원, 88) ]

다음 sort_dictionary 함수를 완성해 보세요.


def sort_dictionary(dic):
    '''입력받은 dic의 각 키와 값을 튜플로 만든 다음, 키 값을 기준으로 정렬해서 리스트에 넣으세요. 그 리스트를 return하면 됩니다.'''
    return []

# 아래는 테스트로 출력해 보기 위한 코드입니다.
print( sort_dictionary( {"김철수":78, "이하나":97, "정진원":88} ))

func sortDictionary(_ dic: [String : Int]) -> [String]
{
    var result: [String] = []
    for (name, height) in dic
    {
        var str: String = "\(name), \(height)"
        result.append(str)
    }
    return result
}

print( sort_dictionary( {"김철수":78, "이하나":97, "정진원":88} ))
