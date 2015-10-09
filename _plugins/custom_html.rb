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
        begin
          token = tokens.next
        rescue StopIteration
          return
        end

        if is_comment?(token) and (matches = text(token).match /<(\S+)>/)
          matches.captures.first
        end
      end

      def is_comment?(token)
        type(token) == Rouge::Token::Tokens::Comment::Single
      end

      def type(token)
        token[0]
      end

      def text(token)
        token[1]
      end

    end
  end
end
