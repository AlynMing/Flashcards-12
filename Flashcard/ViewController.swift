//
//  ViewController.swift
//  Flashcard
//
//  Created by Shuxin Zhou on 2/15/20.
//  Copyright © 2020 Shuxin Zhou. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var answer1: String?
    var answer2: String?
    var answer4: String?
}

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var Prev: UIButton!
    
    //creating array for flashcards
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //for the main card aesthetics
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.3
        backLabel.layer.borderColor = #colorLiteral(red: 1, green: 0.679359138, blue: 0.9562004209, alpha: 1)
        backLabel.layer.borderWidth = 3.0
        
        //button aesthetics
        Button1.layer.cornerRadius = 20.0
        Button2.layer.cornerRadius = 20.0
        Button3.layer.cornerRadius = 20.0
        Button4.layer.cornerRadius = 20.0
        Button1.clipsToBounds = true
        Button2.clipsToBounds = true
        Button3.clipsToBounds = true
        Button4.clipsToBounds = true
        //creating the border colors
        Button1.layer.borderColor = #colorLiteral(red: 1, green: 0.679359138, blue: 0.9562004209, alpha: 1)
        Button1.layer.borderWidth = 3.0
        Button2.layer.borderColor = #colorLiteral(red: 1, green: 0.679359138, blue: 0.9562004209, alpha: 1)
        Button2.layer.borderWidth = 3.0
        Button3.layer.borderColor = #colorLiteral(red: 1, green: 0.679359138, blue: 0.9562004209, alpha: 1)
        Button3.layer.borderWidth = 3.0
        Button4.layer.borderColor = #colorLiteral(red: 1, green: 0.679359138, blue: 0.9562004209, alpha: 1)
        Button4.layer.borderWidth = 3.0
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "Where was Shuxin born?", answer: "Kaiping, China", answer1: "San Francisco, CA", answer2: "Los Angeles, CA", answer4: "Guangzhou, China", isExisting: false)
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
    }
    //didTapFlashcard
    @IBAction func didTapButton(_ sender: Any) {
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        }
        else {
            frontLabel.isHidden = false
        }
    }
    
    //void return, so took out the -> return type
    func updateFlashcard(question: String, answer: String, answer1: String?, answer2: String?, answer4: String?, isExisting: Bool){
        let flashcard = Flashcard(question: question, answer: answer, answer1: answer1, answer2: answer2, answer4: answer4)

        if isExisting {
            print(currentIndex)
            flashcards[currentIndex] = flashcard
        }
        else {
        flashcards.append(flashcard)
        
        print("Added new flaschard")
        print("Now we have \(flashcards.count) flashcards")
        currentIndex = flashcards.count-1
        print("Our current index is \(currentIndex)")
        }
        //updates the next and prev buttons
        updateNextPrevButtons()
               
        //will update the flashcard itself and my answers
        updateLabels()
               
        //saves cards to disk
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1 {
            Next.isEnabled = false
        }
        else {
            Next.isEnabled = true
        }
        if currentIndex == 0 {
            Prev.isEnabled = false
        }
        else {
            Prev.isEnabled = true
        }
    }
    
    func updateLabels() {
        //get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //update Labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
        //update buttons
        Button1.setTitle(currentFlashcard.answer1, for: .normal)
        Button2.setTitle(currentFlashcard.answer2, for: .normal)
        Button3.setTitle(currentFlashcard.answer, for: .normal)
        Button4.setTitle(currentFlashcard.answer4, for: .normal)
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        //increase current index by 1
        currentIndex = currentIndex + 1
        //update labels
        updateLabels()
        //update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        //decrease current index by one
        currentIndex = currentIndex - 1
        //update labels
        updateLabels()
        //update buttons
        updateNextPrevButtons()
    }
    
    //First option
    @IBAction func didTapButton1(_ sender: Any) {
        frontLabel.isHidden = false
    }
    
    //Second option
    @IBAction func didTapButton2(_ sender: Any) {
        frontLabel.isHidden = false
    }
    
    //Third option
    @IBAction func didTapButton3(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    //Fourth option
    @IBAction func didTapButton4(_ sender: Any) {
        frontLabel.isHidden = false
    }
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
        }
        
        alert.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        
        present(alert, animated:true)
    }
    
    func deleteCurrentFlashcard(){
        flashcards.remove(at: currentIndex)
        
        if currentIndex > flashcards.count - 1 {
            currentIndex = flashcards.count - 1
        }
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    @IBOutlet weak var card: UIView!
    
    func saveAllFlashcardsToDisk() {
        let dictionaryArray = flashcards.map { (card) -> [String: String?] in return ["question": card.question, "answer": card.answer, "answer1": card.answer1, "answer2": card.answer2, "answer4": card.answer4]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("Flashcards saved to UserDefaults")
    }
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionaryArray.map {
                dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, answer1: dictionary["answer1"]!, answer2: dictionary["answer2"]!, answer4: dictionary["answer4"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
        if segue.identifier == "EditSegue" { creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
    }
    
}

