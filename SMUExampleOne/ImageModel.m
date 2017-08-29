//
//  ImageModel.m
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

-(NSArray*)imageNames
{
    
    if(!_imageNames)
        _imageNames = @[@"Eric1",@"Eric2",@"Eric3",@"Kevin1",@"Kellen1",@"Austin1",@"Logan1"];
    
    return _imageNames;
}

+(ImageModel*)sharedInstance
{
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(UIImage*)getImageWithIndex:(NSUInteger)index
{
    UIImage* image = nil;
    NSString* name = [_imageNames objectAtIndex:index];
    image = [UIImage imageNamed:name];
    return image;
}

-(NSUInteger)getArrayLength
{
    return [_imageNames count];
}

@end
