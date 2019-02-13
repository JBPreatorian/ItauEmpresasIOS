//
//  IMCvvValidationDelegate.h
//  SDKiOSCore
//
//  Created by Henrique Silva Brighenti on 5/18/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMCvvValidationDelegate <NSObject>
- (void)didEnterCvv:(NSString *)cvv withCardId:(NSString *)cardId finally:(void (^)(void))finally;
@end
