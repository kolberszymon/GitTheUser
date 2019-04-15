//
//  RepoTableCell.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/14/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class RepoTableCell : UITableViewCell {
    
    var repoName: String?
    var repoLanguage: String?
    
    let repoNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 23)
        lbl.textColor = darkPurple
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let pinkDotImgView : UIImageView = {
        guard let pinkDot = UIImage(named: "pinkDot") else { fatalError() }
        let pinkDotImgView = UIImageView(image: pinkDot)
        pinkDotImgView.translatesAutoresizingMaskIntoConstraints = false
        return pinkDotImgView
    }()
    
    let repoLanguageLabel : UILabel = {
        let repoLanguageLabel = UILabel()
        repoLanguageLabel.textColor = nicePink
        repoLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        return repoLanguageLabel
    }()
    
    let bottomHalfView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        bottomHalfView.addSubview(repoLanguageLabel)
        bottomHalfView.addSubview(pinkDotImgView)
        
        addSubview(repoNameLabel)
        addSubview(bottomHalfView)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        
        repoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        repoNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        repoNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        repoNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
        pinkDotImgView.leadingAnchor.constraint(equalTo: bottomHalfView.leadingAnchor).isActive = true
        pinkDotImgView.widthAnchor.constraint(equalToConstant: 7).isActive = true
        pinkDotImgView.centerYAnchor.constraint(equalTo: bottomHalfView.centerYAnchor).isActive = true
        
        repoLanguageLabel.leadingAnchor.constraint(equalTo: pinkDotImgView.trailingAnchor, constant: 10).isActive = true
        repoLanguageLabel.trailingAnchor.constraint(equalTo: bottomHalfView.trailingAnchor).isActive = true
        repoLanguageLabel.centerYAnchor.constraint(equalTo: bottomHalfView.centerYAnchor).isActive = true
        
        bottomHalfView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomHalfView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomHalfView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomHalfView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
    }
    
    override func layoutSubviews() {
        if let repoName = repoName {
            repoNameLabel.text = repoName
        }
        
        if let repoLanguage = repoLanguage {
            repoLanguageLabel.text = repoLanguage
        } else {
            repoLanguageLabel.text = "None"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

