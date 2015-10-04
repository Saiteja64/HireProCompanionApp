//
//  InterViewController.m
//  HireProCompanionApp
//
//  Created by Saiteja Samudrala on 10/3/15.
//  Copyright (c) 2015 edu.saiteja. All rights reserved.
//

#import "InterViewController.h"

@interface InterViewController ()

@end

@implementation InterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    UITextView * tview = (UITextView*)[cell viewWithTag:80];
    tview.text = @"Sautee";
    UILabel * label = (UILabel*)[cell viewWithTag:81];
    label.text = [NSString stringWithFormat:@"%li",indexPath.row + 1];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
