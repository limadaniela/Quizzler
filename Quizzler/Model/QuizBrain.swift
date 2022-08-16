//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Daniela Lima on 2022-07-02.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    //to keep track on which question the user is reading. Zero is because it matches our zero position
    var questionNumber = 0
    
    //to keep track of score
    var score = 0
    
    //answer checking logic handled by QuizBrain
    //the input of this function will be the answer that the user choose
    //this will look inside our quiz array and it's going to pull out the item in questionNumber position to check if the answer is correct and return true/false
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    //to search through quiz for the one into the position of question number and provide the property of that question
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //if we just use questionNumber, progress bar will start at zero in question 1 and will not reach the end
    //So, we use "questionNumber + 1" and the progress bar start with a little bit of progress to represent question 1 and go through the end
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    //func to handle question progression functionality
    //it will only increase questionNumber as long as not yet the end of the quiz, when else statement will restart it from begining
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
