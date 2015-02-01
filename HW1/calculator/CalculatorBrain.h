//
//  CalculatorBrain.h
//  calculator
//
//  Created by Name Yo on 1/31/15.
//  Copyright (c) 2015 cuDenver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void) pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
