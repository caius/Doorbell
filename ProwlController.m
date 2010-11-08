//
//  ProwlController.m
//  Doorbell
//
//  Created by Caius Durling on 07/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import "ProwlController.h"

@interface ProwlController ()

@property (retain, readwrite) Prowl *prowl;

@end

@implementation ProwlController

@synthesize prowl = _prowl;

- (id)init {
  if ((self = [super init])) {
    // Initialization code here.
    self.prowl = [self buildProwl];
  }
  
  return self;
}

- (Prowl*) buildProwl
{
  
  return [Prowl prowlWithAPIKeys:];
}

- (void)dealloc {
  // Clean-up code here.
  self.prowl = nil;
  [super dealloc];
}

@end
