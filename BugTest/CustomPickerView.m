//
//  CustomPickerView.m
//  BugTest
//
//  Created by Fran on 28/11/2017.
//  Copyright © 2017 Fran. All rights reserved.
//

#import "CustomPickerView.h"

@interface CustomPickerView () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonnull, nonatomic, readonly) UIPickerView *pickerView;
@end

@implementation CustomPickerView

// Fix for the wrong background color:
- (void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    if (newWindow) {
        self.pickerView.backgroundColor = [UIColor blueColor];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpPicker];
    }
    return self;
}

- (void)setUpPicker
{
    _pickerView = [[UIPickerView alloc] init];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.backgroundColor = [UIColor blueColor];

    [self addSubview:self.pickerView];
}

#pragma mark - Picker view datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

#pragma mark - Picker view delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 200;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    UILabel *label = (id)view;
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [self pickerView:pickerView widthForComponent:component], 50)];
    }
    label.text = @"Apple";

    return label;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.pickerView.frame = self.bounds;
}
@end
