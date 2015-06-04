//
//  BJLPerson.m
//  QuickLookDebugging
//
//  Created by Bryan Luby on 1/26/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLPerson.h"
#import "BJLCustomDebuggerView.h"

@implementation BJLPerson

- (instancetype)initWithName:(NSString *)name
                         age:(NSNumber *)age
                      gender:(NSString *)gender
                     picture:(UIImage *)picture
                    homepage:(NSURL *)homepage
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _gender = gender;
        _picture = picture;
        _homepage = homepage;
    }
    return self;
}

- (id)debugQuickLookObject
{
    return [BJLCustomDebuggerView debugQuickLookViewWithObject:self];
}

@end
