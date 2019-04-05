require 'feedjira'

module Jekyll
  class MediumPostDisplay < Generator
    safe true
    priority :high
    
    def generate(site)
      jekyll_coll = Jekyll::Collection.new(site, 'medium_posts')
      site.collections['medium_posts'] = jekyll_coll
      Feedjira::Feed.fetch_and_parse("https://medium.com/feed/@cjkaminer").entries.each do |e|
        p "Title: #{e.title}, published on Medium #{e.url} #{e}"
        title = e[:title]
        path = "./_medium_posts/" + title + ".md"
        path = site.in_source_dir(path)
        doc = Jekyll::Document.new(path, { :site => site, :collection => jekyll_coll })
        doc.data['title'] = title;
        doc.data['content'] = e[:content];
        doc.data['external_link'] = e[:url]
        doc.data['date'] = e[:published]
        doc.data['tags'] = e[:categories]
        jekyll_coll.docs << doc
      end
    end
  end
end

# entry properties
# author -> string
# categories -> array of strings (tags from medium)
# content -> entire post (looks like html)
# entry_id -> medium guid url
# published -> utc date of publish
# title -> string
# url -> human readable url
