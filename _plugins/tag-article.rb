#
# Provides tags for writing articles
#

module Jekyll

  module Article

    class ArticleTag < Liquid::Tag

      class << self
        attr_accessor :tag_name
      end

    end

    class ArticleBlock < Liquid::Block

      class << self
        attr_accessor :block_name
      end

    end

    #
    # ---
    #

    class SectionTag < ArticleTag

      @tag_name = "wiki_section"

      def initialize tag_name, text, tokens
        super
        @text = text
      end

      def render context
        %Q{<h1>#{@text}</h1>}
      end

    end

    class SubSectionTag < ArticleTag

      @tag_name = "wiki_subsection"

      def initialize tag_name, text, tokens
        super
        @text = text
      end

      def render context
        %Q{<h2>#{@text}</h2>}
      end

    end

    class NoteBlock < ArticleBlock

      @block_name = "wiki_note"

      def initialize tag_name, text, tokens
        super
        @text = text
      end

      def render context
        <<-EOS
          <div data-alert
              class="alert-box secondary"
              tabindex="0"
              aria-live="assertive"
              role="alertdialog">#{@text}</div>}
        EOS
      end

    end

    class WarningBlock < ArticleBlock

      @block_name = "wiki_warning"

      def initialize tag_name, text, tokens
        super
        @text = text
      end

      def render context
        <<-EOS
          <div data-alert
              class="alert-box"
              tabindex="0"
              aria-live="assertive"
              role="alertdialog">#{@text}</div>}
        EOS
      end

    end

  end

end

[
  Jekyll::Article::SectionTag,
  Jekyll::Article::SubSectionTag,
].each do |klass|
  Liquid::Template.register_tag(klass.tag_name, klass)
end

[
  Jekyll::Article::NoteBlock,
  Jekyll::Article::WarningBlock,
].each do |klass|
  Liquid::Template.register_tag(klass.block_name, klass)
end


