//
//  CreationViewController.swift
//  Flashcard
//
//  Created by Shuxin Zhou on 3/4/20.
//  Copyright © 2020 Shuxin Zhou. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var answer: UITextField!

    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var answer4: UITextField!
    
    var flashcardsController: ViewController!
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = initialQuestion
        answer.text = initialAnswer

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = question.text
        let answerText = answer.text
        let answer1Text = answer1.text
        let answer2Text = answer2.text
        
        let answer4Text = answer4.text
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty) {
            
            let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAlert)
            
            present(alert, animated:true)
        } else {
           var isExisting = false
            if initialQuestion != nil {
                isExisting = true
            }
            //calling the update flashcards function to update
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, answer1: answer1Text!, answer2: answer2Text!, answer4: answer4Text!, isExisting: isExisting)
            dismiss(animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
