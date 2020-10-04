//
//  ProcressGLView.h
//  GPUImageMini
//
//  Created by 古智鹏 on 2020/9/24.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

@interface ProcressGLView : UIView

@property(assign) bool isFullYUVRange;

-(void)show: (CVPixelBufferRef)pixelBuffer;
-(void)setupGL;

@end
