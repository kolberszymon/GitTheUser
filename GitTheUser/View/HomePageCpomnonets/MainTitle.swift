//
//  MainTitle.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class MainTitle: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(gitHubImgView)
        
        widthAnchor.constraint(equalToConstant: 192).isActive = true
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        gitHubImgView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20).isActive = true
        gitHubImgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        gitHubImgView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        gitHubImgView.widthAnchor.constraint(equalTo: gitHubImgView.heightAnchor).isActive = true
        
    }
    
}

