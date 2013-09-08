//
//  AddURLViewController.m
//  VideoPlayer
//
//  Created by Xu Jingwei on 9/7/13.
//  Copyright (c) 2013 xu jingwei. All rights reserved.
//

#import "AddURLViewController.h"

@interface AddURLViewController ()

@end

@implementation AddURLViewController
@synthesize delegate = _delegate;
@synthesize titleField = _titleField;
@synthesize urlField = _urlField;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _urlField.delegate = self;
    _titleField.delegate = self;
    [_urlField setReturnKeyType:UIReturnKeyDone];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)add{
    NSString *title = _titleField.text;
    NSString *url = _urlField.text;
    [_delegate addToTable:title URL:url];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_titleField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
@end
