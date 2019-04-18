//
//  File.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import Foundation

struct File: Decodable {
    
    let name: String?
    let type: String?
    let content: String?
    let path: String?
    var files: [File]?
}


