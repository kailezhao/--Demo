//
//  HBView.m
//  画板
//
//  Created by WT－WD on 17/7/7.
//  Copyright © 2017年 none. All rights reserved.
//

#import "HBView.h"
#import "HBBezierPath.h"
@interface HBView ()
@property(nonatomic,strong)HBBezierPath *oldPath;
@property(nonatomic,strong)NSMutableArray *paths;
@end

@implementation HBView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象
    UITouch *touch = touches.anyObject;
    
    //获取手指的位置
    CGPoint point = [touch locationInView:touch.view];
    
    HBBezierPath *path = [HBBezierPath bezierPath];
    path.pathColor = self.lineColor ;
    path.pathWidth = self.lineWidth;
    [path moveToPoint:point];
    [self.oldPath appendPath:path];
    [self.paths addObject:path];
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象
    UITouch *touch = touches.anyObject;
    
    //获取手指的位置
    CGPoint point = [touch locationInView:touch.view];
    
    [[self.paths lastObject] addLineToPoint:point];
    
    [self setNeedsDisplay];
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //渲染
//    NSLog(@"%@",self.oldPath);
//    self.oldPath.lineWidth = self.lineWidth;
//    [self.oldPath.pathColor setStroke];
//    [self.oldPath stroke];
    for (int i = 0; i<self.paths.count; i++) {
       HBBezierPath *path = self.paths[i];
        NSLog(@"%d",i);
        [path.pathColor setStroke];
        path.lineWidth = path.pathWidth;
        [path stroke];
        
    }
}

//清屏
-(void)clear{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}
//返回
-(void)back{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}
//橡皮
-(void)eraser{
    self.lineColor = self.backgroundColor;
}


-(NSMutableArray *)paths{
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}
-(HBBezierPath *)oldPath{
    if (!_oldPath) {
        _oldPath = [HBBezierPath bezierPath];
        _oldPath.pathColor = [UIColor redColor];
    }
    return _oldPath;
}
@end
