set :site_title, 'Charles Treatman'
set :google_tracking_id, 'UA-41733257-1'  # TODO: move to env var?
set :social_links, [
  {
    url: 'http://github.com/ctreatma',
    site: 'github'
  },
  {
    url: 'http://linkedin.com/in/charlestreatman',
    site: 'linkedin'
  },
  {
    url: 'http://stackoverflow.com/users/1106267/charles',
    site: 'stack-overflow'
  },
  {
    url: 'http://twitter.com/ctreatma',
    site: 'twitter'
  }
]

activate :blog do |blog|
  blog.layout = "post"
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'
