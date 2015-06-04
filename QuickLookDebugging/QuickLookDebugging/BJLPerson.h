//
//  BJLPerson.h
//  QuickLookDebugging
//
//  Created by Bryan Luby on 1/26/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJLPerson : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSNumber *age;
@property (copy, nonatomic) NSString *gender;
@property (strong, nonatomic) UIImage *picture;
@property (strong, nonatomic) NSURL *homepage;
@property (copy, nonatomic) NSArray *testArray;

- (instancetype)initWithName:(NSString *)name
                         age:(NSNumber *)age
                      gender:(NSString *)gender
                     picture:(UIImage *)picture
                    homepage:(NSURL *)homepage;

@end
