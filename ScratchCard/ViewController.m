//
//  ViewController.m
//  ScratchCard
//
//  Created by huangxiong on 15/6/1.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import "ViewController.h"
#import "ScratchCardView.h"

#define  SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (strong, nonatomic)  ScratchCardView *scratchView;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) CAShapeLayer *oringalLayer;

@property (nonatomic, strong) NSMutableArray *pointArray;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pointArray = [NSMutableArray array];
    
    _scratchView = [[ScratchCardView alloc] initWithFrame: CGRectMake(0, 128, SCREEN_WIDTH, 235)];
    _scratchView.allPointsArray = [NSMutableArray arrayWithCapacity: 100];
    
    [self.view addSubview: _scratchView];
    
//    //_scratchView.image = [UIImage imageNamed: @"user_back_03"];
// //   [self.view addSubview: _imageView];
//    
//    _shapeLayer = [CAShapeLayer layer];
//    _shapeLayer.frame = _scratchView.bounds;
//  //  _shapeLayer.bounds = _imageView.frame;
//    _shapeLayer.fillColor = [UIColor greenColor].CGColor;
//    
//    _shapeLayer.lineWidth = 20.0;
//    
//    
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, _scratchView.bounds);
//    
//    _shapeLayer.path = path;
//    
//    _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//    
//    _shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//
//    
//    CGPoint point = [[touches anyObject] locationInView: _scratchView];
//    
//    
//    NSValue *value = [NSValue valueWithCGPoint: point];
//    [_pointArray addObject:value];
//    NSLog(@"%@", NSStringFromCGPoint(point));
//    
//    
//    [self drawLayer];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//    CGPoint point = [[touches anyObject] locationInView: _scratchView];
//
//    NSValue *value = [NSValue valueWithCGPoint: point];
//    [_pointArray addObject:value];
//    
//    [self drawLayer];
//}

//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    [_pointArray removeAllObjects];
//}

- (void) drawLayer{
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    for (NSInteger index = 0; index < _pointArray.count; ++index) {
        
        NSAssert([_pointArray[index] respondsToSelector: @selector(CGPointValue)], @"不能获得点");
        
        CGPoint point = [_pointArray[index] CGPointValue];
        CGPoint start = CGPointZero;
        
        if (index == 0) {
            CGPathMoveToPoint(path, NULL, point.x, point.y);
            start = point;
        }
        else {
            CGPathAddLineToPoint(path, NULL, point.x, point.y);
        }
    }
    _shapeLayer.path = path;
}

- (IBAction)resetScratchCardView:(UIButton *)sender {
    [_scratchView  resetImage];
}

@end
