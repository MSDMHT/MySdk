//
//  imagePiker.m
//  CollectionTest
//
//  Created by MHT on 2018/11/30.
//  Copyright © 2018 hfut. All rights reserved.
//

#import "imagePiker.h"
static imagePiker *zxUploadImage = nil;
@implementation imagePiker
+ (imagePiker *)shareUploadImage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zxUploadImage = [[imagePiker alloc] init];
    });
    return zxUploadImage;
    
}

- (void)showActionSheetInFatherViewController:(void (^)(UIImage * _Nonnull))complate{
    self.selectImage = complate;
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *showAllInfoAction = [UIAlertAction actionWithTitle:@"从手机相册上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self fromPhotos];
        
    }];
    UIAlertAction *commentAction = [UIAlertAction actionWithTitle:@"相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self createPhotoView];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheetController addAction:cancelAction];
    [actionSheetController addAction:commentAction];
    [actionSheetController addAction:showAllInfoAction];
    
    [[self topViewController] presentViewController:actionSheetController animated:YES completion:nil];
    
    
}

- (void)showActionSheetInFatherViewControllerdelegate:(id<imagePikerDelegate>)aDelegate {
    zxUploadImage.uploadImageDelegate = aDelegate;
    

    
    
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *showAllInfoAction = [UIAlertAction actionWithTitle:@"从手机相册上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self fromPhotos];
        
    }];
    UIAlertAction *commentAction = [UIAlertAction actionWithTitle:@"相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [self createPhotoView];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheetController addAction:cancelAction];
    [actionSheetController addAction:commentAction];
    [actionSheetController addAction:showAllInfoAction];
    
    [[self topViewController] presentViewController:actionSheetController animated:YES completion:nil];
    
}

-(UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}
-(UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:nav.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

#pragma mark - 头像(相机和从相册中选择)
- (void)createPhotoView {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
        imagePC.sourceType                = UIImagePickerControllerSourceTypeCamera;
        imagePC.delegate                  = self;
        imagePC.allowsEditing             = YES;
        [[self topViewController] presentViewController:imagePC
                                            animated:YES
                                          completion:^{
                                          }];
    }else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                         message:@"该设备没有照相机"
                                                        delegate:nil
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alert show];
    }
}
- (void)fromPhotos {
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    imagePC.sourceType                = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePC.delegate                  = self;
    imagePC.allowsEditing             = YES;
    [[self topViewController] presentViewController:imagePC
                                        animated:YES
                                      completion:^{
                                      }];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    !self.selectImage?:self.selectImage(image);
    if (self.uploadImageDelegate && [self.uploadImageDelegate respondsToSelector:@selector(uploadImageToServerWithImage:)]) {
        [self.uploadImageDelegate uploadImageToServerWithImage:image];
    
    }
}

@end
