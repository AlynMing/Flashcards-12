//
//  ViewController.swift
//  Flashcard
//
//  Created by Shuxin Zhou on 2/15/20.
//  Copyright © 2020 Shuxin Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
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
    }

    @IBAction func didTapButton(_ sender: Any) {
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        }
        else {
            frontLabel.isHidden = false
        }
    }
    
    @IBAction func didTapButton1(_ sender: Any) {
        frontLabel.isHidden = false
    }
    
    @IBAction func didTapButton2(_ sender: Any) {
        frontLabel.isHidden = false
    }
    
    @IBAction func didTapButton3(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapButton4(_ sender: Any) {
        frontLabel.isHidden = false
    }
    
    @IBOutlet weak var card: UIView!
    
}

