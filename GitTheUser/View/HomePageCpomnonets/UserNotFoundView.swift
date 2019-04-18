//
//  UserNotFoundView.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/18/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class UserNotFoundView: UIView {
    
    let textInfoLabel: UILabel = {
       
        let textInfoLabel = UILabel()
        textInfoLabel.text = "User not found"
        textInfoLabel.textColor = nicePink
        textInfoLabel.font = UIFont.systemFont(ofSize: 14)
        textInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        return textInfoLabel
    }()
    
    let warningImgView: UIImageView = {
       
        guard let warningImg = UIImage(named: "warning") else { return UIImageView() }
        let warningImgView = UIImageView(image: warningImg)
        warningImgView.translatesAutoresizingMaskIntoConstraints = false
        return warningImgView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    
        addSubview(textInfoLabel)
        addSubview(warningImgView)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        widthAnchor.constraint(equalToConstant: 100).isActive = true
        heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        textInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textInfoLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        warningImgView.leadingAnchor.constraint(equalTo: textInfoLabel.trailingAnchor, constant: 3).isActive = true
        warningImgView.widthAnchor.constraint(equalToConstant: 13).isActive = true
        warningImgView.heightAnchor.constraint(equalTo: warningImgView.widthAnchor).isActive = true
        warningImgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
