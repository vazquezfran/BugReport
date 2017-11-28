//
//  ViewController.m
//  BugTest
//
//  Created by Fran on 27/11/2017.
//  Copyright © 2017 Fran. All rights reserved.
//

#import "ViewController.h"

#import "CustomPickerView.h"
@interface ViewController ()
@property (nonnull, nonatomic, readonly) CustomPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setUpPicker];
}

- (void)setUpPicker
{
    _pickerView = [[CustomPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 300)];
    self.textField.inputView = self.pickerView;
}

#pragma mark - Actions
- (IBAction)buttonPressed:(id)sender {
    [UITextField appearance].keyboardAppearance = UIKeyboardAppearanceDark;
}
@end
