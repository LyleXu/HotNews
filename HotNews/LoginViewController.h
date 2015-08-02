//
//  LoginViewController.h
//  QQDemo
//
//  Created by DotHide on 11-8-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LoginViewController : UIViewController <UITableViewDataSource, UITextFieldDelegate> {
	IBOutlet UITableView *loginTableView;
	UIButton *btnLogin;
	
    UILabel *lblCountryPhoneCode;
	UITextField *txtUser;
	UITextField *txtPass;
    
	NSArray *dataArray;
    NSMutableArray* _permissions;
}

@property (nonatomic, retain) IBOutlet UITableView *loginTableView;

@property (nonatomic, retain) IBOutlet UIButton *btnLogin;
@property (nonatomic, retain) UITextField *txtUser;
@property (nonatomic, retain) UITextField *txtPass;
@property (nonatomic, retain) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UIImageView *imageWeibo;
@property (weak, nonatomic) IBOutlet UIImageView *imageQQ;
@property (weak, nonatomic) IBOutlet UIImageView *imageWeiXin;

@end

