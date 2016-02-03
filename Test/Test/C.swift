//
//  C.swift
//  Test
//
//  Created by Henry Tsai on 2/3/16.
//  Copyright © 2016 Pandora. All rights reserved.
//

import UIKit

class C: NSObject {
    override init() {
        super.init()
        buttonView.commandResponderSuccessor = self
    }
    var buttonView = ButtonView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)) {
        didSet {
            print("set button view")
        }
    }
}
