#
# Sidebar helpers
#

module Wiki

  module Sidebar
    extend self

    def link href, text
      link_to(text, href, class: "button expand")
    end

  end

end

