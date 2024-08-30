## What's for

TLDR: on iOS 16+, when a `UIImageView` set with `_UIAnimatedImage` (created by using `UIImage animatedImageWithImages:duration`), then `stopAnimating` can not stop the animation at all.

on iOS 15-, everything works fine.

## Demo

Just open `UIImageViewStopAnimatingBug.xcodeproj`, run on devices/simulator, click the Demo's `Stop` button to see the result. Compared with iOS 16+ and iOS 15-

## Workaround

Use `animationImages` instead. Stupid but works.

+ From:

```objective-c
imageView.image = animatedImage; // This is a `_UIAnimatedImage`
// Do not need startAnimating, it's automatic start
```

+ To:

```objective-c
imageView.image = animatedImage.images.firstObject; // This is a `_UIAnimatedImage`
imageView.animationImages = animatedImage.images; // This is a `_UIAnimatedImage`
imageView.animationDuration = animatedImage.duration; // This is a `_UIAnimatedImage`
[imageView startAnimating]; // You must start by yourself (no automatic start unlike the above one)
```


## FB14976073
