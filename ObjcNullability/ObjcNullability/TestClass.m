//
//  TestClass.m
//  Nullability
//
//  Created by Bryan Luby on 4/21/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

- (nonnull NSString *)aMethodThatReturnsANonnullString
{
    // No compiler warning for this!
    return nil;
}

- (void)aMethodThatTakesNonnullParameter:(nonnull NSString *)string
{
    
}

- (void)aMethodThatHasNullabilityForLocalVariables
{
    NSString * __nonnull aString = @"test";
    NSString * __nullable anotherString = nil;
    
    // Not sure if this is even supported since there is no compiler warning?
    NSString * __nonnull shouldNotBeNil = nil;
}

@end

@interface SomeOtherClass : NSObject

@end

@implementation SomeOtherClass

- (void)test
{
    TestClass *anInstance = [[TestClass alloc] init];
    // Correctly gives a compiler warning.
    [anInstance aMethodThatTakesNonnullParameter:nil];
}

@end
