//
//  HBView.h
//  画板
//
//  Created by WT－WD on 17/7/7.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBView : UIView
@property(nonatomic,strong)UIColor *lineColor;
@property(nonatomic,assign)CGFloat lineWidth;

//清屏
-(void)clear;
//返回
-(void)back;
//橡皮
-(void)eraser;
@end
