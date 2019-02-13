//
//  IMWebView.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 10/16/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMBlockTypes.h"
#import "IMValidateTokenNotificationManager.h"
#import <UIKit/UIKit.h>

#import "WebViewPluginProtocol.h"
#import "LifeCycleEvent.h"
#import "IMNativeFeature.h"

@interface IMItauWebView: UIWebView

- (void)loadWithParams:(NSDictionary *)params
  shouldStartLoadBlock:(IMItauWebViewBlock)shouldStartLoadBlock
     didStartLoadBlock:(IMItauWebViewBlock)didStartLoadBlock
    didFinishLoadBlock:(IMItauWebViewBlock)didFinishLoadBlock
      didFailLoadBlock:(IMCompletionBlock)didFailLoadBlock;
- (void)loadWithParams:(NSDictionary *)params
  shouldStartLoadBlock:(IMItauWebViewBlock)shouldStartLoadBlock
     didStartLoadBlock:(IMItauWebViewBlock)didStartLoadBlock
    didFinishLoadBlock:(IMItauWebViewBlock)didFinishLoadBlock
      didFailLoadBlock:(IMCompletionBlock)didFailLoadBlock
            titleBlock:(void (^)(NSString *title))titleBlock;

- (void)loadWithNSUrl:(NSURL *)url
 shouldStartLoadBlock:(IMItauWebViewBlock)shouldStartLoadBlock
    didStartLoadBlock:(IMItauWebViewBlock)didStartLoadBlock
   didFinishLoadBlock:(IMItauWebViewBlock)didFinishLoadBlock
     didFailLoadBlock:(IMCompletionBlock)didFailLoadBlock;
- (void)loadWithNSUrl:(NSURL *)url
 shouldStartLoadBlock:(IMItauWebViewBlock)shouldStartLoadBlock
    didStartLoadBlock:(IMItauWebViewBlock)didStartLoadBlock
   didFinishLoadBlock:(IMItauWebViewBlock)didFinishLoadBlock
     didFailLoadBlock:(IMCompletionBlock)didFailLoadBlock
           titleBlock:(void (^)(NSString *title))titleBlock;

- (void)loadWithNSUrl:(NSURL *)url
               params:(NSDictionary *)params
 shouldStartLoadBlock:(IMItauWebViewBlock)shouldStartLoadBlock
    didStartLoadBlock:(IMItauWebViewBlock)didStartLoadBlock
   didFinishLoadBlock:(IMItauWebViewBlock)didFinishLoadBlock
     didFailLoadBlock:(IMCompletionBlock)didFailLoadBlock
           titleBlock:(void (^)(NSString *title))titleBlock;

- (void)loadWithSPA:(NSString *)spa
             params:(NSDictionary *)params
shouldStartLoadBlock:(IMItauWebViewBlock)shouldStartLoadBlock
  didStartLoadBlock:(IMItauWebViewBlock)didStartLoadBlock
 didFinishLoadBlock:(IMItauWebViewBlock)didFinishLoadBlock
   didFailLoadBlock:(IMCompletionBlock)didFailLoadBlock;

- (void)loadWithLoyalty:(NSString *)loyalty
             params:(NSDictionary *)params
shouldStartLoadBlock:(IMItauWebViewBlock)shouldStartLoadBlock
  didStartLoadBlock:(IMItauWebViewBlock)didStartLoadBlock
 didFinishLoadBlock:(IMItauWebViewBlock)didFinishLoadBlock
   didFailLoadBlock:(IMCompletionBlock)didFailLoadBlock;

- (void)superDestroyWebView;

- (void)setupValidateTokenNotificationDelegate:(id<IMValidateTokenNotificationManagerDelegate>)delegate;
- (void)cancelSecondsRemainingWaiting;
- (void)saveDataToLocalStorage:(NSString *)key value:(NSString *)value;
- (NSString *)getDataToLocalStorage:(NSString *)key;

- (void)addPlugin:(id<WebViewPluginProtocol>)plugin;
- (void)addPlugin:(id<WebViewPluginProtocol>)plugin forLifecycleEvent:(LifeCycleEvent)event;
- (void)removePlugin:(id<WebViewPluginProtocol>)plugin;
- (void)removePlugin:(id<WebViewPluginProtocol>)plugin forLifecycleEvent:(LifeCycleEvent)event;

- (void)responseNativeFeature:(NSString*)response;

@end
