//
//  IMUserSecure.h
//  IMUserDefaults
//
//  Created by Makrosystems on 10/26/15.
//  Copyright (c) 2015 Itau Unibanco. All rights reserved.
//

#import "IMUserDefaults.h"

#ifdef __cplusplus
extern "C" {
#endif
    
    /// Saves value only on NSUserDefaults
    BOOL IMUserSecureSetLocalObject(NSString* defaultName ,NSData* value, NSError** error);
    
    /// Saves value on both NSGroup and NSUserDefaults
    IMUserDefaultsStatus IMUserSecureSetSharedObject(NSString* defaultName ,NSData* value, NSError** error);
    
    /// Removes value from both NSGroup and NSUserDefaults
    IMUserDefaultsStatus IMUserSecureRemoveForKey(NSString* defaultName, NSError** error);
    
    /// Get value from NSGroup and NSUserDefaults in that order
    NSData* IMUserSecureObjectForKey(NSString* defaultName, NSError** error);
    
    
    NSString* IMEncryptString(NSString* defaultName ,NSData* value, NSError** error);
    NSString* IMDecryptString(NSString* stringToBeDecrypted,  NSError** error);
    
    #pragma - mark DDIDF
    
    //****** Do not use this methods ******
    NSArray* IMUserSecureDDIDFG();
    //****** Do not use this methods ******
    void IMUserSecureDDIDFS(NSString* string);

#ifdef __cplusplus
}
#endif
