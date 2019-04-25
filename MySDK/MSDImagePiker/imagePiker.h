//
//  imagePiker.h
//  CollectionTest
//
//  Created by MHT on 2018/11/30.
//  Copyright © 2018 hfut. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define MSD_IMAGE [imagePiker shareUploadImage]
@protocol imagePikerDelegate <NSObject>
@optional
- (void)uploadImageToServerWithImage:(UIImage *)image;
@end

@interface imagePiker : NSObject <UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIViewController *_fatherViewController;
}

@property (nonatomic ,strong)void(^selectImage)(UIImage *img);

@property (nonatomic, weak) id <imagePikerDelegate> uploadImageDelegate;
+ (imagePiker *)shareUploadImage;
- (void)showActionSheetInFatherViewControllerdelegate:(id<imagePikerDelegate>)aDelegate;

- (void)showActionSheetInFatherViewController:(void(^)(UIImage*img))complate;

@end

NS_ASSUME_NONNULL_END
