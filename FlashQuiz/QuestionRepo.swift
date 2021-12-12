//
//  QuestionRepo.swift
//  FlashQuiz
//
//  Created by Eshwar S on 12/12/21.
//

import Foundation
struct QuestionRepo {
    var questions : [String:[Question]]
    var currentQuestionTopic: String = "javascript"
    var currentQuestionIndex: Int = 0
    var points: Int
    init() throws {
        try self.questions = [
                "javascript": [
                    Question(content: "Function captures it's lexical environment, what is this called?", options: ["Closure", "Prototype Inhertiance", "Capture Pattern", "None of the above"], answerIndex: 0),
                    Question(content: "Promise code does not execute immediately, it waits in a queue. What is it called?", options: ["Microtask queue", "Queue", "Stack queue", "Task queue"], answerIndex: 0),
                    
                
                ],
                "ios": [
                    Question(content: "Which of the following is an API for macOS?", options: ["Cocoa", "Coffee", "Mocha", "Cappucino"], answerIndex: 0)
                ]
            ]
        self.points = 0;
       
    }
    
    mutating func changeType(_ questionType: String){
        points = 0;
        currentQuestionTopic = questionType;
        currentQuestionIndex = 0;
    }
    
    func getPoints()-> Int{
        return points
    }
    func activeQuestion() -> Question{
        return questions[currentQuestionTopic]![currentQuestionIndex]
    }
    mutating func checkAnswer(givenAnswer: String)->Bool{
        if(questions[currentQuestionTopic]![currentQuestionIndex].isCorrectAnswerWithText(givenAnswer)){
            points += 1;
            return true
        }
        return false
    }
    
    mutating func nextQuestion(){
        currentQuestionIndex = ( currentQuestionIndex + 1 ) % questions[currentQuestionTopic]!.count
    }
    
    
        
}
