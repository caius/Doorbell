//
//  Prowl.h
//  Doorbell
//
//  Created by Caius Durling on 06/11/2010.
//  Copyright (c) 2010 Swedishcampground Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef void (^CHDVerifyBlockResponse)(BOOL verified);

@interface Prowl : NSObject {
@private
  NSArray *_apikeys;
}

@property (copy, readonly) NSArray *apikeys;

+ (Prowl*) prowlWithAPIKey:(NSString*)apikey;
+ (Prowl*) prowlWithAPIKeys:(NSArray*)apikeys;

- (id) initWithAPIKey:(NSString*)apikey;
- (id) initWithAPIKeys:(NSArray*)apikeys;

- (void) verifyWithBlock:(CHDVerifyBlockResponse)block;
- (void) sendMessage:(NSString *)message;

@end
