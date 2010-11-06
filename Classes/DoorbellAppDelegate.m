//
//  DoorbellAppDelegate.m
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import "DoorbellAppDelegate.h"
#import "Prowl.h"
#import "HIDRemote.h"

@interface DoorbellAppDelegate ()
@property (retain, readwrite) Prowl *prowl;
@end

@implementation DoorbellAppDelegate

@synthesize window;
@synthesize prowl = _prowl;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  NSLog(@"Creating Prowl");
    
  self.prowl = [Prowl prowlWithAPIKey:@"ce2da058a7fb4043f065c840a6f5b4f6074a8064"];
  NSLog(@"self.prowl: %@", self.prowl);
  
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
    [self dingDong];
  }
}

- (void) dingDong
{
  [self.prowl sendMessage:@"DING DONG"];
}

- (void)dealloc {

    [window release];
    [super dealloc];
}

@end
