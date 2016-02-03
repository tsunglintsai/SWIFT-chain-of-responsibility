//
//  ViewController.swift
//  Test
//
//  Created by Henry Tsai on 2/3/16.
//  Copyright © 2016 Pandora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var a = A()
    var b = B()
    var c = C()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        a.adCommandResponderSuccessor = self
        b.adCommandResponderSuccessor = a
        c.adCommandResponderSuccessor = b
        view.addSubview(c.buttonView)
    }


    override func processAdCommand(command: PMAdCommand!) -> Bool {
        print("ViewController:\(command)")
        if let adCommand = command as? PMAdCommandA {
            print(adCommand.content)
        }
        return true
    }

}

