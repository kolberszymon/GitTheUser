//
//  FileContent.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/20/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import Foundation

struct FileContent: Decodable {
    
    let name: String?
    let content: String?
    let encoding: String?
    
}
