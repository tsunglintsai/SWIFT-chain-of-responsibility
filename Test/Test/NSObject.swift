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
extension NSObject: PMAdCommandResponder {
    
    public var adCommandResponderSuccessor: PMAdCommandResponder? {
        get {
            if let cl = objc_getAssociatedObject(self, &PMCommandResponderSuccessorKey.DescriptiveName) as? WeakObjectContainer {
                if let object = cl.object as? PMAdCommandResponder{
                    return object
                }
            }
            return nil
        }
        set {
            // check reference circle. we should
            var pointer = self.adCommandResponderSuccessor
            while pointer != nil {
                if pointer === self {
                    fatalError("Found reference circle in command chain")
                }
                pointer = pointer?.adCommandResponderSuccessor
            }
            
            objc_setAssociatedObject( self, &PMCommandResponderSuccessorKey.DescriptiveName, WeakObjectContainer(object: newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC )
        }
    }
    
    private struct PMCommandResponderSuccessorKey {
        static var DescriptiveName = "PMCommandResponderSuccessorKey"
    }
    
    public func _processAdCommand(command: PMAdCommand!) -> Bool {
        if respondsToSelector("processAdCommand:") && processAdCommand(command) {
            return true
        } else {
            return haveSuccessorProcessCommand(command)
        }
    }
    
    public func processAdCommand(command: PMAdCommand!) -> Bool {
        return false
    }
    
    public func haveSuccessorProcessCommand(command: PMAdCommand!) -> Bool{
        if let adCommandResponderSuccessor = adCommandResponderSuccessor {
            return adCommandResponderSuccessor._processAdCommand(command)
        } else {
            return false
        }
    }
}
