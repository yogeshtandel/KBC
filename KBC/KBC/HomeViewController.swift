//
//  HomeViewController.swift
//  KBC
//
//  Created by Yogendra Tandel on 01/01/19.
//  Copyright © 2019 Yogendra Tandel. All rights reserved.
//

import UIKit

struct Quiz {
    let Question: String
    let Answers: [String]
    let CorrectAns : Int
}

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var lbl_Question: UILabel!
    @IBOutlet weak var btn_Ans1: UIButton!
    @IBOutlet weak var btn_Ans2: UIButton!
    @IBOutlet weak var btn_Ans3: UIButton!
    @IBOutlet weak var btn_Ans4: UIButton!
    @IBOutlet weak var lbl_Result: UILabel!
     @IBOutlet weak var btn_Next: UIButton!
    
    
    var quizArr = [
            [
                Quiz(Question: "1. What is the tail end of a piece of music?", Answers: ["Coda", "Da Capo", "Forte", "Largo"], CorrectAns: 1),
                Quiz(Question: "2. What is the tail end of a piece of music?", Answers: ["Coda", "Da Capo", "Forte", "Largo"], CorrectAns: 3),
                Quiz(Question: "3. What is the tail end of a piece of music?", Answers: ["Coda", "Da Capo", "Forte", "Largo"], CorrectAns: 4),
                Quiz(Question: "4. What is the tail end of a piece of music?", Answers: ["Coda", "Da Capo", "Forte", "Largo"], CorrectAns: 2)
            ],
            [
                Quiz(Question: "5. Another name for Majestically?", Answers: ["Lunga", "Dolce", "Maestoso", "Molto"], CorrectAns: 3),
                Quiz(Question: "6. Another name for Majestically?", Answers: ["Lunga", "Dolce", "Maestoso", "Molto"], CorrectAns: 4),
                Quiz(Question: "7. Another name for Majestically?", Answers: ["Lunga", "Dolce", "Maestoso", "Molto"], CorrectAns: 2),
                Quiz(Question: "8. Another name for Majestically?", Answers: ["Lunga", "Dolce", "Maestoso", "Molto"], CorrectAns: 1)
            ],
            [
                Quiz(Question: "9. Another name for Time/Speed?", Answers: ["Largo", "Soli", "Tenuto", "Tempo"], CorrectAns: 4),
                Quiz(Question: "10. Another name for Time/Speed?", Answers: ["Largo", "Soli", "Tenuto", "Tempo"], CorrectAns: 3),
                Quiz(Question: "11. Another name for Time/Speed?", Answers: ["Largo", "Soli", "Tenuto", "Tempo"], CorrectAns: 1),
                Quiz(Question: "12. Another name for Time/Speed?", Answers: ["Largo", "Soli", "Tenuto", "Tempo"], CorrectAns: 2)
            ],
            [
                Quiz(Question: "13. Another name for Softly", Answers: ["Piano", "Forte", "Segno", "Tacet"], CorrectAns: 3),
                Quiz(Question: "14. Another name for Softly", Answers: ["Piano", "Forte", "Segno", "Tacet"], CorrectAns: 4),
                Quiz(Question: "15. Another name for Softly", Answers: ["Piano", "Forte", "Segno", "Tacet"], CorrectAns: 1),
                Quiz(Question: "16. Another name for Softly", Answers: ["Piano", "Forte", "Segno", "Tacet"], CorrectAns: 2),
            ]
        ]
    
    var randomInt = 0
    var innerRandomInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       generateQuestion()
        btn_Next.isHidden = true
        btn_Next.addTarget(self, action: #selector(ClickedNext), for: .touchUpInside)
        btn_Ans1.tag = 1
        btn_Ans1.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        btn_Ans2.tag = 2
        btn_Ans2.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        btn_Ans3.tag = 3
        btn_Ans3.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        btn_Ans4.tag = 4
        btn_Ans4.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
    }
    
    @objc func ClickedNext(){
        generateQuestion()
        btn_Next.isHidden = true
    }
    
    func generateQuestion(){
        let mainCount = quizArr.count
        if mainCount>0{
            randomInt = Int.random(in: 0..<mainCount)
            let innerCount = quizArr[randomInt].count
            if innerCount>0{
                innerRandomInt =  Int.random(in: 0..<innerCount)
                
            }else{
                generateQuestion()
                return
            }
            //print("Inner Random Number - \(innerRandomInt)")
            
            lbl_Question.text = quizArr[randomInt][innerRandomInt].Question
            btn_Ans1.setTitle(quizArr[randomInt][innerRandomInt].Answers[0], for: .normal)
            btn_Ans2.setTitle(quizArr[randomInt][innerRandomInt].Answers[1], for: .normal)
            btn_Ans3.setTitle(quizArr[randomInt][innerRandomInt].Answers[2], for: .normal)
            btn_Ans4.setTitle(quizArr[randomInt][innerRandomInt].Answers[3], for: .normal)
            
            lbl_Result.text = ""
        }else{
            lbl_Question.isHidden = true
            btn_Ans1.isHidden = true
            btn_Ans2.isHidden = true
            btn_Ans3.isHidden = true
            btn_Ans4.isHidden = true
            btn_Next.isHidden = true
            lbl_Result.text = "Quiz Over"
            print("Quiz Over")
            return
        }
        
    }
    
    @objc func checkAnswer(sender:UIButton){
        //print(sender.tag)
        let CorrectAns = quizArr[randomInt][innerRandomInt].CorrectAns
        if sender.tag == CorrectAns{
            lbl_Result.text = "Correct Answer"
        }else{
            lbl_Result.text = "Wrong Answer"
        }
        quizArr[randomInt].remove(at: innerRandomInt)
        btn_Next.isHidden = false
        for i in 0..<quizArr.count{
            if quizArr[i].count == 0{
                quizArr.remove(at: i)
                break
            }
        }
        
    }

}
