//
//  Repo.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/13/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import Foundation

struct Repo: Decodable {
    
    let name: String?
    let message: String?
    let language: String?
    let owner: Owner?
    var files: [File]?
    
}
