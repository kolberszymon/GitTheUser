//
//  RepoTableView.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class RepoTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var user: User?
    let cellId = "cellId"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let cell = self.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RepoTableCell
        cell.repoName = user?.repositories[indexPath.section].name
        cell.repoLanguage = user?.repositories[indexPath.section].language
        cell.layoutSubviews()
        return cell
    }
    
}
