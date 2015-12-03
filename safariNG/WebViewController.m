//
//  WebViewController.m
//  safariNG
//
//  Created by Michael Moss on 10/21/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate, UITextFieldDelegate,  UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *userInput = textField.text;
    
    if([userInput rangeOfString:@"http://"].location == NSNotFound){
        NSString *http = @"http://";
        userInput = [http stringByAppendingString:userInput];
    }
    NSURL *url = [NSURL URLWithString:userInput];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    return YES;
}
- (IBAction)goBack:(UIButton *)sender {
    [self.webView goBack];
}
- (IBAction)goForward:(UIButton *)sender {
    [self.webView goForward];
}
- (IBAction)stopLoadingView:(UIButton *)sender {
    [self.webView stopLoading];
}
- (IBAction)reloadPage:(UIButton *)sender {
    [self.webView reload];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.inputField.c
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
