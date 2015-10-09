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
          old_stream remove_top(tokens), &b
        else
          old_stream tokens, &b
        end
      end

      private

      def get_filename(tokens)
        begin
          token = tokens.peek
        rescue StopIteration
          return
        end

        if is_comment?(token)
          match_data = text(token).match /~(.*)~/
          match_data and match_data.captures.first
        end
      end

      def is_comment?(token)
        type(token) == Rouge::Token::Tokens::Comment or type(token) == Rouge::Token::Tokens::Comment::Single
      end

      def is_plaintext?(token)
        type(token) == Rouge::Token::Tokens::Text
      end

      def is_newline?(token)
        text(token) =~ /^\s*$/
      end

      def type(token)
        token[0]
      end

      def text(token)
        token[1]
      end

      def remove_top(tokens)
        tokens = tokens.drop(1)
        tokens.drop_while do |token|
          is_plaintext?(token) and is_newline?(token)
        end
      end

    end
  end
end
