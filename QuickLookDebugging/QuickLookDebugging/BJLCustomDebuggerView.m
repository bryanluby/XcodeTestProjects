//
//  BJLCustomView.m
//  QuickLookDebugging
//
//  Created by Bryan Luby on 1/26/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLCustomDebuggerView.h"
#import <objc/runtime.h>

@implementation BJLCustomDebuggerView

+ (instancetype)debugQuickLookViewWithObject:(id)modelObject
{
//    CGRect frame = CGRectMake(0, 0, 600, 600);
//    BJLCustomDebuggerView *debugView = [[self alloc] initWithNibName:nil bundle:nil];
    BJLCustomDebuggerView *debugView = [[[NSBundle mainBundle] loadNibNamed:@"BJLCustomDebuggerView"
                                                                      owner:self
                                                                    options:nil] firstObject];
    
//    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    debugView.textView.font = [UIFont boldSystemFontOfSize:20];
    debugView.textView.text = [self debugViewTextFromModelObject:modelObject];
    
//    [debugView addSubview:textView];
    return debugView;
}

+ (NSString *)debugViewTextFromModelObject:(id)modelObject
{
    NSMutableString *debugViewText = [NSMutableString string];
    
    // Properties
    
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([modelObject class], &propertyCount);
    
    if (propertyCount) {
        [debugViewText appendString:@"Properties:\n"];
        
        NSMutableArray *keys = [NSMutableArray array];
        
        for (int i = 0; i < propertyCount; i++) {
            objc_property_t property = properties[i];
            NSString *key = [NSString stringWithUTF8String:property_getName(property)];
            [keys addObject:key];
        }
        
        [debugViewText appendFormat:@"%@", [modelObject dictionaryWithValuesForKeys:keys]];
    }
    free(properties);
    
    // Ivars
    
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList([modelObject class], &ivarCount);
    
    if (ivarCount) {
        [debugViewText appendString:@"\nIvars:\n"];
        
        NSMutableArray *keys = [NSMutableArray array];
        
        for (int i = 0; i < ivarCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            [keys addObject:key];
        }
        
        [debugViewText appendFormat:@"%@", [modelObject dictionaryWithValuesForKeys:keys]];
    }
    free(ivars);
    
    // Methods
    
    unsigned int methodCount = 0;
    
    Method *methods = class_copyMethodList([modelObject class], &methodCount);
    
    if (methodCount) {
        [debugViewText appendString:@"\nMethods:\n"];
        
        NSMutableArray *methodNames = [NSMutableArray array];
        
        for (int i = 0; i < methodCount; i++) {
            Method method = methods[i];
            [methodNames addObject:NSStringFromSelector(method_getName(method))];
        }
        
        [debugViewText appendString:[methodNames componentsJoinedByString:@"\n"]];
    }
    
    return [debugViewText copy];
}

@end
