//
//  ListViewController.m
//  HireProCompanionApp
//
//  Created by Saiteja Samudrala on 10/3/15.
//  Copyright (c) 2015 edu.saiteja. All rights reserved.
//

#import "ListViewController.h"
#import <Parse/Parse.h>

@interface ListViewController ()
@end

@implementation ListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _companies = [[NSMutableArray alloc]init];
    PFQuery *query = [PFQuery queryWithClassName:@"Companies"];
    NSArray *array =  [query findObjects];
    for(PFObject * object in array)
    {
        [_companies addObject :object[@"Name"]];
    }
    
    
    /*[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
             NSMutableArray * companies = [[NSMutableArray alloc]init];
            for (PFObject *object in objects) {
                NSLog(@"%@", object[@"Name"]);
                [companies addObject: object[@"Name"]];
            }
            NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject: companies forKey:@"companies"];
            [defaults synchronize];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        [_tableview reloadData];
    }];
    */
    
    /*NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    _companies = [defaults objectForKey:@"companies"];*/
    // Do any additional setup after loading the view.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = [PFUser currentUser][@"companyType"];
    UILabel * label = (UILabel*)[selectedCell viewWithTag:99];
    if([cellText containsString:label.text])
    {}
    else
    {
        NSString *cellText1 = [NSString stringWithFormat: @"%@%@,",cellText,label.text];
        [PFUser currentUser][@"companyType"] = cellText1;
        [[PFUser currentUser]saveInBackground];
    }
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILabel * label = (UILabel*)[cell viewWithTag:99];
    NSLog(@"%@bobsa",[_companies objectAtIndex:indexPath.row]);
    label.text = [_companies objectAtIndex:indexPath.row];
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
