//
//  STEAppDelegate.h
//  StripeExample
//
//  Created by Benedikt Terhechte on 2/4/15.
//  Copyright (c) 2015 Benedikt Terhechte. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface STEAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *sheetWindow;
@property (assign) IBOutlet WebView *webView;

@property (assign) IBOutlet NSProgressIndicator *progressIndicator;

@property (assign) IBOutlet NSTextField *customURLField;

- (IBAction)showBug:(id)sender;
- (IBAction)cancelBug:(id)sender;
- (IBAction)showNonBug1:(id)sender;
- (IBAction)showNonBug2:(id)sender;
- (IBAction)goCustomURL:(id)sender;

@end
