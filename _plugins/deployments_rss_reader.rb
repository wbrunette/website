require 'feedjira'

module Jekyll
  class DeploymentsRssReader < Generator
    safe true
    priority :high

def generate(site)
      deployments_rss_collection = Jekyll::Collection.new(site, 'deployments_feed')
      site.collections['deployments_feed'] = deployments_rss_collection
	  url = "https://forum.opendatakit.org/c/showcase.rss"
	  feed = Feedjira::Feed.fetch_and_parse url
		
	  feed.entries.each do |entry|
		title = entry[:title]
		#a proper path should be unnecessary since output is turned off in _config.yml, left in case someone turns on
        path = site.in_source_dir("./_contribution_feed/" + title + ".md") 
        doc = Jekyll::Document.new(path, { :site => site, :collection => deployments_rss_collection })
        doc.data['title'] = title;
        doc.data['feed_content'] = entry[:summary];
        deployments_rss_collection.docs << doc
      end
    end
  end
end
