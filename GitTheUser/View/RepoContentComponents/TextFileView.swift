//
//  TextFileView.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/19/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class TextFileView: UIView,HideViewDelegate {
    
    let textFileView = UIView()
    let textFileContentView = UIView()
    let backButton = BackButton()
    
    let fileNameLabel: UILabel = {
       
        let label = UILabel()
        label.text = "app.js"
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = darkPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let textContentView: UITextView = {
       
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 18)

        return textView
    }()

    func showTextView() {
        
        
        //Window is full screen view.
        if let window = UIApplication.shared.keyWindow {
            
            
            textFileView.addSubview(backButton)
            textFileView.addSubview(fileNameLabel)
            textFileView.addSubview(textContentView)
            
            window.addSubview(textFileView)
            
            textFileView.backgroundColor = .white
            textFileView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 0)
            
            fileNameLabel.topAnchor.constraint(equalTo: textFileView.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
            fileNameLabel.leadingAnchor.constraint(equalTo: textFileView.leadingAnchor, constant: 40).isActive = true
            fileNameLabel.trailingAnchor.constraint(equalTo: textFileView.trailingAnchor, constant: -40).isActive = true
            
            textContentView.topAnchor.constraint(equalTo: fileNameLabel.bottomAnchor, constant: 35).isActive = true
            textContentView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -25).isActive = true
            textContentView.leadingAnchor.constraint(equalTo: textFileView.leadingAnchor, constant: 40).isActive = true
            textContentView.trailingAnchor.constraint(equalTo: textFileView.trailingAnchor, constant: -40).isActive = true
            
            backButton.alpha = 1
            backButton.centerXAnchor.constraint(equalTo: textFileView.centerXAnchor).isActive = true
            backButton.bottomAnchor.constraint(equalTo: textFileView.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
            backButton.isUserInteractionEnabled = true
            
            UIView.animate(withDuration: 0.5) {
                self.textFileView.frame = CGRect(x: 0, y: 0, width: window.frame.width, height: window.frame.height)
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backButton.hideViewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideView() {
        
        self.textContentView.text = ""
        if let window = UIApplication.shared.keyWindow {
            UIView.animate(withDuration: 0.5) {
                self.textFileView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 0)
                self.backButton.alpha = 0
            }
        }
        
    }
    
}

class BackButton: UIButton {
    
    weak var hideViewDelegate: HideViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        guard let arrowImg = UIImage(named: "arrowDown") else { return  }
        setImage(arrowImg, for: .normal)
        addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismiss() {
       self.hideViewDelegate?.hideView()
    }
}
