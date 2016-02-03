//
//  NSObject.swift
//  Test
//
//  Created by Henry Tsai on 2/3/16.
//  Copyright © 2016 Pandora. All rights reserved.
//

import Foundation

///
///
///
///
extension NSObject: CommandResponder {
    
    public var commandResponderSuccessor: CommandResponder? {
        get {
            if let cl = objc_getAssociatedObject(self, &PMCommandResponderSuccessorKey.DescriptiveName) as? WeakObjectContainer {
                if let object = cl.object as? CommandResponder{
                    return object
                }
            }
            return nil
        }
        set {
            // check reference circle. we should
            var pointer = self.commandResponderSuccessor
            while pointer != nil {
                if pointer === self {
                    fatalError("Found reference circle in command chain")
                }
                pointer = pointer?.commandResponderSuccessor
            }
            
            objc_setAssociatedObject( self, &PMCommandResponderSuccessorKey.DescriptiveName, WeakObjectContainer(object: newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC )
        }
    }
    
    private struct PMCommandResponderSuccessorKey {
        static var DescriptiveName = "PMCommandResponderSuccessorKey"
    }
    
    public func _processAdCommand(command: Command!) -> Bool {
        if respondsToSelector("processAdCommand:") && processAdCommand(command) {
            return true
        } else {
            return haveSuccessorProcessCommand(command)
        }
    }
    
    public func processAdCommand(command: Command!) -> Bool {
        return false
    }
    
    public func haveSuccessorProcessCommand(command: Command!) -> Bool{
        if let adCommandResponderSuccessor = commandResponderSuccessor {
            return adCommandResponderSuccessor._processAdCommand(command)
        } else {
            return false
        }
    }
}
