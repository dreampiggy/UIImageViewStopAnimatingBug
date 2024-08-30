//
//  ViewController.m
//  UIImageViewStopAnimatingBug
//
//  Created by lizhuoli on 2024/8/29.
//

#import "ViewController.h"

@interface ViewController ()

@property UIImageView *imageView;

@end

@implementation ViewController

- (UIImage *)createUIAnimatedImage {
    CGSize size = CGSizeMake(100, 100);
    UIGraphicsImageRenderer *render = [[UIGraphicsImageRenderer alloc] initWithSize:size];
    UIImage *frame1 = [render imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        CGContextRef context = rendererContext.CGContext;
        CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    }];
    UIImage *frame2 = [render imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        CGContextRef context = rendererContext.CGContext;
        CGContextSetFillColorWithColor(context, UIColor.blueColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    }];
    
    assert(frame1);
    assert(frame2);
    
    UIImage *animatedImage = [UIImage animatedImageWithImages:@[frame1, frame2] duration:1];
    return animatedImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    UIImage *animatedImage = [self createUIAnimatedImage];
    self.imageView.image = animatedImage;
    
    [self.view addSubview:self.imageView];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    [button setTitle:@"Stop" forState:UIControlStateNormal];
    [button setBackgroundColor:UIColor.blackColor];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonTapped:(UIButton *)sender {
    [self.imageView stopAnimating]; // BUG!!!! The UIImageView animation can never stop!
    // You can debug here
}


@end
