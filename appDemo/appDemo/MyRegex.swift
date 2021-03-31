//
//  MyRegex.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/17.
//

import Foundation

//MARK: - Regular Expression
struct MyRegex {
     let regex: NSRegularExpression?
     init (_ pattern: String) {
        var _: NSError?
        regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
     }
     
     func match(_ input: String) -> Bool {
        if let matches = regex?.matches(in: input, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange (0, input.count)) {
                 return matches.count > 0
         } else {
             return false
         }
     }
}
