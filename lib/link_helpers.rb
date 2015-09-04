include Nanoc::Helpers::LinkTo

module LinkHelpers

  #
  # get link for the category
  #
  def link_category name
    "<a href='/categories/#{name}'>#{name}</a>"
  end

  #
  # get links for the categories
  #
  def link_categories cs
    cs.map { |c| "<a href='/categories/#{c}'>#{c}</a>" }
  end

  #
  # link an article
  #
  def link_article name, filename = nil
    path = "/articles/#{filename.nil? ? name.downcase.gsub(" ", "_") : filename}"
    link_to name, path
  end

end

include LinkHelpers
