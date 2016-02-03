//
//  ButtonView.swift
//  Test
//
//  Created by Henry Tsai on 2/3/16.
//  Copyright © 2016 Pandora. All rights reserved.
//

import UIKit

class ButtonView: UIView {
    let button: UIButton
    override init (frame : CGRect) {
        button = UIButton(frame: CGRect(x: 20, y:20 , width: 100, height: 100))
        super.init(frame : frame)
        setup()
    }
    
    convenience init (){
        self.init(frame:CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        button = UIButton(frame: CGRect(x: 20, y:20 , width: 100, height: 100))
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        button.titleLabel?.text = "Test"
        button.backgroundColor = UIColor.blueColor()
        button.addTarget(self, action: "buttonTapped", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(button)
    }
    
    func buttonTapped() {
        let command = PMAdCommandA(content: ["A":"a","B":"b"])
        print(haveSuccessorProcessCommand(command))
    }
}
