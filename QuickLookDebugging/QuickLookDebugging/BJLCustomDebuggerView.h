//
//  BJLCustomView.h
//  QuickLookDebugging
//
//  Created by Bryan Luby on 1/26/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BJLCustomDebuggerView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

+ (instancetype)debugQuickLookViewWithObject:(id)modelObject;

@end
