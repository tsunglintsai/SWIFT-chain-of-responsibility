//
//  WeakObjectContainer.swift
//  DealFinder
//
//  Created by Henry on 1/30/16.
//  Copyright © 2016 Pyrogusto. All rights reserved.
//

import Foundation

class WeakObjectContainer: NSObject {
    weak var object:AnyObject?
    init(object:AnyObject?) {
        self.object = object
        super.init()
    }
}
