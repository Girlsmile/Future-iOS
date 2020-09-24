//
//  ViewController.m
//  GPUImageMini
//
//  Created by 古智鹏 on 2020/9/24.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import "ProcressGLView.h"

@interface ViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>

@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) ProcressGLView *showGLPreview;

@end

@interface ViewController()

//负责输入和输出设备之间的数据传递
@property(nonatomic, strong) AVCaptureSession *captureSession;
//负责从AVCaptureDevice获得输入数据
@property(nonatomic, strong)AVCaptureDeviceInput *captureDeviceInput;
//output
@property(nonatomic, strong)AVCaptureVideoDataOutput *mCaptureDeviceOutput;

@end



@implementation ViewController
{
    //主要处理队列
    dispatch_queue_t mProcessQueue;
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    
    static long frameID = 0;
    ++frameID;
    CFRetain(sampleBuffer);
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        CVPixelBufferRef pixelBufferRef = CMSampleBufferGetImageBuffer(sampleBuffer);
        [self.showGLPreview show: pixelBufferRef];
        self.label.text = [NSString stringWithFormat:@"%ld",frameID];
        CFRelease(sampleBuffer);
    });
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupUI:true];
    dispatch_after(0.3, dispatch_get_main_queue(), ^{
        
        [self->_showGLPreview setupGL];
        [self setupCamera];
    });
    
}



-(void)setupCamera {
    //captureSession 担当ch
    self.captureSession = [[AVCaptureSession alloc] init];
    self.captureSession.sessionPreset = AVCaptureSessionPresetHigh;
    
    [self setupQueue];
    
    //寻找设备
    AVCaptureDevice *inputCamera = nil;
    NSArray *devices = [AVCaptureDevice devicesWithMediaType: AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == AVCaptureDevicePositionBack)
        {
            inputCamera = device;
        }
    }
    
    // 链接
    self.captureDeviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:inputCamera error:nil];
    
    if ([self.captureSession canAddInput:self.captureDeviceInput]) {
        [self.captureSession addInput:self.captureDeviceInput];
    }

    
    self.mCaptureDeviceOutput = [[AVCaptureVideoDataOutput alloc] init];
    [self.mCaptureDeviceOutput setAlwaysDiscardsLateVideoFrames:NO];
    
    self.showGLPreview.isFullYUVRange = YES;
    
    
    [self.mCaptureDeviceOutput setVideoSettings:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_420YpCbCr8BiPlanarFullRange] forKey:(id)kCVPixelBufferPixelFormatTypeKey]];
    [self.mCaptureDeviceOutput setSampleBufferDelegate:self queue:mProcessQueue];
    if ([self.captureSession canAddOutput:self.mCaptureDeviceOutput]) {
        [self.captureSession addOutput:self.mCaptureDeviceOutput];
    }
    
    AVCaptureConnection *connection = [self.mCaptureDeviceOutput connectionWithMediaType:AVMediaTypeVideo];
    [connection setVideoOrientation:AVCaptureVideoOrientationPortraitUpsideDown];
    
    
    [self.captureSession startRunning];
    
    
    
}
-(void)setupQueue {
    mProcessQueue = dispatch_queue_create("camera.gl.filter", DISPATCH_QUEUE_SERIAL);
}

-(void)setupUI: (BOOL) need {
    CGRect labelRect = CGRectMake(10, 10, 40, 40);
    _label = [[UILabel alloc] initWithFrame: labelRect];
    _label.text = @"text";
    _showGLPreview = [[ProcressGLView alloc] init];
    _showGLPreview.frame = self.view.bounds;
    _showGLPreview.backgroundColor = [UIColor systemBlueColor];
    
  
    
    
    [self.view addSubview: _label];
    [self.view addSubview: _showGLPreview];
    [self.view bringSubviewToFront: _label];
    
    
}

@end
