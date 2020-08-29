//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var questionLabel: UILabel!
  @IBOutlet var buttonA: UIButton!
  @IBOutlet var buttonB: UIButton!
  @IBOutlet var buttonC: UIButton!
  @IBOutlet var progressBar: UIProgressView!
  
  var quizBrain = QuizBrain()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!
    let isCorrect = quizBrain.checkAnswer(userAnswer)
    
    if isCorrect {
      sender.backgroundColor = UIColor.green
    } else {
      sender.backgroundColor = UIColor.red
    }
    
    quizBrain.nextQuestion()
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
  }
  
  @objc func updateUI(){
    let currentQuestion:Question = quizBrain.getQuestion()
    
    questionLabel.text = currentQuestion.question
    buttonA.setTitle(currentQuestion.answers[0], for: .normal)
    buttonB.setTitle(currentQuestion.answers[1], for: .normal)
    buttonC.setTitle(currentQuestion.answers[2], for: .normal)
    progressBar.setProgress(quizBrain.getProgress(), animated: true)
    scoreLabel.text = "Score: \(quizBrain.getScore())"
    
    buttonA.backgroundColor = UIColor.clear
    buttonB.backgroundColor = UIColor.clear
    buttonC.backgroundColor = UIColor.clear
    
  }
  
}

