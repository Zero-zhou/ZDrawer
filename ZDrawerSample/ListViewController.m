//
//  ListViewController.m
//  ZDrawerSample
//
//  Created by lanou3g on 15/12/14.
//  Copyright © 2015年 Zero_Zhou. All rights reserved.
//

#import "ListViewController.h"
#import "MainViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
#import "SevenViewController.h"
#import "AppDelegate.h"
@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *menuTBV; // </ 菜单表示图
@property(nonatomic,strong) NSArray *menuArray; // </
@end

@implementation ListViewController
@synthesize menuTBV,menuArray;
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor redColor];
    menuArray = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
    
    menuTBV.separatorStyle = UITableViewCellSeparatorStyleNone;
    menuTBV = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    menuTBV.backgroundColor = [UIColor clearColor];
    menuTBV.delegate =self;
    menuTBV.dataSource = self;
    [self.view addSubview:menuTBV];
    
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return menuArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *definer = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:definer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = menuArray[indexPath.row];
   // cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor yellowColor];
    
    
    UIViewController *viewController;
  //更换主控制器视图
    switch (indexPath.row) {
        case 0:{
            viewController = [OneViewController new];
        }
            break;
        case 1:{
            viewController = [TwoViewController new];
         }
            break;
        case 2:{
            viewController = [ThreeViewController new];
        }
            break;
        case 3:{
            viewController = [FourViewController new];
        }
            break;
        case 4:{
            viewController = [FiveViewController new];
        }
            break;
        case 5:{
            viewController = [SixViewController new];
        }
            break;
        case 6:{
            viewController = [SevenViewController new];
        }
            break;
        default:
            break;
    }
    UINavigationController *mainNC = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    /*
     //Appdelegate
     AppDelegate *app = [UIApplication sharedApplication].delegate;
     app.listVC = [[ListViewController alloc]initWithViewController:mainNC];
     [app.window setRootViewController:app.listVC];
     [app.listVC drawerClose];
     */
    
     //KVC
    [self.mainViewController.view removeFromSuperview];
    [self setValue:mainNC forKey:@"mainViewController"];
    [self refreshView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 160;
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
