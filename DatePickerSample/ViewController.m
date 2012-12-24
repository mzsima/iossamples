//
//  ViewController.m
//  DatePickerSample
//
//  Copyright (c) 2012年 mtoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIPopoverController *popoverVC;
@property (nonatomic, strong) UIDatePicker *picker;

@end

@implementation ViewController

@synthesize dateLabel, popoverVC;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // date 表示用ラベル
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 100, 40)];
    [self.view addSubview:dateLabel];
    
    // popover用ボタン
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(130, 50, 80, 40);
    [btn setTitle:@"Date" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popup:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // popover view controller
    UIViewController *contentVC = [[UIViewController alloc] init];
    UIView *root = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [root addSubview:datePicker];
    
    [contentVC setView:root];
    
    //popupサイズを指定
    contentVC.contentSizeForViewInPopover = CGSizeMake(320, 216);
    
    self.popoverVC = [[UIPopoverController alloc] initWithContentViewController:contentVC];
    
    
}

- (void)popup:(id)sender
{
    // pop up!
    [self.popoverVC presentPopoverFromRect:CGRectMake(40, 20, 10, 10) inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)dateChanged:(UIDatePicker*)sender
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    dateLabel.text = [dateFormatter stringFromDate:sender.date];;
    
}


@end
