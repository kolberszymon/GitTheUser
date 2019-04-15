//
//  LoginPageComponents.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/12/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

//MARK: --Images

let gitHubImgView: UIImageView = {
   
    guard let img = UIImage(named: "github") else { fatalError("Not required image included") }
    let imgView = UIImageView(image: img)
    imgView.translatesAutoresizingMaskIntoConstraints = false
    return imgView
    
}()

let userImgView: UIImageView = {
    
    guard let img = UIImage(named: "profile") else { fatalError("Not required image included") }
    let imgView = UIImageView(image: img)
    imgView.translatesAutoresizingMaskIntoConstraints = false
    return imgView
    
}()

let behindLogoImgView: UIImageView = {
    
    guard let img = UIImage(named: "behindLogin") else { fatalError("Not required image included") }
    let imgView = UIImageView(image: img)
    imgView.translatesAutoresizingMaskIntoConstraints = false
    return imgView
    
}()

let bottomImgView: UIImageView = {
    
    guard let img = UIImage(named: "bottomImg") else { fatalError("Not required image included") }
    let imgView = UIImageView(image: img)
    imgView.translatesAutoresizingMaskIntoConstraints = false
    return imgView
    
}()




let titleLabel: UILabel = {
   
    let label = UILabel()
    label.textColor = darkPurple
    label.text = "Git a user"
    label.font = UIFont.systemFont(ofSize: 29)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
}()

let userInput: UITextField = {
    
    //Changing color of font to lightPurple
    var placeHolder = NSMutableAttributedString()
    let phText = "Enter a username..."
    
    placeHolder = NSMutableAttributedString(string: phText)
    placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: lightPurple, range: NSRange(location: 0, length: phText.count))
    
    let txtField = UITextField()
    txtField.attributedPlaceholder = placeHolder
    txtField.layer.cornerRadius = 23
    txtField.layer.shadowColor = UIColor.lightGray.cgColor
    txtField.layer.shadowOpacity = 0.5
    txtField.layer.shadowRadius = 6
    txtField.layer.shadowOffset = CGSize(width: 0, height: 4.0)
    txtField.backgroundColor = gray
    txtField.autocorrectionType = .no
    txtField.autocapitalizationType = .none
    txtField.textColor = darkPurple
    txtField.translatesAutoresizingMaskIntoConstraints = false
    return txtField
}()


