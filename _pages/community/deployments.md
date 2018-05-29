---
title: Deployments Showcase 
author_profile: false
permalink: /community/deployments/
sidebar:
  nav: "community"
---

<h3>from the <a href="https://forum.opendatakit.org/c/showcase">ODK Forum's Showcase</a></h3>
<section id="main" class="wrapper style1">
  {% for entry in site.deployments_feed %}
    <h2>{{ entry.title }}</h2>
    <p>{{ entry.feed_content }}</p>
  {% endfor %}
</section>
