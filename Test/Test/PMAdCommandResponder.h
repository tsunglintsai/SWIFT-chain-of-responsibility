//
//  PMAdCommandResponder.h
//  Test
//
//  Created by Henry Tsai on 2/3/16.
//  Copyright © 2016 Pandora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMAdCommand.h"

@protocol PMAdCommandResponder <NSObject>
@property (nonatomic, weak) id<PMAdCommandResponder> adCommandResponderSuccessor;
- (BOOL)_processAdCommand:(id<PMAdCommand>) command;
@optional
- (BOOL)processAdCommand:(id<PMAdCommand>) command;
@end
