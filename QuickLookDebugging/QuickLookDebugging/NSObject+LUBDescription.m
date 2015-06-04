//
//  NSObject+LUBDescription.m
//
//  Created by Bryan Luby on 5/5/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "NSObject+LUBDescription.h"
#import <objc/runtime.h>

@implementation NSObject (LUBDescription)

- (NSString *)lub_description
{
    if ([self isKindOfClass:NSClassFromString(@"NSManagedObject")]) {
        return [self description];
    } else {
        NSMutableDictionary *stateDictionary = [NSMutableDictionary dictionary];
        
        Class aClass = [self class];
        
        while (aClass != [NSObject class]) {
            unsigned int propertyCount = 0;
            objc_property_t *properties = class_copyPropertyList(aClass, &propertyCount);
            
            if (propertyCount) {
                for (int i = 0; i < propertyCount; i++) {
                    objc_property_t property = properties[i];
                    
                    @try {
                        NSString *propertyKey = [NSString stringWithUTF8String:property_getName(property)];
                        stateDictionary[propertyKey] = [self valueForKey:propertyKey];
                    } @catch (NSException *exception) {}
                }
            }
            
            free(properties);
            aClass = [aClass superclass];
        }

        return [stateDictionary copy];
    }
}

@end
