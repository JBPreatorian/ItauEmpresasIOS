//
//  SDKiOSCore.h
//  SDKiOSCore
//
//  Created by Bruno Santos on 6/27/17.
//  Copyright © 2017 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for SDKCore.
FOUNDATION_EXPORT double SDKiOSCoreVersionNumber;

//! Project version string for SDKCore.
FOUNDATION_EXPORT const unsigned char SDKiOSCoreVersionString[];

#import "IMMiddlewareJarvis.h"
#import "IMMotorManager.h"
#import "NSString+Matcher.h"

#import "IMAnalyticsObject.h"
#import "IMAppConfigurator.h"
#import "IMBackendClient+AccessKey.h"
#import "IMBackendClient+Feedback.h"
#import "IMBackendClient+Middleware.h"
#import "IMBackendClient+Token.h"
#import "IMBackendClient+CardPassword.h"
#import "IMBackendClient+Cvv.h"
#import "IMBackendClient+TokenValidationRequest.h"
#import "IMBackendClient+Simility.h"
#import "IMBackendClient+FaceBiometry.h"
#import "IMBackendClient+EletronicPassword.h"
#import "IMBackendClient+SMS.h"
#import "IMBackendClient+TouchID.h"
#import "IMBackendClient+Authentication.h"
#import "IMBackendClient.h"

#import "IMBackendClientSetupKeys.h"
#import "IMBlockTypes.h"
#import "IMTokenTypes.h"
#import "IMClientParams.h"
#import "IMErrorFactoryCodeStatus.h"
#import "IMHeader.h"
#import "IMLocation.h"
#import "IMResponse.h"
#import "IMLocation.h"
#import "NSDictionary+IMUtils.h"
#import "RemoteBundleManager.h"
#import "IMDeviceDetection.h"

#import "IMUnlockTokenVO.h"

#import <AFNetworking/AFNetworking.h>
#import <AFNetworkActivityLogger/AFNetworkActivityLogger.h>

#import "IMUserSecure.h"

#import "IMErrorResponseFactory.h"
#import "IMResponseSecurity.h"

#import "IMTokenConfigurableObject.h"

#import "IMTokenManager.h"
#import "IMTokenManagerDelegate.h"

#import "IMTokenAuthenticatorManager+Helpers.h"
#import "IMAccessKeyManager.h"
#import "IMAccessKeyManagerDelegate.h"
#import "IMCvvValidationDelegate.h"
#import "IMCardPasswordManagerDelegate.h"
#import "IMFaceBiometryManagerDelegate.h"
#import "IMEletronicPasswordManagerDelegate.h"
#import "IMSMSManagerDelegate.h"
#import "IMTouchIDManagerDelegate.h"

#import "LegacyMenu.h"
#import "TokensModelContainer.h"

#import "IMNetworkHelpers.h"
#import "IMUrlQueryBuilder.h"
#import "IMOfferTokenUserInfoKeys.h"

#import "IMTrackerDelegate.h"

#import "IMBackendClient+TokenCitiRequest.h"

#import "BioParameterManager.h"


