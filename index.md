---
layout: page
title: 
tagline: 
---
{% include JB/setup %}

{% for post in site.posts %}
<div class="post">
    <h2>
      <a class="content_head" href="{{ BASE_PATH}}{{ post.url }}">{{ post.title }}</a>
    </h2>
    <div>
      <span class="content_detail_info">Post created on {{ post.date | date_to_string }}</span>
      {% for tag in post.tags %} 
        {% if forloop.first %}
           <span class="content_detail_info">can be found in </span>
        {% endif %}
        <a class="content_tag" href="tags.html">#{{ tag }}</a>
      {% endfor %}
    </div>  
    </br>
    <div class="content_body">
      {{ post.content }}
    </div>
</div>
{% endfor %}



