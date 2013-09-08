//
//  AddURLViewController.h
//  VideoPlayer
//
//  Created by Xu Jingwei on 9/7/13.
//  Copyright (c) 2013 xu jingwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addURLDelegate <NSObject>

-(void)addToTable:(NSString*)title URL:(NSString*)url;

@end

@interface AddURLViewController : UIViewController<UITextViewDelegate, UITextFieldDelegate>{
    id <addURLDelegate> delegate;
}
@property (nonatomic, strong) id <addURLDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITextField *titleField;
@property (nonatomic, strong) IBOutlet UITextView *urlField;
-(IBAction)cancel;
-(IBAction)add;

@end
