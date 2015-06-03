//
//  ViewController.m
//  StoringCredentials
//
//  Created by Bryan Luby on 5/27/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionTaskDelegate>

@property (nonatomic, weak) IBOutlet NSTextField *usernameTextField;
@property (nonatomic, weak) IBOutlet NSTextField *passwordTextField;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionTask *task;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self populateCredential];

    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                 delegate:self
                                            delegateQueue:[NSOperationQueue mainQueue]];
}

- (IBAction)saveButtonPressed:(id)sender
{
    [self saveDefaultCredentialForUsername:self.usernameTextField.stringValue
                                  password:self.passwordTextField.stringValue
                           protectionSpace:[self protectionSpace]];
    [self testChallenge];
}

- (void)testChallenge
{
    NSString *urlString =  @"https://www.instapaper.com/api/authenticate";

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.HTTPMethod = @"POST";

    self.task = [self.session dataTaskWithRequest:request];
    [self.task resume];
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
    
//    NSLog(@"\n--- Credentials ---\nUsername: %@\nPassword: %@", defaultCredential.user, defaultCredential.password);
}

- (void)saveDefaultCredentialForUsername:(NSString *)username
                                password:(NSString *)password
                         protectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    [self removePreviousDefaultCredentialForProtectionSpace:protectionSpace];
    
    NSURLCredential *newDefaultCredential = [NSURLCredential credentialWithUser:username
                                                                       password:password
                                                                    persistence:NSURLCredentialPersistencePermanent];
    
    [[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:newDefaultCredential
                                                        forProtectionSpace:protectionSpace];
}

- (void)removePreviousDefaultCredentialForProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    NSURLCredential *previousDefaultCredential = [[NSURLCredentialStorage sharedCredentialStorage]
                                                  defaultCredentialForProtectionSpace:protectionSpace];

    if (previousDefaultCredential) {
        [[NSURLCredentialStorage sharedCredentialStorage] removeCredential:previousDefaultCredential
                                                        forProtectionSpace:protectionSpace];
    }
}

#pragma mark - NSURLSessionTaskDelegate

-  (void)URLSession:(NSURLSession *)session
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
  completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    NSURLCredential *defaultCredential = [[NSURLCredentialStorage sharedCredentialStorage]
                                          defaultCredentialForProtectionSpace:[self protectionSpace]];

    if (defaultCredential.user && defaultCredential.hasPassword) {
        completionHandler(NSURLSessionAuthChallengeUseCredential, defaultCredential);
    } else {
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{

}

@end
