//
//  MenuViewController.h
//  ZDrawerSample
//
//  Created by lanou3g on 15/12/14.
//  Copyright © 2015年 Zero_Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DRAWERWOFF 300

@interface MenuViewController : UIViewController
@property(nonatomic,getter=isShowing) BOOL isShowing; // </ 抽屉的状态
@property(nonatomic,assign) CGFloat scale; // </ 抽屉显示比例
@property(nonatomic,strong,readonly) UIViewController *mainViewController; // </ 主视图


-(instancetype)initWithViewController:(UIViewController *)vc;
/**
 *  抽屉打开
 */
-(void)drawerShow;
/**
 *  抽屉关闭
 */
-(void)drawerClose;
/**
 *  刷新视图
 */
-(void)refreshView;

@end
