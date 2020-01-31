---
layout: page
title: Notes
permalink: /notes/
---

The things posted here will function more like the Notes app on your phone than they will a typical blog. I like to write down (by hand or on my phone) random notes/lists and will do my best to consolidate some of them here. This is more for my benefit than yours but if you want to take a peak at some things I write down, here they are.

{%- if site.notes.size > 0 -%}
  <!-- <h2 class="post-list-heading">{{ page.list_title | default: "Posts" }}</h2> -->
  <ul class="post-list">
    {%- for note in site.notes -%}
    <li>
      <h3>
        <a class="post-link" href="{{ note.url | relative_url }}">
          {{ note.title | escape }}
        </a>
      </h3>
      {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
      <span class="post-meta">Updated: {{ note.updated_date | date: date_format }}</span>
      {%- if site.show_excerpts -%}
        {{ note.excerpt }}
      {%- endif -%}
    </li>
    {%- endfor -%}
  </ul>
{%- endif -%}