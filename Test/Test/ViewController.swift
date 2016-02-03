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
        a.commandResponderSuccessor = self
        b.commandResponderSuccessor = a
        c.commandResponderSuccessor = b
        view.addSubview(c.buttonView)
    }


    override func processAdCommand(command: Command!) -> Bool {
        print("ViewController:\(command)")
        if let adCommand = command as? CommandA {
            print(adCommand.content)
        }
        return true
    }

}

