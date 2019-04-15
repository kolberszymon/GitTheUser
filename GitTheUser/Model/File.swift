//
//  File.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/15/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import Foundation

struct File {
    let name: String?
    let type: FileType?
}

enum FileType: String {
    case dir
    case file
}
