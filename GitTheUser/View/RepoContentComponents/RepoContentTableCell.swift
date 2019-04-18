//
//  RepoContentTableCell.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class RepoContentDataCell: UITableViewCell {
    
    var file: File?
    
    let fileIconImageView: UIImageView = {
        let fileIcon = UIImage()
        let fileIconImageView = UIImageView(image: fileIcon)
        fileIconImageView.translatesAutoresizingMaskIntoConstraints = false
        return fileIconImageView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = darkPurple
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(containerView)
        
        containerViewSetup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func containerViewSetup() {
        
        containerView.addSubview(fileIconImageView)
        containerView.addSubview(nameLabel)
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        fileIconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        fileIconImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        fileIconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: fileIconImageView.trailingAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
