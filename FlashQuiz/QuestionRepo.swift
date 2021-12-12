//
//  QuestionRepo.swift
//  FlashQuiz
//
//  Created by Eshwar S on 12/12/21.
//

import Foundation
struct QuestionRepo {
    var questions : [String:[Question]]
    var points: Int
    init() throws {
        try self.questions = [
                "javascript": [Question(content: "Function captures it's lexical environment, what is this called?", options: ["Closure", "Prototype Inhertiance", "Capture Pattern", "None of the above"], answerIndex: 0)]
            ]
        self.points = 0;
       
    }
    
    mutating func getQuestionsOfType(_ questionType: String)->[Question]?{
        points = 0;
        return questions[questionType]
    }
    
    func getPoints()-> Int{
        return points
    }
    
    mutating func checkAnswer(question: Question, givenIndex: Int)->Bool{
        if(question.isCorrect(givenIndex:givenIndex)){
            points += 1;
            return true
        }
        return false
    }
    
        
}
