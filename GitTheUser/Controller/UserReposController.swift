//
//  UserReposController.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/13/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class UserReposController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var user: User?
    var repoTableView: UITableView!
    let cellId = "cellId"
    var gitProfInfo : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        view.backgroundColor = .white
        gitProfInfo = gitProfLabel
        
        gitProfInfo.text = user?.name
        
        
        repoTableView = UITableView(frame: .zero, style: .plain)
        repoTableView.register(RepoTableCell.self, forCellReuseIdentifier: cellId)
        repoTableView.dataSource = self
        repoTableView.delegate = self
        repoTableView.rowHeight = UITableView.automaticDimension
        repoTableView.estimatedRowHeight = 70
        view.addSubview(repoTableView)
        view.addSubview(gitProfInfo)
        view.addSubview(gitProfUnderLabel)
        
        setUp()
    }
    
    func setUp() {

        navigationItem.title = ""
        //Navigation bar customization
        
        navigationController?.navigationBar.tintColor = nicePink
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: nicePink]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        repoTableView.backgroundColor = .white
        repoTableView.separatorColor = lightPurple
        repoTableView.separatorStyle = .singleLine
        repoTableView.translatesAutoresizingMaskIntoConstraints = false
        repoTableView.tableFooterView = UIView()
        repoTableView.topAnchor.constraint(equalTo: gitProfUnderLabel.bottomAnchor, constant: 80).isActive = true
        repoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        repoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        repoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true

        gitProfInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        gitProfInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        gitProfUnderLabel.topAnchor.constraint(equalTo: gitProfInfo.bottomAnchor).isActive = true
        gitProfUnderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let user = user else { return 0 }
        return user.repositories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RepoTableCell
        cell.repoName = user?.repositories[indexPath.section].name
        cell.repoLanguage = user?.repositories[indexPath.section].language
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRepo = user?.repositories[indexPath.section]
        let repoContentController = RepoContentController()
        repoContentController.repo = selectedRepo
        
        self.navigationController?.pushViewController(repoContentController, animated: true)
    }

    
}

