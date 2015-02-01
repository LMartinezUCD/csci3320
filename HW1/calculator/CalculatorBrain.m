//
//  CalculatorBrain.m
//  calculator
//
//  Created by Name Yo on 1/31/15.
//  Copyright (c) 2015 cuDenver. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;

@end


@implementation CalculatorBrain


@synthesize operandStack = _operandStack;


- (NSMutableArray *)operandStack
{
    if (!_operandStack)
    {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}


//supposed to be deleted
- (void)setOperandStack:(NSMutableArray *)anArray
{
    _operandStack = anArray;
}


- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    if(operandObject) [self.operandStack removeLastObject];
    [self.operandStack addObject:operandObject];
}



-(double) popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    return [operandObject doubleValue];
}


-(double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    
    else if ([@"*" isEqualToString:operation])
    {
        result = [self popOperand] * [self popOperand];
    }
    
    else if ([operation isEqualToString:@"-"])
    {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    }
    
    else if ([operation isEqualToString:@"/"])
    {
        double divisor = [self popOperand];
        if(divisor) result = [self popOperand] / divisor;
    }
    
    [self pushOperand:result];
    
    return result;
}


@end
