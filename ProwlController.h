//
//  ProwlController.h
//  Doorbell
//
//  Created by Caius Durling on 07/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Prowl;

@interface ProwlController : NSObject {
@private
    Prowl *_prowl;
}

- (void) fire;

@end
