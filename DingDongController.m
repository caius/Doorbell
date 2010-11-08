//
//  DingDongController.m
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import "DingDongController.h"
#import "Prowl.h"

@interface DingDongController ()
@property (retain, readwrite) Prowl *prowl;

- (void) notifyProwl;
- (void) playDingDong;
@end

@implementation DingDongController

@synthesize prowl = _prowl;

- (id)init {
  if ((self = [super init])) {
    self.prowl = [Prowl prowlWithAPIKey:@"YOUR KEY HERE"];
  }
  return self;
}

- (void) dingDong
{
  [self notifyProwl];
  //  [self notifyTwitter];
  [self playDingDong];
//  [self flashScreen];
}

- (void) notifyProwl
{
  [self.prowl sendMessage:@"DING DONG!!"];
}

- (void) playDingDong
{
  NSSound *playa = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"doorbell" ofType:@"wav"] byReference:NO];
  [playa play];
}

@end
