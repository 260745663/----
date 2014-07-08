//
//  ZJViewController.m
//  键盘操作
//
//  Created by Fuck you on 14-6-30.
//  Copyright (c) 2014年 ZJ. All rights reserved.
//

#import "ZJViewController.h"

@interface ZJViewController ()

@end

@implementation ZJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 监听键盘显示事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 监听键盘退出事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_TextField resignFirstResponder];
}

#pragma mark 键盘即将显示
- (void)keyBoardWillShow:(NSNotification *)note
{
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat ty = - rect.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, ty);
    }];
    
}
#pragma mark 键盘即将退出
- (void)keyBoardWillHide:(NSNotification *)note
{
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat ty =  rect.size.height;
    [UIView animateWithDuration:0.01 animations:^{
        self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, ty);
    }];
}

@end
