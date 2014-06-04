//
//  K3ViewController.h
//  OAuth2_On_iOS_Spike
//
//  Created by Kiran on 04/06/14.
//  Copyright (c) 2014 K3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface K3ViewController : UIViewController <UIWebViewDelegate>
{
    NSMutableData *receivedData;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString *isLogin;
@property (assign, nonatomic) Boolean isReader;
@end
