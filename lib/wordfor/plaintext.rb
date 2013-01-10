module Wordfor
  class Plaintext
    class << self
      def print message=nil
        puts message
      end

      # turn line into lines of text of columns length
      def wrapped_text *args
        options = {
          :line_width => columns
        }.merge args.extract_options!

        line = args.shift

        word_wrap(line, options)
      end

      private

      def word_wrap(text, options={})
        options = {
          :line_width => columns,
          :preserve_whitespace => false
        }.merge options

        unless options[:preserve_whitespace]
          text = text.gsub(/\s+/, ' ') # collapse whitespace
        end

        prefix = options[:indent] ? options[:indent] : ''

        line_width = options[:line_width]
        lines = ['']

        space = ' '
        space_size = 2
        space_left = line_width
        text.split.each do |word|
          if (word.size + space.size) >= space_left
            word       = "%s%s" % [prefix, word]
            space_left = line_width - (word.size + space_size)
            lines << ""
          else
            space_left = space_left - (word.size + space_size)
          end

          lines.last << "%s%s" % [word, space]
        end

        lines.join "\n"
      end

      def columns
        @columns || (begin
                       @columns = `stty size`.split.last.to_i
                     rescue
                       @columns = 80
                     end)
      end
    end
  end
end
