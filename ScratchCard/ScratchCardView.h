//
//  ScratchCardView.h
//  ScratchCard
//
//  Created by huangxiong on 15/6/1.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ScratchCardView : UIView

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIImageView *maskImageView;

@property (nonatomic, strong) NSMutableArray *allPointsArray;

@property (nonatomic, strong) NSMutableArray *pointArray;

- (void) resetImage;

@end
