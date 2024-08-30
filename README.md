## What's for

TLDR: on iOS 16+, when a `UIImageView` set with `_UIAnimatedImage` (created by using `UIImage animatedImageWithImages:duration`), then `stopAnimating` can not stop the animation at all.

on iOS 15-, everything works fine.

## Demo

Just open `UIImageViewStopAnimatingBug.xcodeproj`, run on devices/simulator, click the Demo's `Stop` button to see the result. Compared with iOS 16+ and iOS 15-

## FB14976073
