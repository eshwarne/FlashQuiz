//
//  ViewController.swift
//  FlashQuiz
//
//  Created by Eshwar S on 12/12/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var questionTypePicker: UIPickerView!
    @IBOutlet weak var questionContentLabel: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    var options: [UIButton]!
    var questionRepo: QuestionRepo!
    var questionTopics: [String]!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questionRepo.questions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.questionTopics[row].uppercased()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            self.questionRepo = try QuestionRepo()
            self.questionTopics = Array(questionRepo.questions.keys)
        } catch{
            print("Error")
        }
        print(self.questionRepo.questions.keys)
        options = [optionOne, optionTwo, optionThree, optionFour]
        self.questionTypePicker.delegate = self
        self.questionTypePicker.dataSource = self
        updateUI()
        
    }
    
    func updateUI(){
        questionContentLabel.text = questionRepo.activeQuestion().content
        var index: Int = 0;
        for option in options {
            option.setTitle(questionRepo.activeQuestion().options[index], for: .normal)
            index += 1
        }
        
    }


}

