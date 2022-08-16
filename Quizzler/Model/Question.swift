//
//  Question.swift
//  Quizzler
//
//  Created by Daniela Lima on 2022-07-02.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
