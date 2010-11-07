//
//  DoorbellAppDelegate.m
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import "DoorbellAppDelegate.h"
#import "DingDongController.h"
#import "HIDRemote.h"

@implementation DoorbellAppDelegate

@synthesize window;
@synthesize dingDongController = _dingDongController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  
  NSLog(@"Setting up remote");
  [[HIDRemote sharedHIDRemote] setDelegate:self];
	
  if ([[HIDRemote sharedHIDRemote] startRemoteControl:kHIDRemoteModeExclusiveAuto]) {
    // Start successful
    NSLog(@"listening for remote");
  } else {
    // Start failed
    NSLog(@"start failed");
  }  
}

- (void)hidRemote:(HIDRemote *)hidRemote eventWithButton:(HIDRemoteButtonCode)buttonCode isPressed:(BOOL)isPressed fromHardwareWithAttributes:(NSMutableDictionary *)attributes
{
  //	NSLog(@"%@: Button with code %d %@", hidRemote, buttonCode, (isPressed ? @"pressed" : @"released"));
  // Check if it's the centre button clicked & that it's the release event
  if (buttonCode == 5 && isPressed) {
    NSLog(@"DING DONG");
    [self.dingDongController dingDong];
  }
}

- (void)dealloc {
  self.dingDongController = nil;
  [window release];
  [super dealloc];
}

@end
