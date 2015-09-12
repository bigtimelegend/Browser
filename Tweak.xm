static UIWindow *content = nil;

%hook SBIconController

-(void)iconWasTapped:(id)fp8{

NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@",NSHomeDirectory(),@"com.yourcompany.browser.plist"]];

NSNumber* shouldNotify = [settings objectForKey:@"enabled"];


%orig;
if ([shouldNotify boolValue] == YES) {

if (!content) {

content = [[UIWindow alloc] 
initWithFrame:CGRectMake(0,0,250,400)];
content.windowLevel = UIWindowLevelStatusBar;
content.backgroundColor = [UIColor clearColor];
content.hidden = NO;

UIWebView *webView = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 250, 400)] autorelease];

NSString *url=@"http://www.google.com"; NSURL *nsurl=[NSURL URLWithString:url]; NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl]; [webView loadRequest:nsrequest]; 

[content addSubview:webView];



UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
myButton.frame = CGRectMake(20, 20, 30, 30);
[myButton setTitle:@"Exit" forState:UIControlStateNormal];
[myButton addTarget:self action:@selector(myButtonPressed) forControlEvents:UIControlEventTouchUpInside];
[content addSubview:myButton];
}

}

else {
%orig;

}

}

%new

-(void)myButtonPressed {
content.hidden = YES;
content = nil;

}

%end
