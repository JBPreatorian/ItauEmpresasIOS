//
//  WebViewPostLoadPhasePlugin.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 1/23/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <UIKit/UiKit.h>
#import "WebViewPluginProtocol.h"

@protocol WebViewPostLoadEventPluginProtocol <WebViewPluginProtocol>

- (void)webViewDidFinishLoad:(UIWebView *)webView;

@end
