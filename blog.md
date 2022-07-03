---
permalink: /blog/
---
<h2 class="mt-5 mb-4">Blog Posts</h2>
<ul>
    {% for post in site.posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>
