//
//  ResultsViewController.swift
//  BibleMadLibs
//
//  Created by Juliana Strawn on 5/4/17.
//  Copyright © 2017 JStrawn. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let mysharedManager = DataAccessObject.sharedManager
    
    var userWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var passage = mysharedManager.passage
        print(passage!)
        
        
        
        for word in userWords {
            if let match = passage!.range(of: "\\<(.*?)\\>", options: .regularExpression) {
                passage!.replaceSubrange(match, with: word)
            }
            
        }
        
        var editedPassage = passage!.replacingOccurrences(of: " .", with: ".")
        editedPassage = editedPassage.replacingOccurrences(of: " ,", with: ",")
        editedPassage = editedPassage.replacingOccurrences(of: " :", with: ":")
        print(editedPassage)
        
    }
    
    
}