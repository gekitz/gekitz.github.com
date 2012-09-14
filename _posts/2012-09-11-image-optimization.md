---
layout: post
title: "App Store Size and Image Optimization"
description: ""
category: 
tags: [iOS, Optimization, ImageOptim]
---
{% include JB/setup %}

As we are in the final week of releasing a new App, I checked the estimated App Store size of it. 

Well basically the App has 3 ViewControllers and a bunch of images which empowers them. The estimated size in Xcode's organizer was **36 MB** which really blew my mind.

Nonetheless I googled for some ways to optimize the size of the images. Well several posts pointed out that we could use [ImageOptim](http://www.imageoptim.com) to improve the size. This decreased our estimated App Store size by **5MB**, which wasn't my expected result. (Yes, I thought it would be _more_...)

Further investigations revealed that our background images were huge as hell, the logical next step was to change them to a different format. We switched from PNG to JPG for our background images, yes it takes slightly longer to load them, but it's really worth it and it doesn't really hurt the UX.

One pitfall was that the Default images didn't show up after we changed them from PNG to JPG, we had to set them manually in the `Info.plist` as following:

<br>
<br>
![Sample Info Plist Entry](https://dl.dropbox.com/u/311618/blog/images/grab-info-sample.tiff)
<br>
<br>

The next thing which I hadn't thought about was that `[UIImage imageNamed:@"<name>"]` only looks up PNG images, if you don't add the file extension to the name. As it's quite a huge amount of work to look up all images again and add the file extension to them, I decided to do some [Method Swizzling](http://www.mikeash.com/pyblog/friday-qa-2010-01-29-method-replacement-for-fun-and-profit.html) and added the following code to a `UIImage+Addition` category.
<br>
<br>

<script src="https://gist.github.com/3697816.js?file=UIImage-Addition">Optimization</script>

<br>
<br>
After all the changes we now have an estimated App Store size of about **14MB** which is really a huge improvement.

The following posts are a really good guide for this topic:
- [Tweetbot on ImageOptim](http://imageoptim.com/tweetbot.html)
- [IncrediBooth Optimization](http://samsoff.es/posts/image-optimization-on-ios)

