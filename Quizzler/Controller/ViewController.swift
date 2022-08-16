//
//  ViewController.swift
//  Quizzler
//
//  Created by Daniela Lima on 2022-07-01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBotton: UIButton!
    @IBOutlet weak var falseBotton: UIButton!
    
    //need this var so we can use QuizBrain inside ViewController
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    //this block of code will be triggered whenever either of the answer buttons are pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
        //checkAnswer is to check the that comes from sender.currentTitle
        //if userGotItRight is equal to true, means they got it right. If false, they got it wrong
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        //because this is a boolean, we can make our check like so
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //we don't need this timer to repeat, so we set repeats as false
        //it runs once, wait for 0.2 seconds, call update UI and ends
        //we don't need to store it in a var, as it only runs once and we don't need to invalidate it
        //If it's a timer that repeats, we need to store it in a var to invalidate it before repeat
        //this func combined with @objc allow the app to change the button color for 0.2 sec, and clear as move to next question
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //this func will be triggered when we load the app and when answer button is presssed in order to change to next question.
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        //.text is used to populate questionLabel properly
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        //to reset the background button color everytime we move to next question
        trueBotton.backgroundColor = UIColor.clear
        falseBotton.backgroundColor = UIColor.clear
    }
}

