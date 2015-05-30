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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self populateCredential];
}

- (IBAction)saveButtonPressed:(id)sender
{
    [self saveDefaultCredential];
}

- (NSURLProtectionSpace *)protectionSpace
{
    static dispatch_once_t onceToken;
    static NSURLProtectionSpace *_protectionSpace;
    
    dispatch_once(&onceToken, ^{
        _protectionSpace = [[NSURLProtectionSpace alloc] initWithHost:@"www.example.com"
                                                                 port:0
                                                             protocol:@"http"
                                                                realm:nil
                                                 authenticationMethod:nil];
    });
    
    return _protectionSpace;
}

- (void)populateCredential
{
    NSURLCredential *defaultCredential = [[NSURLCredentialStorage sharedCredentialStorage]
                                          defaultCredentialForProtectionSpace:[self protectionSpace]];
    
    if (defaultCredential.user && defaultCredential.hasPassword) {
        self.usernameTextField.stringValue = defaultCredential.user;
        self.passwordTextField.stringValue = defaultCredential.password;
    }
    
    NSLog(@"\n--- Credentials ---\nUsername: %@\nPassword: %@", defaultCredential.user, defaultCredential.password);
}

- (void)saveDefaultCredential
{
    [self removePreviousDefaultCredential];
    
    NSURLCredential *newDefaultCredential = [NSURLCredential credentialWithUser:self.usernameTextField.stringValue
                                                                       password:self.passwordTextField.stringValue
                                                                    persistence:NSURLCredentialPersistencePermanent];
    
    [[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:newDefaultCredential
                                                        forProtectionSpace:[self protectionSpace]];
}

- (void)removePreviousDefaultCredential
{
    NSURLCredential *previousDefaultCredential = [[NSURLCredentialStorage sharedCredentialStorage]
                                                  defaultCredentialForProtectionSpace:[self protectionSpace]];
    
    [[NSURLCredentialStorage sharedCredentialStorage]
     removeCredential:previousDefaultCredential
     forProtectionSpace:[self protectionSpace]];
}

@end
