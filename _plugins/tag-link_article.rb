#
# Provides a tag for linking articles
#

module Jekyll

  module Article

    class LinkTag < Liquid::Tag

      def initialize tag_name, text, tokens
        super
        @text = text
      end

      def render context
        title = @text.strip.gsub " ", "_"
        text = @text.strip

        %Q{<a class="link article_link" href="/wiki/articles/#{title}.html">#{text}</a>}
      end

    end

  end

end

Liquid::Template.register_tag('link_article', Jekyll::Article::LinkTag)
