//
//  Service.swift
//  GitTheUser
//
//  Created by Dominik Kolber on 4/12/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

//Main colors of design

let darkPurple = UIColor(red: 75/255, green: 32/255, blue: 144/255, alpha: 1)
let lightPurple = UIColor(red: 213/255, green: 203/255, blue: 220/255, alpha: 1)
let nicePink = UIColor(red: 253/255, green: 44/255, blue: 95/255, alpha: 1)
let gray = UIColor(red: 246/255, green: 243/255, blue: 238/255, alpha: 1)

let repoTableCellId = "repoTableCellId"
let fileTableCellId = "fileTableCellId"

extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil}
        return String(data: data, encoding: .utf8)
    }
}

func splitBase64IntoLines(base64String: String) -> String {
    var linesBase64String: [String] = base64String.components(separatedBy: "\n")
    
    //Removing last item from array, because its always \n sign
    linesBase64String.removeLast()
    var linesDecoded: [String] = []
    for line in linesBase64String {
        linesDecoded.append(line.fromBase64()!)
    }
    let decodedString = linesDecoded.joined()
    return decodedString
}
