//
//  WelcomeVC.m
//	testfilters
//

#import <AVFoundation/AVFoundation.h>

#import "WelcomeVC.h"
#import "WelcomeViewOutput.h"

@interface WelcomeVC () <AVCapturePhotoCaptureDelegate>

@property (nonatomic, strong) AVCaptureSession *capturesSession;
@property (nonatomic, strong) AVCapturePhotoOutput *stillImageOutput;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@property (nonatomic, weak) IBOutlet UILabel *errorLabel;

@end

@implementation WelcomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

- (void)viewDidAppear: (BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self setupCamera];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.capturesSession stopRunning];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - Actions

- (IBAction)galleryAction:(id)sender
{
    [self.output galleryAction];
}

- (IBAction)shootAction:(id)sender
{
    AVCapturePhotoSettings *settings = [AVCapturePhotoSettings photoSettingsWithFormat:@{AVVideoCodecKey: AVVideoCodecTypeJPEG}];

    [self.stillImageOutput capturePhotoWithSettings:settings delegate:self];
}

#pragma mark - Private

- (void)setupCamera
{
    self.capturesSession = [AVCaptureSession new];
    self.capturesSession.sessionPreset = AVCaptureSessionPresetPhoto;
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!backCamera) {
        self.errorLabel.hidden = NO;
        NSLog(@"Unable to access back camera!");
        return;
    }
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:backCamera error:&error];
    if (error) {
        self.errorLabel.hidden = NO;
        NSLog(@"Error Unable to initialize back camera: %@", error.localizedDescription);
        return;
    }
    self.stillImageOutput = [AVCapturePhotoOutput new];

    if ([self.capturesSession canAddInput:input] && [self.capturesSession canAddOutput:self.stillImageOutput]) {
        self.errorLabel.hidden = YES;
        [self.capturesSession addInput:input];
        [self.capturesSession addOutput:self.stillImageOutput];
        [self setupLivePreview];
    }
}

- (void)setupLivePreview {
    self.videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.capturesSession];
    if (self.videoPreviewLayer) {
        self.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        self.videoPreviewLayer.connection.videoOrientation = AVCaptureVideoOrientationPortrait;
        [self.view.layer addSublayer:self.videoPreviewLayer];
        
        dispatch_queue_t globalQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        dispatch_async(globalQueue, ^{
            [self.capturesSession startRunning];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.videoPreviewLayer.frame = self.view.bounds;
            });
        });
    }
}

#pragma mark - <AVCapturePhotoCaptureDelegate>

- (void)captureOutput:(AVCapturePhotoOutput *)output didFinishProcessingPhoto:(AVCapturePhoto *)photo error:(nullable NSError *)error
{
    NSData *imageData = photo.fileDataRepresentation;
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        [self.output didShootImage:image];
    }
}

#pragma mark - <ViewInput>

- (void)setupInitialState
{
}

@end
