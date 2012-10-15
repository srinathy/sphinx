require "fnordmetric"

FnordMetric.namespace :sphin do
   toplist_gauge :popular_articles, title: "Popular articles"
  event :view_article do
    observe :popular_articles, data[:name]    
    incr :article_views_per_second
  end
  event :search do
    observe :popular_keywords, data[:search]
  end	
end

FnordMetric::Web.new(port: 4242)
FnordMetric::Worker.new
FnordMetric.run