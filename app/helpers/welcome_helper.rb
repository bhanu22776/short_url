module WelcomeHelper
  def short_url(url)
    "Short URL is <a href = '#{root_url + url.short_url}'>#{root_url + url.short_url}</a>".html_safe
  end
end
