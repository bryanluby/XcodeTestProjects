//
//  BlockExamples.h
//  ObjcNullability
//
//  Created by Bryan Luby on 5/21/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TestBlock)(NSString * __nonnull stuff);
typedef void(^TestBlock2)(NSString * __nullable otherStuff);

NS_ASSUME_NONNULL_BEGIN
typedef void(^TestBlock3)(NSString *aString);
NS_ASSUME_NONNULL_END

typedef NSString *__nonnull(^TestBlock4)(NSString *__nonnull aString);

@interface BlockExamples : NSObject

- (void)methodThatTakesABlock:(nullable TestBlock)block;
- (void)anotherMethodThatTakesABlock:(nonnull TestBlock2)block;

@end
