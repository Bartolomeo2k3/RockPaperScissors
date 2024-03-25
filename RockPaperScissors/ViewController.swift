//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Bartolomeo Davide Ventrone on 23/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var myHand = ""
    let hands = ["👊🏼", "✋🏼", "✌🏼"]
    let losesAgainst = ["👊🏼": "✌🏼", "✋🏼": "👊🏼", "✌🏼": "✋🏼"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectRock(_ sender: Any) {
        myHand = "👊🏼"
        label.text = "You've selected \(myHand)"
        generateHapticFeedback()
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        myHand = "✋🏼"
        label.text = "You've selected \(myHand)"
        generateHapticFeedback()
    }
    
    @IBAction func selectScissors(_ sender: Any) {
        myHand = "✌🏼"
        label.text = "You've selected \(myHand)"
        generateHapticFeedback()
    }
    func generateHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
    
    func finishGame(){
        var message = ""
        let CPUhand = hands.randomElement()!
        if CPUhand == myHand{
          message = "It's a DRAW!"
        }else if losesAgainst[CPUhand] == myHand{
            message = "CPU Wins!"
        }else{
            message = "You Won!"
        }
        label.text = "You've selected \(myHand)\nCPU selected \(CPUhand)\n\(message)"
    }
    
    @IBAction func play(_ sender: Any) {
        var counter = 3
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if counter > 0 {
                self.label.text = "You've selected \(self.myHand)\n\(counter)"
            }else {
                timer.invalidate()
                self.finishGame()
            }
            counter -= 1
        }
        generateHapticFeedback()
    }
}

