//
//  ViewController.m
//  HireProCompanionApp
//
//  Created by Saiteja Samudrala on 10/2/15.
//  Copyright (c) 2015 edu.saiteja. All rights reserved.
//

#import "ViewController.h"
#import <linkedin-sdk/LISDK.h>
#import <Parse/Parse.h>

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
        
          [[LISDKAPIHelper sharedInstance]getRequest:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~?format=json"] success:^(LISDKAPIResponse *response) {
              NSError * error;
              NSData *jSONResponseData = [response.data dataUsingEncoding:NSUTF8StringEncoding];
              NSDictionary * jSONuserData = [NSJSONSerialization JSONObjectWithData:jSONResponseData options:NSJSONReadingMutableContainers error: &error];
              NSString* id = [jSONuserData objectForKey:@"id"];
              
              
              
             
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
