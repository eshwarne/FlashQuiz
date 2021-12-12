//
//  Question.swift
//  FlashQuiz
//
//  Created by Eshwar S on 12/12/21.
//

import Foundation
enum InvalidQuestion: Error{
    case AnswerIndexOutOfBounds
    case ExactFourOptionsRequired
}
struct Question{
    let content: String
    let options: [String]
    let answerIndex: Int
    init(content: String, options: [String], answerIndex: Int) throws{
        self.content = content;
        self.options = options;
        if answerIndex < options.count {
            self.answerIndex = answerIndex
        } else {
            throw InvalidQuestion.AnswerIndexOutOfBounds
        }
    }
    func getOptions() -> [String]{
        return options;
    }
    func isCorrectAnswerWithText(_ text: String) -> Bool{
        if(text.lowercased() == options[answerIndex].lowercased()){
            return true
        } else {
            return false
        }
    }
}
