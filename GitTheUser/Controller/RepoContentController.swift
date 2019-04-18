//
//  RepoContentController.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class RepoContentController: UIViewController, UITableViewDelegate {
    
    var repo: Repo?
    var repoContentTableView: UITableView!
    let dataSource = RepoContentDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = .white
        repoContentTableView = UITableView()
        repoContentTableView.translatesAutoresizingMaskIntoConstraints = false
        guard let repo = repo else { return }
        
        dataSource.files = repo.files
        repoContentTableView.register(RepoContentDataCell.self, forCellReuseIdentifier: fileTableCellId)
        repoContentTableView.dataSource = dataSource
        repoContentTableView.delegate = self
        repoContentTableView.tableFooterView = UIView()
        repoContentTableView.rowHeight = UITableView.automaticDimension
        repoContentTableView.estimatedRowHeight = 60
        repoContentTableView.separatorColor = UIColor.clear
        
        view.addSubview(gitProfLabel)
        view.addSubview(gitRepoUnderLabel)
        view.addSubview(repoContentTableView)
        
        setUp()
    }
    
    
    func setUp() {
        
        guard let repo = repo else { return }
        
        repoContentTableView.reloadData()
        gitProfLabel.text = repo.name
        
        gitProfLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        gitProfLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gitRepoUnderLabel.topAnchor.constraint(equalTo: gitProfLabel.bottomAnchor).isActive = true
        gitRepoUnderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        repoContentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        repoContentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        repoContentTableView.topAnchor.constraint(equalTo: gitRepoUnderLabel.bottomAnchor, constant: 80).isActive = true
        repoContentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repo = repo else { return }
        guard let files = repo.files else { return }
        let file = files[indexPath.row]
        print(file.path)
        if (file.type! == "dir") {
            //Downloading folder content and presenting next view
            
        } else if (file.type! == "file") {
            //Presenting file content
            print("File")
        }
    }
    
}
