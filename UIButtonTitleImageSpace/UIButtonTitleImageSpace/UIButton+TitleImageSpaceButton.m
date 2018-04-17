//
//  UIButton+TitleImageSpaceButton.m
//  Dbug
//
//  Created by YongLeiChu on 2018/4/17.
//  Copyright © 2018年 YongLeiChu. All rights reserved.
//

#import "UIButton+TitleImageSpaceButton.h"
#import <objc/runtime.h>

static const char *UIButton_TitleSpaceRect = "UIButton_TitleSpaceRect";
static const char *UIButton_ImageSpaceRect = "UIButton_ImageSpaceRect";

@implementation UIButton (TitleImageSpaceButton)

- (void)setTitleSpaceRect:(NSString *)titleSpaceRect {
    objc_setAssociatedObject(self, UIButton_TitleSpaceRect, titleSpaceRect, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)titleSpaceRect {
    return objc_getAssociatedObject(self, UIButton_TitleSpaceRect);
}
- (void)setImageSpaceRect:(NSString *)imageSpaceRect {
   objc_setAssociatedObject(self, UIButton_ImageSpaceRect, imageSpaceRect, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)imageSpaceRect {
    return objc_getAssociatedObject(self, UIButton_ImageSpaceRect);
}
+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        //title
        SEL titleOriginalSelector = @selector(titleRectForContentRect:);
        SEL titleSwizzledSelector = @selector(titleSpaceRectForContentRect:);
        Method titleOriginalMethod = class_getInstanceMethod(class, titleOriginalSelector);
        Method titleSwizzledMethod = class_getInstanceMethod(class, titleSwizzledSelector);
        
        //image
        SEL imageOriginalSelector = @selector(imageRectForContentRect:);
        SEL imageSwizzledSelector = @selector(imageSpaceRectForContentRect:);
        Method imageOriginalMethod = class_getInstanceMethod(class, imageOriginalSelector);
        Method imageSwizzledMethod = class_getInstanceMethod(class, imageSwizzledSelector);
        
        //title change method
        BOOL successForTitle = class_addMethod(class, titleOriginalSelector, method_getImplementation(titleSwizzledMethod), method_getTypeEncoding(titleSwizzledMethod));
        if (successForTitle) {
            class_replaceMethod(class, titleSwizzledSelector, method_getImplementation(titleOriginalMethod), method_getTypeEncoding(titleOriginalMethod));
        } else {
            method_exchangeImplementations(titleOriginalMethod, titleSwizzledMethod);
        }
        
        //image change method
        BOOL successImage = class_addMethod(class, imageOriginalSelector, method_getImplementation(imageSwizzledMethod), method_getTypeEncoding(imageSwizzledMethod));
        if (successImage) {
            class_replaceMethod(class, imageSwizzledSelector, method_getImplementation(imageOriginalMethod), method_getTypeEncoding(imageOriginalMethod));
        } else {
            method_exchangeImplementations(imageOriginalMethod, imageSwizzledMethod);
        }
        
    });
}

- (CGRect)titleSpaceRectForContentRect:(CGRect)contentRect {
    if (!self.titleSpaceRect) {
        return contentRect;
    }
    return CGRectFromString(self.titleSpaceRect);
}
- (CGRect)imageSpaceRectForContentRect:(CGRect)contentRect {
    if (!self.imageSpaceRect) {
        return contentRect;
    }
    return CGRectFromString(self.imageSpaceRect);
}
@end
