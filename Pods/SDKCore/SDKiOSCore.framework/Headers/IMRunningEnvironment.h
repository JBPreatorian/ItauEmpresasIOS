//
//  AXMindReader.h
//  Pods
//
//  Created by Alexandre Garrefa on 6/2/15.
//
//

#import <Foundation/Foundation.h>

@interface IMRunningEnvironment: NSObject

BOOL IMREnvironmentIsDevelopment(void);

BOOL IMREnvironmentIsProduction(void);

BOOL IMREnvironmentParamsShouldBeEncrypted(void);

@end
