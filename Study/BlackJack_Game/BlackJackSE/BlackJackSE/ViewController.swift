//
//  ViewController.swift
//  BlackJackSE
//
//  Created by 박성은 on 2018. 2. 11..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 게임에 쓰이는 카드 덱
    var gameDeck: [Int] = []
    
    // 유저 카드덱
    var userDeck: [Int] = []
    @IBOutlet weak var userNum1: UIImageView!
    @IBOutlet weak var userNum2: UIImageView!
    @IBOutlet weak var userNum3: UIImageView!
    @IBOutlet weak var userNum4: UIImageView!
    @IBOutlet weak var userNum5: UIImageView!
    // 지금까지 유저가 받은 카드의 합
    var userCardSum: Int = 0
    
    // 딜러 카드 덱
    var dealerDeck: [Int] = []
    @IBOutlet weak var dealerNum1: UIImageView!
    @IBOutlet weak var dealerNum2: UIImageView!
    @IBOutlet weak var dealerNum3: UIImageView!
    @IBOutlet weak var dealerNum4: UIImageView!
    @IBOutlet weak var dealerNum5: UIImageView!
    
    // 지금까지 딜러가 받은 카드의 합
    var dealerCardSum: Int = 0
    
    // 버튼
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var hitBtn: UIButton!
    
    // 게임 단계 설명 Lb
    @IBOutlet weak var gameStatusLb: UILabel!
    
    // 라운드, 점수 체크 Lb
    @IBOutlet weak var roundLb: UILabel!
    @IBOutlet weak var dealerScore: UILabel!
    @IBOutlet weak var userScore: UILabel!
    
    var roundCount: Int = 1
    var userScoreCount: Int = 0
    var dealerScoreCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
    }
    
    // start 버튼 액션
    // 클릭시 랜덤으로 카드 4장을 뽑아서 유저와 딜러에게 각 2장씩 나누어 줌.
    @IBAction func startAction(_ sender: Any) {
        
        clear()
        
        gameDeck = randomNum()
        
        userDeck = [gameDeck[0], gameDeck[1]]
        userNum1 = selectCardImg(cardNum: userDeck[0], view: userNum1)
        userNum2 = selectCardImg(cardNum: userDeck[1], view: userNum2)
        userCardSum = cardSum(userDeck)
        
        dealerDeck = [gameDeck[2], gameDeck[3]]
        dealerNum1 = selectCardImg(cardNum: dealerDeck[0], view: dealerNum1)
        dealerNum2.image = UIImage(named: "cardBack.png")
        dealerCardSum = cardSum(dealerDeck)
        
        // 게임 진행
        // # Case. 딜러의 카드 합이 16이하일 때, 딜러가 한장 더 받음.
        if dealerCardSum <= 16
        {
            nextBtn.tag = 0
            nextBtn.addTarget(self, action: #selector(nextBtnAction(_:)), for: .touchUpInside)
            gameStatusLb.text =
            """
            딜러 카드의 합이 16이하이기 때문에
            딜러가 한장의 카드를 더 받습니다.
            Next 버튼을 눌러주세요.
            """
        } else
        {
            gameStatusLb.text =
            """
            딜러 카드의 합이 17 이상입니다.
            Hit, Stand 중 하나의 버튼을 선택해 주세요.
            Hit : 카드 1장 추가 / Stand : 카드 그만받기
            """
            hitBtn.tag = 0
            hitBtn.addTarget(self, action: #selector(hitBtnAction(_:)), for: .touchUpInside)
        }
        
        print(gameDeck)
        print("userDeck : ", userDeck, "카드 합 : ", userCardSum)
        print("dealerDeck : ", dealerDeck, "카드 합 : ", dealerCardSum)
    }
    
    /// 게임 카드 덱 생성. 1~13까지의 숫자 랜덤으로 4장 생성
    func randomNum() -> [Int] {
        var numList: [Int] = []
        while numList.count != 4 {
            let randomNum: Int = Int(arc4random_uniform(52)) + 1
            if !numList.contains(randomNum) {
                numList.append(randomNum)
            }
        }
        return numList
    }

    // 선택된 카드의 이미지 나오게 하는 함수
    func selectCardImg(cardNum: Int, view: UIImageView) -> UIImageView
    {
        var cardDeck: [Int:String] = [:]
        cardDeck = [1:"clubsAce", 2:"clubs2", 3:"clubs3", 4:"clubs4", 5:"clubs5", 6:"clubs6", 7:"clubs7", 8:"clubs8", 9:"clubs9", 10:"clubs10", 11:"clubsJack", 12:"clubsQueen", 13:"clubsKing", 14:"ace_of_diamonds", 15: "2_of_diamonds", 16:"3_of_diamonds", 17:"4_of_diamonds", 18:"5_of_diamonds", 19:"6_of_diamonds", 20:"7_of_diamonds", 21:"8_of_diamonds", 22:"9_of_diamonds", 23:"10_of_diamonds", 24:"jack_of_diamonds2", 25:"queen_of_diamonds2", 26:"king_of_diamonds2", 27:"ace_of_hearts", 28:"2_of_hearts", 29:"3_of_hearts", 30:"4_of_hearts", 31:"5_of_hearts", 32:"6_of_hearts", 33:"7_of_hearts", 34:"8_of_hearts", 35:"9_of_hearts", 36:"10_of_hearts", 37:"jack_of_hearts2", 38:"queen_of_hearts2", 39:"king_of_hearts2", 40:"ace_of_spades2", 41:"2_of_spades", 42:"3_of_spades", 43:"4_of_spades", 44:"5_of_spades", 45:"6_of_spades", 46:"7_of_spades", 47:"8_of_spades", 48:"9_of_spades", 49:"10_of_spades", 50:"jack_of_spades2", 51:"queen_of_spades2", 52:"king_of_spades2"]
        
        let str: String = cardDeck[cardNum]!+".png"
        view.image = UIImage(named: str)
        return view
    }
    
    // 받은 카드의 합을 알려주는 함수.
    // Ace는 1. 잭, 퀸, 킹은 10으로 처리.
    func cardSum(_ list: [Int]) -> Int {
        var sum: Int = 0
        for index in 0..<list.count
        {
            let num = list[index] % 13
            if num <= 10 && num > 0
            {
                sum += num
            } else
            {
                sum += 10
            }
        }
        return sum
    }
    
    // next버튼 액션
    // 게임 상황에 따라 next버튼의 태그값 변경
    
    @objc func nextBtnAction(_ sender: UIButton) {
        switch sender.tag {
            
        // 0~2 : 딜러 카드의 합이 16 이하일 때, 딜러가 카드를 한장씩 더 받음
        case 0:
            cardPass(who: "dealer")
            dealerNum3.image = UIImage(named: "cardBack.png")
            dealerCardSumBelow16()
        case 1:
            cardPass(who: "dealer")
            dealerNum4.image = UIImage(named: "cardBack.png")
            dealerCardSumBelow16()
        case 2:
            cardPass(who: "dealer")
            dealerNum5.image = UIImage(named: "cardBack.png")
            dealerCardSumBelow16()
            
        // 10~ : 유저 hit 선택. 유저 카드 공개.
        case 10:
            userNum3 = selectCardImg(cardNum: userDeck[2], view: userNum3)
            userDeckSumCheck()
        case 11:
            userNum4 = selectCardImg(cardNum: userDeck[3], view: userNum4)
            userDeckSumCheck()
        case 12:
            userNum5 = selectCardImg(cardNum: userDeck[4], view: userNum5)
            userDeckSumCheck()
            
        // 20~ : 카드 공개
        case 20:
            dealerCardOpen()
        case 21:
            dealerCardOpen()
            gameResult()
            
        default:
            print("nextBtn error")
        }
    }
    
    // 딜러 카드의 합이 16 이하일 경우 카드 한 장 더 추가.
    func dealerCardSumBelow16()
    {
        dealerCardSum = cardSum(dealerDeck)
        if dealerCardSum <= 16
        {
            nextBtn.tag += 1
        } else
        {
            gameStatusLb.text =
            """
            딜러 카드의 합이 17 이상입니다.
            Hit, Stand 중 하나의 버튼을 선택해 주세요.
            Hit : 카드 1장 추가 / Stand : 카드 그만받기
            """
        }
    }
    
    // 카드 받기 >> 게임 덱에 없는 카드 1장 랜덤 생성.
    func cardPass(who: String) {
        let deckCount = gameDeck.count + 1
        while gameDeck.count != deckCount {
            let randomNum: Int = Int(arc4random_uniform(13)) + 1
            if !gameDeck.contains(randomNum) {
                gameDeck.append(randomNum)
                if who == "user" {
                    userDeck.append(randomNum)
                } else if who == "dealer"
                {
                    dealerDeck.append(randomNum)
                }
            }
        }
    }
    
    // hit 버튼 액션
    @objc func hitBtnAction(_ sender: UIButton) {
        gameStatusLb.text =
        """
        hit 버튼을 눌렀습니다.
        next 버튼을 누르면 받은 카드를 공개합니다.
        """
        // # Case. 딜러의 카드 합이 16이하일 때, 딜러가 한장 더 받음.
        if dealerCardSum <= 16
        {
            nextBtn.tag = 0
            nextBtn.addTarget(self, action: #selector(nextBtnAction(_:)), for: .touchUpInside)
            gameStatusLb.text =
            """
            딜러가 한장의 카드를 더 받습니다.
            Next 버튼을 눌러주세요.
            """
        } else
        {
            gameStatusLb.text =
            """
            Hit, Stand 중 하나의 버튼을 선택해 주세요.
            Hit : 카드 1장 추가 / Stand : 카드 그만받기
            """
            hitBtn.tag = 0
            hitBtn.addTarget(self, action: #selector(hitBtnAction(_:)), for: .touchUpInside)
        }
        
        switch hitBtn.tag {
        case 0:
            cardPass(who: "user")
            userNum3.image = UIImage(named: "cardBack.png")
            nextBtn.tag = 10
            nextBtn.addTarget(self, action: #selector(nextBtnAction(_:)), for: .touchUpInside)
        case 1:
            cardPass(who: "user")
            userNum4.image = UIImage(named: "cardBack.png")
            nextBtn.tag = 11
        case 2:
            cardPass(who: "user")
            userNum5.image = UIImage(named: "cardBack.png")
            nextBtn.tag = 12
        default:
            print("error hitBtnAction")
        }
        
    }
    
    // stand 버튼 액션
    @IBAction func standBtnAction(_ sender: Any) {
        nextBtn.tag = 21
        gameStatusLb.text =
        """
        stand 버튼을 눌렀습니다.
        next 버튼을 누르면 딜러 카드를 오픈합니다.
        """
    }
    
    // 유저 카드 합 판단
    func userDeckSumCheck() {
        userCardSum = cardSum(userDeck)
        if userCardSum > 21
        {
            nextBtn.tag = 21
            gameStatusLb.text =
            """
            카드의 합이 21을 초과했습니다.
            next 버튼을 누르면 딜러 카드를 오픈합니다.
            """
        } else if userCardSum == 21
        {
            nextBtn.tag = 20
            gameStatusLb.text =
            """
            카드의 합이 21입니다.
            stand 버튼을 눌러주세요.
            """
        } else if userCardSum < 21
        {
            gameStatusLb.text =
            """
            카드의 합이 21 미만입니다.
            카드를 더 받으시려면 hit 버튼을,
            중단하려면 stand 버튼을 눌러주세요.
            """
            hitBtn.tag += 1
        }
    }
    
    // 딜러 카드 오픈
    func dealerCardOpen() {
        dealerNum2 = selectCardImg(cardNum: dealerDeck[1], view: dealerNum2)
        switch dealerDeck.count {
        case 3:
            dealerNum3 = selectCardImg(cardNum: dealerDeck[2], view: dealerNum3)
        case 4:
            dealerNum3 = selectCardImg(cardNum: dealerDeck[2], view: dealerNum3)
            dealerNum4 = selectCardImg(cardNum: dealerDeck[3], view: dealerNum4)
        case 5:
            dealerNum3 = selectCardImg(cardNum: dealerDeck[2], view: dealerNum3)
            dealerNum4 = selectCardImg(cardNum: dealerDeck[3], view: dealerNum4)
            dealerNum5 = selectCardImg(cardNum: dealerDeck[4], view: dealerNum5)
        default:
            print("sender.tag == 20 error")
        }
    }
    
    
    // 결과 판단
    func gameResult() {
        roundCount += 1
        
        if dealerCardSum > 21 && userCardSum > 21
        {
            gameStatusLb.text =
            """
            딜러, 유저 모두 21점을 초과하였습니다.
            무승부입니다.
            """
        } else if dealerCardSum > 21 && userCardSum <= 21
        {
            gameStatusLb.text =
            """
            딜러가 21점을 초과하였습니다.
            유저가 승리하였습니다.
            """
            userScoreCount += 1
        } else if dealerCardSum <= 21 && userCardSum > 21
        {
            gameStatusLb.text =
            """
            유저 카드의 합이 21을 초과했습니다.
            딜러가 승리하였습니다.
            """
            dealerScoreCount += 1
        } else if dealerCardSum <= 21 && userCardSum <= 21
        {
            if dealerCardSum > userCardSum
            {
                gameStatusLb.text =
                """
                딜러: \(dealerCardSum)점, 유저: \(userCardSum)점으로
                딜러가 승리하였습니다.
                """
                dealerScoreCount += 1
            } else if dealerCardSum < userCardSum
            {
                gameStatusLb.text =
                """
                딜러: \(dealerCardSum)점, 유저: \(userCardSum)점으로
                유저가 승리하였습니다.
                """
                userScoreCount += 1
            } else if dealerCardSum == userCardSum
            {
                gameStatusLb.text =
                """
                딜러: \(dealerCardSum)점, 유저: \(userCardSum)점으로
                무승부입니다.
                """
            }
        }
    }
    
    
    func clear()
    {
        gameDeck = []
        userDeck = []
        dealerDeck = []
        
        userCardSum = 0
        dealerCardSum = 0
        
        dealerNum3.image = nil
        dealerNum4.image = nil
        dealerNum5.image = nil
        
        userNum3.image = nil
        userNum4.image = nil
        userNum5.image = nil
        
        nextBtn.tag = 0
        hitBtn.tag = 0
        
        gameHistory()
        
        // 라운드, 스코어 저장
        if var userInfo = UserDefaults.standard.array(forKey: UserInfoKey) as? [[String:String]], let userID = UserDefaults.standard.string(forKey: "userID")
        {
            for index in 0..<userInfo.count
            {
                if userInfo[index]["id"] == userID
                {
                    if let round = userInfo[index]["round"]
                    {
                        roundLb.text = "Round \(round)"
                        dealerScore.text = userInfo[index]["dealerScore"]
                        userScore.text = userInfo[index]["userScore"]
                    } else
                    {
                        roundLb.text = "Round \(roundCount)"
                        dealerScore.text = String(dealerScoreCount)
                        userScore.text = String(userScoreCount)
                    }
                    break
                }
            }
        }
    }
    
    
    @IBAction func mainBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 라운드, 스코어 저장
    private func gameHistory() {
        if var userInfo = UserDefaults.standard.array(forKey: UserInfoKey) as? [[String:String]], let userID = UserDefaults.standard.string(forKey: "userID")
        {
            for index in 0..<userInfo.count
            {
                if userInfo[index]["id"] == userID
                {
                    if let _ = userInfo[index]["round"]
                    {
                        userInfo[index].updateValue(String(userScoreCount), forKey: "userScore")
                        userInfo[index].updateValue(String(dealerScoreCount), forKey: "dealerScore")
                        userInfo[index].updateValue(String(roundCount), forKey: "round")
                        UserDefaults.standard.set(userInfo, forKey: UserInfoKey)
                        print(userInfo[index])
                    }
                }
            }
        }
    }
    
    
    // 라운드, 스코어 저장
    override func viewWillAppear(_ animated: Bool) {
        if var userInfo = UserDefaults.standard.array(forKey: UserInfoKey) as? [[String:String]], let userID = UserDefaults.standard.string(forKey: "userID")
        {
            for index in 0..<userInfo.count
            {
                if userInfo[index]["id"] == userID
                {
                    if let round = userInfo[index]["round"]
                    {
                        roundLb.text = "Round \(round)"
                        dealerScore.text = userInfo[index]["dealerScore"]
                        userScore.text = userInfo[index]["userScore"]
                        
                        dealerScoreCount = Int(dealerScore.text!)!
                        userScoreCount = Int(userScore.text!)!
                        roundCount = Int(round)!
                    } else
                    {
                        roundLb.text = "Round \(roundCount)"
                        dealerScore.text = String(dealerScoreCount)
                        userScore.text = String(userScoreCount)
                    }
                    break
                }
            }
        }
    }
}

