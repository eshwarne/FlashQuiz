//
//  ViewController.swift
//  FlashQuiz
//
//  Created by Eshwar S on 12/12/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questionRepo.questions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.questionTopics[row].uppercased()
        
    }
    
    

    @IBOutlet weak var questionTypePicker: UIPickerView!
    var questionRepo: QuestionRepo!
    var questionTopics: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            self.questionRepo = try QuestionRepo()
            self.questionTopics = Array(questionRepo.questions.keys)
        } catch{
            print("Error")
        }
        print(self.questionRepo.questions.keys)
        self.questionTypePicker.delegate = self
        self.questionTypePicker.dataSource = self
    }


}

