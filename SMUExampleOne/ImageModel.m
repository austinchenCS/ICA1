//
//  ImageModel.m
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel()

@property (strong,nonatomic) NSArray* imageNames;

@property (strong, nonatomic) NSMutableArray* images;

@end

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

-(NSMutableArray*)images{
    
    if(!_images) {
        UIImage* image = nil;
        
        for(int i=0; i<_imageNames.count; i++) {
            image = [UIImage imageNamed:_imageNames[i]];
            [_images addObject:image];
        }
    }
    
    return _images;
}


-(UIImage*)getImageWithIndex:(NSUInteger)index
{
    UIImage* image = nil;
    image = _images[index];
    return image;
}

-(NSString*)getImageName:(NSInteger)index
{
    return _imageNames[index];
}

-(NSUInteger)getArrayLength
{
    return 7;
}

@end
