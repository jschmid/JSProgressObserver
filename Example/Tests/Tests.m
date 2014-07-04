//
//  JSProgressObserverTests.m
//  JSProgressObserverTests
//
//  Created by Jonas Schmid on 07/04/2014.
//  Copyright (c) 2014 Jonas Schmid. All rights reserved.
//

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{
    context(@"will pass", ^{

        it(@"can do maths",
           ^{ [[theValue(1) should] beLessThan:theValue(23)]; });

        it(@"can read", ^{ [[@"team" shouldNot] containString:@"I"]; });
    });
});

SPEC_END
