//
//  RepoContentController.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit
import Highlightr

class RepoContentController: UIViewController, UITableViewDelegate {
    
    var repo: Repo?
    var repoContentTableView: UITableView!
    let dataSource = RepoContentDataSource()
    var textFileView = TextFileView(frame: .zero)
    
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
        var file = files[indexPath.row]
        let urlString = "https://api.github.com/repos/\(repo.owner!.login!)/\(repo.name!)/contents/\(file.path!)"
        let url = URL(string: urlString)
        
        if (file.type! == "dir") {
            //Downloading folder content and presenting next view
            URLSession.shared.dataTask(with: url!) { (data, response, err) in
                if let err = err {
                    print(err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    file.files = try JSONDecoder().decode([File].self, from: data)
                    DispatchQueue.main.async(execute: {
                        var newRepo = repo
                        newRepo.files = file.files
                        newRepo.files?.sort(by: { (file1, file2) -> Bool in
                            return file2.type! as String > file1.type! as String
                        })
                        let newRepoVC = RepoContentController()
                        newRepoVC.repo = newRepo
                        self.navigationController?.pushViewController(newRepoVC, animated: true)
                    })
                } catch {
                    
                }
            }.resume()
            
        } else if (file.type! == "file") {
            //Presenting file content
            
            URLSession.shared.dataTask(with: url!) { (data, response, err) in
                
                if let err = err {
                    print(err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let fileContent = try JSONDecoder().decode(FileContent.self, from: data)
                    DispatchQueue.main.async(execute: {
                        if file.size! < 300000{
                            guard let content = fileContent.content else { return }
                            let decodedString = splitBase64IntoLines(base64String: content)
                            self.textFileView.textContentView.attributedText = higlightDecodedString(string: decodedString, lang: repo.language!)
                        } else {
                            self.textFileView.textContentView.text = "File is too big."
                        }
                    })
                } catch {
                    print("Something went wrong")
                }
            }.resume()
            
            textFileView.fileNameLabel.text = file.name
            textFileView.showTextView()
        }
    }
    
}
