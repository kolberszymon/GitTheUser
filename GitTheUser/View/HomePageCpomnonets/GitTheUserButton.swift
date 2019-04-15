//
//  GitTheUserButton.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class GitTheUserButton: UIButton {
    
    weak var delegate: PushViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addTarget(self, action: #selector(gitUser), for: .touchUpInside)
        setTitle("Let's do some magic!", for: .normal)
        backgroundColor = nicePink
        setTitleColor(gray, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        layer.shadowColor = nicePink.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.6
        layer.cornerRadius = 23
        layer.shadowOffset = CGSize(width: 0, height: 4.0)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func gitUser() {
        print("working")
        
        var user = User(name: userInput.text!)
        
        URLSession.shared.dataTask(with: user.userUrl) { (data, response, err) in
            
            guard let data = data else { return }
            do {
                //You have to enclose Repo in [] if the object is returning an array as the root
                user.repositories = try JSONDecoder().decode([Repo].self, from: data)
                print(user.repositories)
                print(user.name)
                let userReposVC = UserReposController()
                userReposVC.user = user
                DispatchQueue.main.async(execute: {
                    self.delegate?.didTapButton(ViewToPresent: userReposVC)
                })
                
            } catch {
                //If it could not be decoded it means that we got a message back that there is no such user
                //So here present 404 view
                print("User not found")
            }
            }.resume()
        
    }
    
}
