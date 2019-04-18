//
//  RepoTitleLabel.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/14/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

let gitProfLabel: UILabel = {
    
    let label = UILabel()
    label.textColor = darkPurple
    label.font = UIFont.systemFont(ofSize: 32)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
}()

let gitProfUnderLabel: UILabel = {
   
    let label = UILabel()
    label.textColor = lightPurple
    label.text = "git profile"
    label.font = UIFont.systemFont(ofSize: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
}()

let gitRepoUnderLabel: UILabel = {
   
    let label = UILabel()
    label.textColor = lightPurple
    label.text = "git repo"
    label.font = UIFont.systemFont(ofSize: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
}()
