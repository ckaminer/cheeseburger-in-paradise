require 'httparty'

module Jekyll
  class MediumPostDisplay < Generator
    safe true
    priority :high
    
    def generate(site)
      jekyll_coll = Jekyll::Collection.new(site, 'medium_posts')
      entries = HTTParty.get('https://medium.com/feed/@cjkaminer')
      entries["rss"]["channel"]["item"].each do |e|
        title = e["title"]
        p "Title: #{title}, fetched from Medium"
        path = "./_medium_posts/#{title}.md"
        path = site.in_source_dir(path)
        doc = Jekyll::Document.new(path, { :site => site, :collection => jekyll_coll })
        doc.data['title'] = title;
        doc.data['external_link'] = e["link"]
        doc.data['date'] = e["pubDate"]
        doc.data['tags'] = e["category"]
        jekyll_coll.docs << doc
      end
      site.collections['medium_posts'] = jekyll_coll
    end
  end
end
