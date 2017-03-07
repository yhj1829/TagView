//
//  ViewController.m
//  TagViewDemo
//
//  Created by yhj on 2017/3/7.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <SKTagView/SKTagView.h>
#import <HexColors/HexColors.h>

// 屏幕
#define APPW [UIScreen mainScreen].bounds.size.width
#define APPH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)SKTagView *tagView;

@property(nonatomic,strong)NSArray *colors;

@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.automaticallyAdjustsScrollViewInsets=NO;

    [self initData];

    [self initBtn];

}

-(void)initData
{

self.colors=@[@"#7ecef4",@"#84ccc9",@"#88abda",@"#7dc1dd",@"#b6b8de"];
    _tagView=[[SKTagView alloc]initWithFrame:CGRectMake(0,APPH/4,APPW,APPH/2)];
    _tagView.backgroundColor=[UIColor blueColor];
    _tagView.padding=UIEdgeInsetsMake(10,10,10,10);
    _tagView.interitemSpacing=10;
    _tagView.lineSpacing=10;
    __weak typeof(SKTagView) *weakSelf=_tagView;
    _tagView.didTapTagAtIndex=^(NSUInteger index)
    {
        [weakSelf removeTagAtIndex:index];
    };
    [self.view addSubview:self.tagView];

    [@[@"Python", @"Javascript", @"Python", @"Swift", @"Go", @"Objective-C", @"C", @"PHP"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKTag *tag=[SKTag tagWithText:obj];
        tag.textColor=[UIColor whiteColor];
        tag.fontSize=15;
        tag.enable=YES;
        tag.padding=UIEdgeInsetsMake(10,10,10,10);
        tag.bgColor=[UIColor hx_colorWithHexString:self.colors[idx%self.colors.count]];
        tag.cornerRadius=10/2;
        [self.tagView addTag:tag];
    }];
}

-(void)initBtn
{
    NSArray *arr=@[@"Add",@"Insert",@"Delete",@"Delete All"];
    for (int i=0;i<arr.count;i++)
    {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(APPW/arr.count*(i%arr.count),APPH-40,APPW/arr.count,40)];
        [btn setTitle:arr[i] forState:0];
        btn.tag=i;
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.titleLabel.font=[UIFont systemFontOfSize:12];
        btn.backgroundColor=[UIColor yellowColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)btnClick:(UIButton *)sender
{
    if (sender.tag==0) {
    // Add one data
        SKTag *tag=[SKTag tagWithText:@"Add one data"];
        tag.textColor=[UIColor whiteColor];
        tag.fontSize=14;
        tag.enable=YES;
        tag.padding=UIEdgeInsetsMake(10,10,10,10);
     tag.bgColor=[UIColor hx_colorWithHexString:self.colors[arc4random()%self.colors.count]];
        tag.cornerRadius=10/2;
        [self.tagView addTag:tag];
    }
    else if (sender.tag==1)
    {
    // Insert one data
        SKTag *tag=[SKTag tagWithText:@"Insert one data"];
        tag.textColor=[UIColor whiteColor];
        tag.fontSize=14;
        tag.enable=YES;
        tag.padding=UIEdgeInsetsMake(10,10,10,10);
        tag.bgColor=[UIColor hx_colorWithHexString:self.colors[arc4random()%self.colors.count]];
        tag.cornerRadius=10/2;
        [self.tagView insertTag:tag atIndex:sender.tag];
    }
    else if (sender.tag==2)
    {
    // Delete
        SKTag *tag=[SKTag tagWithText:@"Delete one data"];
        tag.textColor=[UIColor whiteColor];
        tag.fontSize=14;
        tag.enable=YES;
        tag.padding=UIEdgeInsetsMake(10,10,10,10);
        tag.bgColor=[UIColor hx_colorWithHexString:self.colors[arc4random()%self.colors.count]];
        tag.cornerRadius=10/2;
        [self.tagView removeTagAtIndex:sender.tag];
    }
    else
    {
         // Delete All
        [self.tagView removeAllTags];
    }
}


@end
