//
//  ViewController.m
//  画板
//
//  Created by WT－WD on 17/7/7.
//  Copyright © 2017年 none. All rights reserved.
//

#import "ViewController.h"
#import "HBView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet HBView *hbView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)LineWidthCahnge:(UISlider *)sender {
    
    self.hbView.lineWidth = sender.value;
}
- (IBAction)ColorBtn:(UIButton *)sender {
    
    self.hbView.lineColor = sender.backgroundColor;
}
- (IBAction)cancle:(id)sender {
    NSLog(@"清屏");
    [self.hbView clear];
}

- (IBAction)goBack:(id)sender {
    NSLog(@"回退");
    [self.hbView back];
}

- (IBAction)xiangpi:(id)sender {
    NSLog(@"橡皮");
    [self.hbView eraser];
}
- (IBAction)save:(id)sender {
    NSLog(@"保存");
    
    UIGraphicsBeginImageContextWithOptions(self.hbView.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.hbView.layer renderInContext:ctx];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);

    UIGraphicsEndImageContext();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
