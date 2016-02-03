//
//  CommandResponder.h
//  Test
//
//  Created by Henry Tsai on 2/3/16.
//  Copyright © 2016 Pandora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@protocol CommandResponder <NSObject>
@property (nonatomic, weak) id<CommandResponder> commandResponderSuccessor;
- (BOOL)_processAdCommand:(id<Command>) command;
@optional
- (BOOL)processAdCommand:(id<Command>) command;
@end
