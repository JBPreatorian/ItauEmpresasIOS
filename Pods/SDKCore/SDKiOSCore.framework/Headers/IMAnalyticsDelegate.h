//
//  IMAnalyticsDelegate.h
//  SDKiOSCore
//
//  Created by Fernanda Geraissate on 26/01/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMAnalyticsObject.h"

@protocol IMAnalyticsDelegate<NSObject>
@required
- (void)callAnalytics:(IMAnalyticsObject *)object;
@end
