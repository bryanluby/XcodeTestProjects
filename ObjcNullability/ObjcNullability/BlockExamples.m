//
//  BlockExamples.m
//  ObjcNullability
//
//  Created by Bryan Luby on 5/21/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import "BlockExamples.h"

@implementation BlockExamples

- (void)methodThatTakesABlock:(nullable TestBlock)block
{
}

- (void)anotherMethodThatTakesABlock:(nonnull TestBlock2)block
{
}

@end
