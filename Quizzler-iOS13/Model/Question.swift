//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by iOS Dev on 29/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
  
  let question:String
  let answers: [String]
  let correctAnswer: String
  
  init(q:String, a:[String], correctAnswer:String) {
    question = q
    answers = a
    self.correctAnswer = correctAnswer
  }
  
}
