//
//  ViewController.m
//  HireProCompanionApp
//
//  Created by Saiteja Samudrala on 10/2/15.
//  Copyright (c) 2015 edu.saiteja. All rights reserved.
//

#import "ViewController.h"
#import <linkedin-sdk/LISDK.h>
//LinkedIn updates
@interface ViewController ()

@end

@implementation ViewController

-(IBAction)signIn:(id)sender {
    [LISDKSessionManager
     createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, nil]
     state:nil
     showGoToAppStoreDialog:YES
     successBlock:^(NSString *returnState) {
         NSLog(@"%s bobs","success called!");
         LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
         NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~?format=json"]];
         [[LISDKAPIHelper sharedInstance]getRequest:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~?format=json"] success:^(LISDKAPIResponse *response) {
             NSLog(@"%@",response);
             
         } error:^(LISDKAPIError *error) {
             NSLog(@"%@",error);
         }];
         
         
         [self performSegueWithIdentifier:@"logIn" sender:self];
         
     }
     errorBlock:^(NSError * error) {
         NSLog(@"%s bobs","error called!");
     }
     ];
}
- (void)viewDidLoad {
    NSUserDefaults * defaults1 = [NSUserDefaults standardUserDefaults];
    [defaults1 setObject:nil forKey: @"companies"];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
