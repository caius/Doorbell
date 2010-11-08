//
//  DingDongController.h
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Prowl;

@interface DingDongController : NSObject {
@private
  Prowl *_prowl;
}

- (void) dingDong;

@end
