require 'rouge'

module Rouge
  module Formatters
    class HTML < Formatter
      def format(*args, &b)
        if @wrap
          "<figure class='code'>" + super(*args, &b) + "</figure>"
        else
          super(*args, &b)
        end
      end

      alias_method :old_stream, :stream
      def stream(tokens, &b)
        if @wrap and (filename = get_filename(tokens))
          yield "<figcaption class='code-header'>#{filename}</figcaption>"
          old_stream tokens.drop(2), &b
        else
          old_stream tokens, &b
        end
      end

      private

      def get_filename(tokens)
        token1, token2 = tokens.next, tokens.next

        if first_line_comment?(token1, token2)
          matches = text(token1).match /<([\S ]+)>/
          if matches
            matches.captures.first
          end
        end
      end

      def type(token)
        token[0]
      end

      def text(token)
        token[1]
      end

      def first_line_comment?(token1, token2)
        comment = Rouge::Token::Tokens::Comment::Single
        plaintext = Rouge::Token::Tokens::Text

        type(token1) == comment and type(token2) == plaintext and text(token2) == "\n"
      end
    end
  end
end
