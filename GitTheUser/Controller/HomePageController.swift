//
//  ViewController.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/11/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class HomePageController: UIViewController, PushViewDelegate, ChangeValidUserDelegate {
    
    //MARK: --Declaring components
    
    let mainTitle = MainTitle(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let gitTheUserButton = GitTheUserButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let userNotFoundView = UserNotFoundView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var validUser: Bool = true
    
    //MARK: --Initializing
    //Also UX handling
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        //delegating self in order to send view to present next
        gitTheUserButton.delegate = self
        gitTheUserButton.validUserDelegate = self
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //MARK: --Custom protocols function
    
    func didTapButton(ViewToPresent: UIViewController) {
        self.navigationController?.pushViewController(ViewToPresent, animated: true)
    }
    
    func changeValidUser(boolean: Bool) {
        self.userNotFoundView.isHidden = boolean
        UIView.animate(withDuration: 0.1, animations: {
            self.userNotFoundView.frame.origin.x -= 10
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.userNotFoundView.frame.origin.x += 10
            })
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        view.addSubview(mainTitle)
        view.addSubview(userInput)
        view.addSubview(gitTheUserButton)
        view.addSubview(userNotFoundView)
        
        if validUser {
            userNotFoundView.isHidden = true
        }
        
        setUpThings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        validUser = true
    }
    
    func setUpThings() {
        
        view.backgroundColor = .white
        
        userInput.translatesAutoresizingMaskIntoConstraints = false
        userInput.setLeftPaddingPoints(15)
        userInput.setRightPaddingPoints(15)
        
        mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainTitle.heightAnchor.constraint(equalTo: mainTitle.heightAnchor).isActive = true
        
        userInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userInput.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 130).isActive = true
        userInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userInput.widthAnchor.constraint(equalToConstant: 237).isActive = true
        
        gitTheUserButton.topAnchor.constraint(equalTo: userInput.bottomAnchor, constant: 100).isActive = true
        gitTheUserButton.heightAnchor.constraint(equalToConstant: 41).isActive = true
        gitTheUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gitTheUserButton.widthAnchor.constraint(equalToConstant: 237).isActive = true
        
        userNotFoundView.topAnchor.constraint(equalTo: userInput.bottomAnchor, constant: 10).isActive = true
        userNotFoundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
