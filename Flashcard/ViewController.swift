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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
}

