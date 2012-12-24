//
//  ViewController.h
//  DatePickerSample
//
//  Copyright (c) 2012年 mtoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *myPicker;
@property (nonatomic, strong) UIDatePicker *myDatePicker;

@end
