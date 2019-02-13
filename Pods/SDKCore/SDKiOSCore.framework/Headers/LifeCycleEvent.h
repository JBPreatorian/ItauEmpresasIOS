//
//  LifeCycleEvent.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 1/24/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#ifndef LifeCycleEvent_h
#define LifeCycleEvent_h

typedef NS_ENUM(NSInteger, LifeCycleEvent) {
    LifeCycleEventPreLoad,
    LifeCycleEventLoad,
    LifeCycleEventPostLoad,
    LifeCycleEventCancel
};

#endif /* LifeCycleEvent_h */
