//
//  RepoContentTableView.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class RepoContentDataSource:NSObject, UITableViewDataSource  {
   
    var files: [File]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let files = files else { return 0 }
        return files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: fileTableCellId, for: indexPath) as! RepoContentDataCell
        
        guard let files = files else { return UITableViewCell() }
        let file = files[indexPath.row]
        cell.nameLabel.text = file.name
        if file.type == "dir" {
            guard let dirImg = UIImage(named: "folderIcon") else { return UITableViewCell() }
            cell.fileIconImageView.image = dirImg
        } else {
            guard let fileImg = UIImage(named: "fileIcon") else { return UITableViewCell() }
            cell.fileIconImageView.image = fileImg
        }
        cell.layoutSubviews()
        return cell
    }
    
    
}
