//
//  STEAppDelegate.m
//  StripeExample
//
//  Created by Benedikt Terhechte on 2/4/15.
//  Copyright (c) 2015 Benedikt Terhechte. All rights reserved.
//

#import "STEAppDelegate.h"

@implementation STEAppDelegate

+ (void) initialize {
    // Display Web Inspector
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"WebKitDeveloperExtras"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark NSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self.webView setFrameLoadDelegate:self];
}

#pragma mark Custom

- (void) openWithURL:(NSString*)urlString {
    [NSApp beginSheet:self.sheetWindow
       modalForWindow:self.window
        modalDelegate:nil
       didEndSelector:NULL
          contextInfo:nil];
    [self.webView setMainFrameURL:urlString];
}

#pragma mark IB Actions

- (IBAction)showBug:(id)sender {
    [self openWithURL:@"https://stripe.com/docs/checkout"];
}

- (IBAction)cancelBug:(id)sender {
    [NSApp endSheet:self.window];
    [NSApp endSheet:self.sheetWindow];
    [self.sheetWindow orderOut:nil];
    [self.webView setMainFrameURL:@"about:blank"];
}

- (IBAction)showNonBug1:(id)sender {
    [self openWithURL:@"http://lab.hakim.se/avgrund/"];
}

- (IBAction)showNonBug2:(id)sender {
    [self openWithURL:@"http://mikekus.com/portfolio"];
}

- (IBAction)goCustomURL:(id)sender {
    NSString *urlString = [self.customURLField stringValue];
    if (!urlString || urlString.length <= 7) {
        NSBeep();
        return;
    }
    NSURL *testURL = [NSURL URLWithString:urlString];
    if (!testURL) {
        NSBeep();
        return;
    }
    
    [self openWithURL:urlString];
}

#pragma mark Web Frame Load Delegate

- (void)webView:(WebView *)sender
didStartProvisionalLoadForFrame:(WebFrame *)frame {
    [self.progressIndicator setHidden:NO];
    [self.progressIndicator startAnimation:nil];
}

- (void)webView:(WebView *)sender
didFinishLoadForFrame:(WebFrame *)frame {
    [self.progressIndicator setHidden:YES];
    [self.progressIndicator stopAnimation:nil];
}

@end
