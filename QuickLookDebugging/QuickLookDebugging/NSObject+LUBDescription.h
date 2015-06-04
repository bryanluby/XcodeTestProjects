//
//  NSObject+LUBDescription.h
//
//  Created by Bryan Luby on 5/5/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LUBDescription)

///Returns a dictionary description of all property keys and values for an object.
- (NSString *)lub_description;

@end
