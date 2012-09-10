---
layout: post
title: "Jalapeno is hot"
description: ""
category: 
tags: [node.js, file, observer]
---
{% include JB/setup %}

What is [jalapeno](http://github.com/gekitz/jalapeno) and why is it hot?

Well jalapeno is a modul written in node.js, which basically observes a given folder and copies all changed files
to a destination directory. I came up with this thing, because I often work with [Darran Morris](http://twitter.com/darranmorris), who is a brilliant [Designer](http://app-bits.com) and our workflow is like this:

- discussion about a design for something
- he makes all the assets and copys them into our shared [Dropbox](http://dropbox.com) folder.
- I copy the assets into our project directory and build a new version

As you can probably imagine, it's quite difficult to keep track of all the changed files and it's a little bit annoying to copy them to the app's destination folder all the time something changes. 

That's where jalapeno comes in handy, because jalapeno solves this **file changed** and **copy changed file to destination** for you.
You can find how to use it from on [here](http://github.com/gekitz/jalapeno).

One thing which is missing on the Github page is how I actually included it into **my** workflow, because it's
a little bit annoying that you have to start jalapeno manually all the time when you restart your computer.

This is how I finally solved this issue:

- Fire up Automator and choose **Application**
- Search for **Run Shell Script** and add it
- Add the script below to the script window
- Save the whole thing as application

Script:

	/usr/local/bin/node /Users/georgkitz/Documents/Arbeit/jalapeno/jalapeno -list /Users/georgkitz/Documents/Arbeit/jalapeno/observe.json

Now you have an Automator Application. The last step is to make it a startup item, in order to start jalapeno everytime you start your Mac.

- Open System Preferences
- Select Users & Groups
- Select your Account
- Select Login Items
- Add jalapeno
- **Done**

Hope that helps to ease your life and explains why jalapeno is really hot.