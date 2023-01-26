//
//  File.swift
//  ReverseWords
//
//  Created by Dmytro Horodyskyi on 19.01.2023.
//

import Foundation

struct ReverseManager {
    
    func reverseWords(of string: String) -> String{
        string.split(separator: " ").map {String($0.reversed())}.joined(separator: " ")
    }
}
