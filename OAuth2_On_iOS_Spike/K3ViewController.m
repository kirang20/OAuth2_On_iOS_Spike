
#import "K3ViewController.h"

NSString *client_id = @"580593338579-khj8q25g7fnddm4485ug5e502elgccmb.apps.googleusercontent.com";
NSString *secret = @"otEYv61tDK5rEefB-aezHKXv";
NSString *callbakc =  @"com.spike3.k3:/oauth2callback";
NSString *scope = @"https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile+https://www.google.com/reader/api/0/subscription";
NSString *visibleactions = @"http://schemas.google.com/AddActivity";

@interface K3ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)performLogin:(id)sender;
@end

@implementation K3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performLogin:(id)sender {
    self.loginButton.hidden = YES;
    self.webView.hidden = NO;
    self.webView.scrollView.scrollEnabled = YES;
    self.webView.contentMode = UIViewContentModeScaleAspectFit;
    NSString *url = [NSString stringWithFormat:@"https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=%@&redirect_uri=%@&scope=%@&data-requestvisibleactions=%@",client_id,callbakc,scope,visibleactions];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    //    [indicator startAnimating];
    if ([[[request URL] absoluteString] rangeOfString:@"com.spike3.k3:/oauth2callback"].location != NSNotFound) {
        
        // Extract oauth_verifier from URL query
        NSString* verifier = nil;
        NSArray* urlParams = [[[request URL] query] componentsSeparatedByString:@"&"];
        for (NSString* param in urlParams) {
            NSArray* keyValue = [param componentsSeparatedByString:@"="];
            NSString* key = [keyValue objectAtIndex:0];
            if ([key isEqualToString:@"code"]) {
                verifier = [keyValue objectAtIndex:1];
                
                NSLog(@"Code: %@",verifier);
                break;
            }
        }
    }
    
    return YES;
}

@end
