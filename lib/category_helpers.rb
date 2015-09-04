include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo

#
# Helpers for category stuff
#
module Categories

  #
  # Get a list of all categories
  #
  def all_categories(posts = articles)
    posts.map { |article| article[:categories] }.flatten.compact.uniq.sort
  end

  #
  # Check whether a article has a category or a specific category
  #
  def has_category?(art, cat = nil)
    return false if art[:categories].nil?
    return true if cat.nil?
    art[:categories].include? cat
  end

  def has_categories?(art, cats = all_categories)
    art[:categories].map { |c| cats.include? c }.all?
  end

  #
  # Get all articles with a certain category
  #
  def articles_with_category(c, posts = articles)
    posts.select { |a| has_category? a, c }
  end

  #
  # get articles grouped by category
  #
  def articles_by_category
    all_categories.map { |c| [ c, articles_with_category(c) ] }
  end

  #
  # get the categories of the item
  #
  def categories_for_item i
    i[:categories] || []
  end

  #
  # Comma seperated list of links to categories for the item, or an empty string
  # if the item has no categories.
  #
  def category_links_for_item i
    has_category?(i) ? link_categories(i[:categories]).join(", ") : ""
  end

  #
  # Helper for creating all category pages
  #
  def create_category_pages
    articles_by_category.each do |c, ps|
      cont   = "<%= render('/category.haml', :category => '#{c}') %>"
      conf   = { title: "Posts in #{c}", h1: c.to_s, posts: ps, hide_categories: true}
      link   = "/categories/#{c}.html"
      puts "Creating category page for '#{c}'"
      @items.create(cont, conf, link)
    end
  end

  def create_categories_pages
    cont   = '<%= render("/categories.haml") %>'
    conf   = { categories: all_categories, hide_categories: true }
    link   = "/categories.html"
    puts "Creating categories page"
    @items.create(cont, conf, link)
  end

end

include Categories
