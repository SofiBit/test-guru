module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{t('app.project')} #{repo}", "https://github.com/#{author}/#{repo}", target: :_blank
  end

  def flash_message(type)
    content_tag(:p, flash[type], class: "flash #{type}") if flash.now[type]
  end

  def bootstrap_class(name)
    { success: 'alert-success',
      error: 'alert-danger',
      danger: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[name.to_sym] || name
  end

  def gist_hash(url)
    url.split('/').last
  end
end
