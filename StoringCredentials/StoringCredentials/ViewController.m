//
//  ViewController.m
//  StoringCredentials
//
//  Created by Bryan Luby on 5/27/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet NSTextField *usernameTextField;
@property (nonatomic, weak) IBOutlet NSTextField *passwordTextField;

@end

@implementation ViewController

- (IBAction)saveButtonPressed:(id)sender
{
    [self saveCredentials];
}

- (void)saveCredentials
{
    NSURLCredential *credential = [NSURLCredential credentialWithUser:self.usernameTextField.stringValue
                                                             password:self.passwordTextField.stringValue
                                                          persistence:NSURLCredentialPersistencePermanent];
    
    NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc] initWithHost:@"www.example.com"
                                                                                  port:0
                                                                              protocol:@"http"
                                                                                 realm:nil
                                                                  authenticationMethod:nil];
    
    [[NSURLCredentialStorage sharedCredentialStorage] setCredential:credential
                                                 forProtectionSpace:protectionSpace];
}

@end
