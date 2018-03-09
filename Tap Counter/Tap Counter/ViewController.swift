//
//  ViewController.swift
//  Tap Counter
//
//  Created by Pash DeVore on 3/8/18.
//  Copyright © 2018 Pash DeVore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var tapCounter: UILabel!
    
    //MARK: Actions
    
    @IBAction func tap(_ sender: UIButton) {
        counter += 1
    }
    
    @IBAction func reset(_ sender: UIButton) {
        counter = 0
    }
    
    //MARK: Properties
    
    var counter: Int = 0 {
        willSet{
            tapCounter.text = String(newValue)
        }
    }
    
    //MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

