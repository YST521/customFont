//
//  ViewController.m
//  SettingFont
//
//  Created by youxin on 2018/6/8.
//  Copyright © 2018年 yst. All rights reserved.
//

#import "ViewController.h"
#import "prison.h"
#import "FontNameController.h"

@interface ViewController (){
    
    UILabel *fontLa,*fontLa1,*fontLa2,*fontLa3,*fontLa4,*nextLa;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (NSString *fontFamilyName in [UIFont familyNames]) {
        NSLog(@"familyNames = %@" , fontFamilyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
            
            NSLog(@"  %@", fontName);
        }
        NSLog(@"---------");
    }
    NSString *str = @"1234abcABC微软雅黑";
    prison *person = [prison new];
    [person eat];
    [person hobby];
    
    fontLa1 = [[UILabel alloc]init];
    [fontLa1 setFrame:CGRectMake(0, 60, 414, 40)];
    [self.view addSubview:fontLa1];
    [fontLa1 setText:str];
    fontLa1.font =[UIFont systemFontOfSize:22];
    
    fontLa = [[UILabel alloc]init];
    [fontLa setFrame:CGRectMake(0, 100, 414, 40)];
    [self.view addSubview:fontLa];
    [fontLa setText:str];//华康少女文字w5（p)
    fontLa.font =[UIFont fontWithName:@"微软雅黑" size:22];
    
    fontLa2 = [[UILabel alloc]init];
    [fontLa2 setFrame:CGRectMake(0, 140, 414, 40)];
    [self.view addSubview:fontLa2];
    [fontLa2 setText:str];
     fontLa2.font =[UIFont fontWithName:@"HYSunWanMinCaoShuW" size:22];
    
    fontLa3 = [[UILabel alloc]init];
    [fontLa3 setFrame:CGRectMake(0, 180, 414, 40)];
    [self.view addSubview:fontLa3];
    [fontLa3 setText:str];
    fontLa3.font =[UIFont fontWithName:@"DFGirl-W6-WIN-BF" size:15];
    
    fontLa4 = [[UILabel alloc]init];
    [fontLa4 setFrame:CGRectMake(0, 220, 414, 40)];
    [self.view addSubview:fontLa4];
    [fontLa4 setText:str];
    fontLa4.font =[UIFont fontWithName:@"迷你简汉真广标" size:22];
    
    
    
    nextLa = [[UILabel alloc]init];
    nextLa.frame = CGRectMake(40, [UIScreen mainScreen].bounds.size.height-60, [UIScreen mainScreen].bounds.size.width-80, 40);
    [nextLa setText:@"点击查看所有字体"];
    nextLa.textAlignment = NSTextAlignmentCenter;
    nextLa.font = [UIFont fontWithName:@"MStiffHei HKS UltraBold" size:30];
    [self.view addSubview:nextLa];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FontNameController *fontNameVC = [[FontNameController alloc]init];
    [self.navigationController pushViewController:fontNameVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
