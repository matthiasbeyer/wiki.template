#
# Helpers for writing code in the wiki
#

module Wiki

  module Code
    extend self

    def code_begin language
      "<pre><code class='language-#{language}'>"
    end

    def code_end
      "</code></pre>"
    end

  end

end

