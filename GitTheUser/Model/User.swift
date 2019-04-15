//
//  User.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/12/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import Foundation

struct User: Decodable {
    let name: String
    let userUrlString: String
    let userUrl: URL
    var repositories: [Repo]
    
    init(name: String) {
        self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        self.userUrlString = "https://api.github.com/users/" + self.name + "/repos"
        self.userUrl = URL(string: self.userUrlString)!
        self.repositories = []
    }
}
