//
//  PMAdCommandA.swift
//  Test
//
//  Created by Henry Tsai on 2/3/16.
//  Copyright © 2016 Pandora. All rights reserved.
//

import UIKit

class PMAdCommandA: NSObject, PMAdCommand {
    var content:[String:AnyObject]
    init(content:[String:AnyObject]) {
        self.content = content
        super.init()
    }
}
