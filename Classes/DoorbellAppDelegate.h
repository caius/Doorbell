//
//  DoorbellAppDelegate.h
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DoorbellAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (retain) IBOutlet NSWindow *window;

@end
