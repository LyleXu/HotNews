#import "LoginViewController.h"
#import "DataLayer.h"
#import "SBJson/SBJson.h"
#import "Utility.h"
#import "Constraint.h"
#import "UMSocial.h"
#import "MainTabBarController.h"
#define kLeftMargin				20.0
#define kRightMargin			20.0

#define kTextFieldWidth			160.0
#define kTextFieldHeight		25

#define kViewTag				100

static NSString *kSourceKey = @"sourceKey";
static NSString *kViewKey = @"viewKey";

@implementation LoginViewController

@synthesize loginTableView;
@synthesize btnLogin;
@synthesize txtUser,txtPass;
@synthesize dataArray;
-(void)initImageClickEvent
{
    //sina weibo
    self.imageWeibo.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageWeiboClicked)];
    [self.imageWeibo addGestureRecognizer:singleTap];
    
    // qq
    self.imageQQ.userInteractionEnabled = YES;
    UITapGestureRecognizer *qqTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageQQClicked)];
    [self.imageQQ addGestureRecognizer:qqTap];

}

-(void)imageWeiboClicked
{

    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            [self LoginFromThird:@"1" Token:snsAccount.accessToken];
                    }});

}

-(void)imageQQClicked
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
            [self LoginFromThird:@"0" Token:snsAccount.accessToken];
            
        }});
}


-(void)LoginFromThird:(NSString*)loginType Token:(NSString*)token
{
    NSDictionary* result = [DataLayer LoginFromThirdParty:loginType tokenFromThirdParty:token];
    NSString* returnCode = result[@"s"];
//    if([returnCode isEqualToString:SUCCESS])
//    {
//        [Utility setUserId:result[@"u"]];
//        [Utility setUserToken:result[@"tk"]];
//        [Utility setUserType:result[@"ut"]];
//        
        MainTabBarController* ctl = [self.storyboard instantiateViewControllerWithIdentifier:@"LCPanNavigationController"];
        [self presentViewController:ctl animated:YES completion:nil];
//    }else
//    {
//        // show the error message
//        [Utility showErrorMessage:returnCode];
//    }

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.dataArray = [NSArray arrayWithObjects:
                    [NSDictionary dictionaryWithObjectsAndKeys:
					   @"手机号: ",kSourceKey,
					   self.txtUser,kViewKey,
					   nil],
					  [NSDictionary dictionaryWithObjectsAndKeys:
					   @"密码: ",kSourceKey,
					   self.txtPass,kViewKey,
					   nil],
					  nil];
	self.editing = NO;
    
    [self initImageClickEvent];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

	txtUser = nil;
    lblCountryPhoneCode = nil;
	txtPass = nil;
	self.dataArray = nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	[txtUser resignFirstResponder];
	[txtPass resignFirstResponder];
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString *identifier = @"loginCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									  // reuseIdentifier:identifier] autorelease];
	}else {
		UIView *viewToCheck = nil;
		viewToCheck = [cell.contentView viewWithTag:kViewTag];
		if (viewToCheck) {
			[viewToCheck removeFromSuperview];
		}
	}
	cell.selectionStyle = UITableViewCellSelectionStyleNone;

	//配置单元格
	cell.textLabel.text = [[dataArray objectAtIndex:indexPath.row] valueForKey:kSourceKey];
    UITextField *tmpTxtField = [[self.dataArray objectAtIndex:indexPath.row] valueForKey:kViewKey];
    [cell.contentView addSubview:tmpTxtField];
    

	return cell;
}


- (UITextField *)txtUser{
	if (txtUser == nil) {
		CGRect frame = CGRectMake(kLeftMargin + 110, 10.0, kTextFieldWidth, kTextFieldHeight);
		txtUser = [[UITextField alloc] initWithFrame:frame];
		txtUser.borderStyle = UITextBorderStyleNone;
		txtUser.textColor = [UIColor blackColor];
		txtUser.font = [UIFont systemFontOfSize:17];
		txtUser.placeholder = @"Phone Number";
		txtUser.backgroundColor = [UIColor whiteColor];
		txtUser.autocorrectionType = UITextAutocorrectionTypeNo;
		txtUser.keyboardType = UIKeyboardTypeNumberPad;
		txtUser.clearButtonMode = UITextFieldViewModeWhileEditing;
		txtUser.tag = kViewTag;
		txtUser.delegate = self;
	}
	return txtUser;
}

- (UITextField *)txtPass{
	if (txtPass == nil) {
		CGRect frame = CGRectMake(kLeftMargin + 110, 10.0, kTextFieldWidth, kTextFieldHeight);
		txtPass = [[UITextField alloc] initWithFrame:frame];
		txtPass.borderStyle = UITextBorderStyleNone;
		txtPass.textColor = [UIColor blackColor];
		txtPass.font = [UIFont systemFontOfSize:17];
		txtPass.placeholder = @" Your Password";
		txtPass.backgroundColor = [UIColor whiteColor];
		txtPass.autocorrectionType = UITextAutocorrectionTypeNo;
		txtPass.keyboardType = UIKeyboardTypeDefault;
		txtPass.returnKeyType = UIReturnKeyDone;
		txtPass.clearButtonMode = UITextFieldViewModeWhileEditing;
		txtPass.tag = kViewTag;
		txtPass.delegate = self;
        txtPass.secureTextEntry = YES; // Make password display "*******"
	}
	return txtPass;
}

#pragma mark UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}


- (IBAction)Login:(id)sender {
    //NSDictionary* errorCode = [DataLayer Login:self.txtUser.text pwd:self.txtPass.text];
//    if([errorCode isEqualToString:SUCCESS])
//    {
        MainTabBarController* ctl = [self.storyboard instantiateViewControllerWithIdentifier:@"LCPanNavigationController"];
        [self presentViewController:ctl animated:YES completion:nil];
//    }else
//    {
//        // show the error message
//        [Utility showErrorMessage:errorCode];
//    }
}

- (IBAction)returnLoginPage:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
