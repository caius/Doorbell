//
//  Prowl.m
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

/*
 
 Base URL: https://prowl.weks.net/publicapi/<method>
 
 */

#import "Prowl.h"
#import <LRResty/LRResty.h>

@interface Prowl ()
@property (copy, readwrite) NSArray *apikeys;

- (NSString*) apikeysAsString;
@end

@implementation Prowl

@synthesize apikeys = _apikeys;

+ (Prowl *)prowlWithAPIKey:(NSString *)apikey
{
  return [[[Prowl alloc] initWithAPIKey:apikey] autorelease];
}

+ (Prowl*) prowlWithAPIKeys:(NSArray *)apikeys
{
  return [[[Prowl alloc] initWithAPIKeys:apikeys] autorelease];
}

- (id)initWithAPIKey:(NSString*)apikey {
  return [self initWithAPIKeys:[NSArray arrayWithObject:apikey]];
}

- (id) initWithAPIKeys:(NSArray *)apikeys
{
  if ((self = [super init])) {
    self.apikeys = apikeys;
  }

  return self;
}

- (void) verifyWithBlock:(CHDVerifyBlockResponse)block
{
  NSString *verify_url = @"https://prowl.weks.net/publicapi/verify";
  NSMutableDictionary *params = [NSMutableDictionary dictionary];
  
  [params setObject:[self apikeysAsString] forKey:@"apikey"];
  
  [[LRResty client] get:verify_url parameters:params withBlock:^(LRRestyResponse *r) {
    NSLog(@"Verify Response Code: %d", [r status]);
    block((BOOL)[r status] == 200);
  }];
}

- (void) sendMessage:(NSString *)message
{
  NSString *add_url = @"https://prowl.weks.net/publicapi/add";
  NSMutableDictionary *params = [NSMutableDictionary dictionary];
  
  [params setObject:[self apikeysAsString] forKey:@"apikey"];
  [params setObject:message forKey:@"description"];
  [params setObject:@"Doorbell" forKey:@"application"];
  
  [[LRResty client] get:add_url parameters:params withBlock:^(LRRestyResponse *r) {
    NSLog(@"Add response: %d", [r status]);
  }];
}

#pragma mark 
#pragma mark Private Methods

- (NSString*) apikeysAsString
{
  return [self.apikeys componentsJoinedByString:@","];
}

- (void)dealloc {
  // Clean-up code here.
  self.apikeys = nil;
  
  [super dealloc];
}

@end
