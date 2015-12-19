//
//  MenuViewController.m
//  ZDrawerSample
//
//  Created by lanou3g on 15/12/14.
//  Copyright © 2015年 Zero_Zhou. All rights reserved.
//

#import "MenuViewController.h"
#import "MainViewController.h"

@interface MenuViewController ()
@property(nonatomic,strong) UIPanGestureRecognizer *pan; // </
@end

@implementation MenuViewController
/*
 {
 //成员变量
 UIPanGestureRecognizer * _pan;
 }
 变量合成器
 @synthesize pan = _pan;

 */

-(instancetype)initWithViewController:(UIViewController *)vc{
    self = [super init];
    if (self) {
        //接收外部传入的VC
        _mainViewController = vc;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshView];
}
//刷新视图
-(void)refreshView {
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageV.image = [UIImage imageNamed:@"drawerBack"];
    [self.view addSubview:imageV];
    [self.view sendSubviewToBack:imageV];
    //添加主视图控制器的view到菜单视图控制器的view上
    [self.view addSubview:self.mainViewController.view];
    
    //屏幕边缘滑动手势
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(viewSlide:)];
    [edgePan setEdges:UIRectEdgeLeft];
    //给视图添加手势
    [self.mainViewController.view addGestureRecognizer:edgePan];
    
    
    self.pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewSlide:)];
    [self.mainViewController.view addGestureRecognizer:self.pan];
    [self.pan setEnabled:NO];
}

-(BOOL)isShowing{
    if (    self.mainViewController.view.frame.origin.x == 0) {
        return NO;
    }else{
        return YES;
    }
    
}

-(void)drawerShow {
    [self.mainViewController.view setFrame:CGRectMake(DRAWERWOFF, 60, self.view.frame.size.width, self.view.frame.size.height - 120)];
    [self.pan setEnabled:YES];
}

-(void)drawerClose {
    [self.mainViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + 120)];
    [self.pan setEnabled:NO];
}

-(void)viewSlide:(UIScreenEdgePanGestureRecognizer *)recognizer {
    
    CGFloat senderX = [recognizer translationInView:recognizer.view].x;
    
    if (![self.pan isEnabled]) {
        senderX = [recognizer translationInView:recognizer.view].x ;
    }else{
        senderX = DRAWERWOFF + [recognizer translationInView:recognizer.view].x;
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded || senderX < 0) {
        if (senderX > self.view.frame.size.width / 2.0) {
            [self drawerShow];
        }else{
            [self drawerClose];
        }
        return;
    }
    [self.mainViewController.view setFrame:CGRectMake(senderX, senderX * 0.22, self.view.frame.size.width, self.view.frame.size.height - (senderX * 0.22 * 2 ))];
    /*
     NSLog(@"位移++%@",NSStringFromCGPoint([recognizer translationInView:recognizer.view]) );
     NSLog(@"速度--%@",NSStringFromCGPoint([recognizer velocityInView:recognizer.view]));
     

     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
