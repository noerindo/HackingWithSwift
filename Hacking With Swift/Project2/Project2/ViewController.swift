//
//  ViewController.swift
//  Project2
//
//  Created by Indah Nurindo on 19/11/2565 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button3: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button1: UIButton!
    
    var countries = [String]()
    var score = 0
     var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        // bisa menggunakan code ini selain menggunakan append : countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion(action: nil)
        
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(checkScore))
        
    }
    func askQuestion(action: UIAlertAction! = nil) {
            countries.shuffle()
            // shuffle() untuk mengacak urutan
            correctAnswer = Int.random(in: 0...2)
            questionsAsked += 1
           // random()mengembalikan angka acak
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            title = "Score = \(score) " + "    " + countries[correctAnswer].uppercased()
            //  uppercased() menjadikan tulisan kapital
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
               
            } else {
                title = "Wrong! That’s the flag of \(countries[sender.tag])"
                score -= 1
            }
        if questionsAsked == 10 {
           callAlert(title: "Game Over", message:  "Your score is \(score).", addHandler: true)
            score = 0
             correctAnswer = 0
            questionsAsked = 0
        }
        callAlert(title: title, message: "Your score is \(score).", addHandler: true)
    }
    
    func callAlert(title: String, message: String, addHandler: Bool) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if addHandler {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))

        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        }
        present(ac, animated: true)

    }
    @objc func checkScore(){
        callAlert(title: "Score", message: "Your score is \(score)", addHandler: false)
    }
  
}
