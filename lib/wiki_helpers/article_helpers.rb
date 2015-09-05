#
# Helpers for writing a wiki
#

module Wiki

  module Article
    extend self

    class Section < Array

      attr_reader :name

      def initialize name
        @name = name
      end

    end

    def new_section(name, options = { h: 2 })
      @wiki_sections ||= Array.new
      @wiki_sections << Section.new(name)
      generate_section_html(name, options)
    end

    def new_subsection(name, options = { h: 3 })
      @wiki_sections ||= Array.new
      @wiki_sections.last << Section.new(name)
      generate_section_html(name, options)
    end

    def new_subsubsection(name, options= { h: 4 })
      @wiki_sections ||= Array.new
      @wiki_sections.last.last << Section.new(name)
      generate_section_html(name, options)
    end

    def toc
      generate_toc_tree @wiki_sections
    end

    private

    def generate_section_html(name, options)
      "<h#{options[:h]} id='#{section_id name}'>#{name}</h#{options[:h]}><hr>"
    end

    def generate_toc_tree(sections)
      "<ul>" +
      sections.map do |sec|
        "<li><a href='index.html##{section_id sec.name}'>#{sec.name}</a>" +
        generate_toc_tree(sec) + "</li>"
      end.join + "</ul>" if not sections.nil?
    end

    def section_id name
      "sec_#{name}"
    end

  end

end

