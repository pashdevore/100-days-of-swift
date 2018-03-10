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
    @IBOutlet weak var tapButton: UIButton!
    
    //MARK: Actions
    
    @IBAction func reset(_ sender: UIButton) {
        counter = 0
    }
    
    //MARK: Properties

    var timer: Timer?
    
    var counter: Int = 0 {
        willSet{
            tapCounter.text = String(newValue)
        }
    }
    
    //MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapButton.addGestureRecognizer(tapGesture)
        
        let holdGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        tapButton.addGestureRecognizer(holdGesture)
    }
    
    //MARK: Gesture Recognizer Methods
    @objc func normalTap(_ sender: UIGestureRecognizer) {
        counter += 1
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer) {
        if (sender.state == .began) {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        } else if (sender.state == .ended || sender.state == .cancelled) {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc func handleTimer() {
        counter += 1
    }
}

