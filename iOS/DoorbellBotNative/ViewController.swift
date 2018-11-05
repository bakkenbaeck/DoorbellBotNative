//
//  ViewController.swift
//  Doorbell-bot Native
//
//  Created by Anders Skaalsveen on 02/11/2018.
//  Copyright © 2018 Bakken &/ Bæck. All rights reserved.
//

import UIKit
import SharedCode

class ViewController: UIViewController {
    
    @IBOutlet private var testLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testLabel.text = CommonKt.createApplicationScreenMessage()
    }
}

