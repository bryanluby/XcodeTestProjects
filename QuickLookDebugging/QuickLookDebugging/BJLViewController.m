 //
//  BJLViewController.m
//  QuickLookDebugging
//
//  Created by Bryan Luby on 1/26/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLViewController.h"
#import "BJLPerson.h"
#import "BJLCustomDebuggerView.h"
#import "BJLCustomView.h"
#import "NSObject+LUBDescription.h"

@interface BJLViewController ()
@property (strong, nonatomic) BJLPerson *person;
@end

@implementation BJLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    BJLPerson *person = [[BJLPerson alloc] initWithName:@"A Person"
                                                    age:@26
                                                 gender:@"Female"
                                                picture:[UIImage imageNamed:@"image"]
                                               homepage:[NSURL URLWithString:@"http://www.apple.com/"]];
    person.testArray = @[@1, @2, @3];
    
    BJLCustomView *aView = [[BJLCustomView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    NSLog(@"person: %@", [person lub_description]);
    NSLog(@"view: %@", [aView lub_description]);
}

@end
