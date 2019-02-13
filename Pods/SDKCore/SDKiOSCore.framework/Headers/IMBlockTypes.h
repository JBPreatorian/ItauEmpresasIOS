//
//  IMBlockTypes.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/14/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef SDKiOSCore_IMBlockTypes_h
#define SDKiOSCore_IMBlockTypes_h
#import <Foundation/Foundation.h>
#import "IMTokenTypes.h"

@class NSURLSessionDataTask;
@class IMResponse;
@class UIWebView;
    
typedef void (^AFNetworkSuccessBlock)(NSURLSessionDataTask *task, id responseObj);
typedef void (^AFNetworkFailureBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void (^IMCompletionBlock)(IMResponse *responseObj);
typedef void (^IMBaseSuccessBlock)();
typedef void (^IMBaseFailureBlock)();
typedef void (^IMItauWebViewBlock)(UIWebView *webView);
typedef void (^TokenSuccessCompletionBlock)(IMResponse * responseObj, IMTokenType type);
typedef void (^TokenFailureCompletionBlock)();
typedef void (^FacialBiometryCompletionBlock)(BOOL success, NSDictionary* response);

#endif
