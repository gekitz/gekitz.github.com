---
layout: post
title: "Jekyll Tag Plugin and Github"
description: ""
category: 
tags: [jekyll, tags, plugin, github]
---
{% include JB/setup %}

The other day I thought about listing all posts which correspond to a specific **tag** on my blog.

A quick search pointed out that a Jekyll plugin was the right way to go. I found [this](https://github.com/mojombo/jekyll/wiki/Plugins) Jekyll category generator, which basically does nearly everything I need for my **tag listing**, but for categories.

I modified it a bit to fit my needs and everything worked as aspected on my local machine, but as soon as I uploaded it to Github things got worse. Basically everything which was related to this plugin was broken. I clicked on a tag and I just got a 404, because the site didn't exist. 

Well I figured out that currently it's impossible to run custom plugins on Github pages.

I came up with a different idea, I now create my tag sites locally on my machine and instead of storing them under **\_site/tags** I save them in the root directory in a **tags** folder and commit them to Github. That's how I circumvent that the generation has to happen on the Github servers.

Here is the source of my generator plugin:
<script src="https://gist.github.com/3767548.js?file=generate_tags.rb">generator</script>

Here is the source of the template I use:
<script src="https://gist.github.com/3767693.js?file=tag_index.html">template</script>


As far as I can tell it works pretty well, just keep in mind to run **jekyll --server** at least once before you commit it to Github, otherwise you're tags won't be created.

 