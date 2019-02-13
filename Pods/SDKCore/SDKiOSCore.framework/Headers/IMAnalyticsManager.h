//
//  IMAnalyticsManager.h
//  SDKiOSCore
//
//  Created by Fernanda Geraissate on 26/01/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMAnalyticsDelegate.h"

@interface IMAnalyticsManager: NSObject

@property (nonatomic, strong) id<IMAnalyticsDelegate> delegate;

- (void)callAnalytics:(IMAnalyticsObject *)object;

@end
