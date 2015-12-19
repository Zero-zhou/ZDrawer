//
//  MainViewController.m
//  ZDrawerSample
//
//  Created by lanou3g on 15/12/14.
//  Copyright © 2015年 Zero_Zhou. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"one";
    self.view.backgroundColor = [UIColor yellowColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"🐶" style:UIBarButtonItemStylePlain target:self action:@selector(didClickBarButtonItem:)];
    [self.navigationItem setLeftBarButtonItem:item];
    // Do any additional setup after loading the view.
}

-(void)didClickBarButtonItem:(UIBarButtonItem *)btn{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    ListViewController *menuVC = appDelegate.listVC;
    
    if (menuVC.isShowing) {
        [menuVC drawerClose];
    }else{
        [menuVC drawerShow];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
