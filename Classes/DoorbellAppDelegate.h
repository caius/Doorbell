//
//  DoorbellAppDelegate.h
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <LRResty/LRResty.h>

@class DingDongController;

@interface DoorbellAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow *window;
  DingDongController *_dingDongController;
}

@property (retain) IBOutlet NSWindow *window;
@property (retain) IBOutlet DingDongController *dingDongController;

@end
