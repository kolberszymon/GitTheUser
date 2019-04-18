//
//  TextFileView.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/19/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class TextFileView: NSObject {
    
    let textView = UIView()
    
    func showTextView() {
        
        if let window = textView.superview {
            
            textView.backgroundColor = .blue
            window.addSubview(textView)
            textView.frame  = window.frame
            
        }
        
    }
    
    override init() {
        super.init()
    }
    
}
