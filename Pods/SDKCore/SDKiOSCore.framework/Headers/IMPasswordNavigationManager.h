//
//  IMPasswordNavigationManager.h
//  SDKiOSCore
//
//  Created by Bruno Santos on 10/24/17.
//  Copyright © 2017 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMPasswordNavigationManagerDelegate<NSObject>
- (void)closeController;
@end

@interface IMPasswordNavigationManager: NSObject

@property (nonatomic, strong) id<IMPasswordNavigationManagerDelegate> delegate;

- (void)closeController;

@end

