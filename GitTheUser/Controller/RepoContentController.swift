//
//  RepoContentController.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class RepoContentController: UIViewController {
    
    var repo: Repo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = .white
        view.addSubview(gitProfLabel)
        
        setUp()
    }
    
    func setUp() {
        
        guard let repo = repo else { return }
        
        gitProfLabel.text = repo.name
        
        gitProfLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        gitProfLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
}
