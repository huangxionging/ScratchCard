//
//  ScratchCardView.m
//  ScratchCard
//
//  Created by huangxiong on 15/6/1.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import "ScratchCardView.h"

@implementation ScratchCardView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame: self.bounds];
        self.imageView.image = [UIImage imageNamed: @"user_back_03"];
        
        self.maskImageView = [[UIImageView alloc] initWithFrame: self.bounds];
//        self.maskImageView.image = [UIImage imageNamed: @"meimei"];
        self.maskImageView.image = [self imageWithFillColor: [UIColor grayColor] andWithSize: self.maskImageView.bounds.size];
        [self addSubview: self.imageView];
        [self addSubview: self.maskImageView];
        
    
    }
    
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView: self.maskImageView];
    NSLog(@"%@", NSStringFromCGPoint(point));
    [self drawScratchViewWith:point];
}

- (void)drawScratchViewWith:(CGPoint)point {
    UIGraphicsBeginImageContext(self.maskImageView.bounds.size);
    
    [self.maskImageView.image drawInRect: self.maskImageView.bounds];
    
    CGContextClearRect(UIGraphicsGetCurrentContext(), CGRectMake(point.x-15, point.y-15, 30, 30));
    self.maskImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    CGPoint point = [[touches anyObject] locationInView: self.maskImageView];
    NSLog(@"%@", NSStringFromCGPoint(point));
    [self drawScratchViewWith:point];
}

//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//}
- (UIImage *) imageWithFillColor: (UIColor *) color  andWithSize: (CGSize) size{
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 设备环境
    CGContextRef ctx = CGBitmapContextCreate(nil, size.width, size.height, 8, size.width * 4, colorSpace, (CGBitmapInfo) kCGImageAlphaPremultipliedFirst);
    
    // 填充颜色
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    
    // 添加矩形
    CGContextAddRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    CGContextFillPath(ctx);
    
    // 获取图像
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    
    return [UIImage imageWithCGImage: imageRef];
}

- (void) resetImage {
    self.maskImageView.image = [self imageWithFillColor: [UIColor grayColor] andWithSize: self.bounds.size];
}

@end
