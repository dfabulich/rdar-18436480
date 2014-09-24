//
//  ViewController.m
//  repro
//
//  Created by Dan Fabulich on 2014/9/23.
//  Copyright (c) 2014 Choice of Games. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURL* base = [NSURL URLWithString:@"http://localhost"];
    [webView loadHTMLString:@"<html><body>1<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><button onclick='alert(1);'>button" baseURL:base];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
