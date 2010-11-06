//
//  DoorbellAppDelegate.h
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <LRResty/LRResty.h>

@class Prowl;

@interface DoorbellAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow *window;
  Prowl *_prowl;
}

@property (retain) IBOutlet NSWindow *window;
@property (retain, readonly) Prowl *prowl;

- (void) dingDong;

@end
