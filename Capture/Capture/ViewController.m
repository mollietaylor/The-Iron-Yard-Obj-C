//
//  ViewController.m
//  Capture
//
//  Created by Mollie on 1/20/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ViewController.h"
#import "FilterVC.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic) UIImagePickerController *cameraPickerController;
@property (nonatomic) UIImagePickerController *libraryPickerController;

@property (weak, nonatomic) IBOutlet UIButton *openPhotoLibraryButton;
@property (weak, nonatomic) IBOutlet UIButton *takeMediaButton;
@property (weak, nonatomic) IBOutlet UIView *cameraView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mediaChoiceButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *deviceChoiceButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.openPhotoLibraryButton addTarget:self action:@selector(openPhotoLibrary) forControlEvents:UIControlEventTouchUpInside];
    
    self.cameraPickerController = [[UIImagePickerController alloc] init];
    self.cameraPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.cameraPickerController.showsCameraControls = NO;
    
    self.cameraPickerController.delegate = self;
    self.cameraPickerController.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie];
    
    self.cameraPickerController.view.frame = self.cameraView.bounds;
    
    [self.cameraView addSubview:self.cameraPickerController.view];
    
    [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
    
    [self.deviceChoiceButton addTarget:self action:@selector(changeDevice) forControlEvents:UIControlEventValueChanged];
    
}

- (void)changeDevice {
    
    self.cameraPickerController.cameraDevice = (self.deviceChoiceButton.selectedSegmentIndex == 0) ? UIImagePickerControllerCameraDeviceRear : UIImagePickerControllerCameraDeviceFront;
    
}

- (void)changeMediaType {
    
    self.cameraPickerController.cameraCaptureMode = (self.mediaChoiceButton.selectedSegmentIndex == 0) ? UIImagePickerControllerCameraCaptureModePhoto : UIImagePickerControllerCameraCaptureModeVideo;
    
    
    switch (self.mediaChoiceButton.selectedSegmentIndex) {
        case 0: // photo
#warning isRecording boolean 
            [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(startVideoCapture) forControlEvents:UIControlEventTouchUpInside];
            
            [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
            break;
        
        case 1: // video
            [self.takeMediaButton removeTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
            [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(startVideoCapture) forControlEvents:UIControlEventTouchUpInside];
//            if (self.cameraPickerController.) {
//                [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(stopVideoCapture) forControlEvents:UIControlEventTouchUpInside];
//            }
            
            break;
            
        default:
            break;
    }
    
}

- (void)openPhotoLibrary {
    
    self.libraryPickerController = [[UIImagePickerController alloc] init];
    self.libraryPickerController.delegate = self;
    
    [self presentViewController:self.libraryPickerController animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"%@", info);
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [self gotoFilterWithImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)gotoFilterWithImage:(UIImage *)image {
    
    FilterVC *filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"filterVC"];
    
    filterVC.originalImage = image;
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end