//
//  ListViewController.h
//  HireProCompanionApp
//
//  Created by Saiteja Samudrala on 10/3/15.
//  Copyright (c) 2015 edu.saiteja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong,nonatomic) NSMutableArray * companies;
@property (strong,nonatomic) IBOutlet UITableView * tableview;
-(IBAction)companyTapped:(id)sender;
@end
