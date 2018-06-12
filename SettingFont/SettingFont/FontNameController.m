//
//  FontNameController.m
//  SettingFont
//
//  Created by youxin on 2018/6/12.
//  Copyright © 2018年 yst. All rights reserved.
//

#import "FontNameController.h"

@interface FontNameController (){
    NSMutableArray*  fontNameArray;
    NSString *chinese;
}

@end

@implementation FontNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    [self setTitle:@"所有字体"];
    
    [self initFontArray];
    [self initScrollView];
}
-(void)initFontArray{
    fontNameArray=[[NSMutableArray alloc] init];
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSInteger indFamily, indFont;
    for(indFamily=0;indFamily<[familyNames count];++indFamily)
    {
        
        NSArray* fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        for(indFont=0; indFont<[fontNames count]; ++indFont)
        {
            [fontNameArray addObject:[fontNames objectAtIndex:indFont]];
        }
        
    }
    
}

-(void)initScrollView{
    
    
    UIScrollView *btnScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [btnScrollView setBackgroundColor:[UIColor whiteColor]];
    CGFloat jianGe=20;
    CGFloat btnToLeft=40;
    CGFloat btnHeight=40;
    CGFloat btnToTop=40;
    chinese=@"测试字体123456abcdefgABCDEFG";
    
    for (NSInteger index=0; index<[fontNameArray count]; index++) {
        
        NSString *fontName=[fontNameArray objectAtIndex:index];
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(btnToLeft, btnToTop, self.view.frame.size.width-2*btnToLeft, btnHeight)];
        NSString *title=[[NSString alloc] initWithFormat:@"%@%ld",chinese,index];
        NSLog(@"=======:%@",fontName);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(titleBtnClixk:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.textAlignment=NSTextAlignmentCenter;
        [btn.layer setCornerRadius:4.0]; //设置矩形四个圆角半径
        [btn.layer setBorderWidth:1.0];
        btn.tag=index;
        [btn.layer setBorderColor:[UIColor blueColor].CGColor];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont fontWithName:fontName size:20]];
        [btnScrollView addSubview:btn];
        btnToTop=btnToTop+btnHeight+jianGe;
        btn.tag = 100+ index;
    }
    [btnScrollView setContentSize:CGSizeMake(self.view.frame.size.width, btnToTop)];
    [self.view addSubview:btnScrollView];
}

-(void)titleBtnClixk:(UIButton*)btn{
    
    NSInteger index = btn.tag-100;
    NSString *str = fontNameArray[index];
    [btn setTitle:str forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
    NSLog(@"你点击的字体：%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
