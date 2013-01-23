require 'wordnet'

# WordNet!
module Wordfor
  class Lookup
    def initialize
      @lexicon = WordNet::Lexicon.new
    end

    # Based on example code:
    #
    # lex = WordNet::Lexicon.new
    # lex.lookup_synsets('time').map {|o|
    #   o.traverse(:hyponyms).with_index.map {|ss, i|
    #     [ss.part_of_speech.to_sym, ss.words.map(&:lemma)]
    #   }
    # }.reject {|l| l.size == 0}

    def lookup(word)
      origins = @lexicon.lookup_synsets word

      @visited = {}

      @pos_map = {}
      origins.each {|o|
        break if @visited[o.synsetid]
        @visited[o.synsetid] = o

        pos = o.part_of_speech.to_sym

        @pos_map[pos] ||= {}
        @pos_map[pos]['syn'] ||= []
        @pos_map[pos]['syn'].concat filter(o.words.map(&:lemma), word)

        o.traverse(:hyponyms).with_index.each {|ss|
          break if @visited[ss.synsetid]
          @visited[ss.synsetid] = ss

          pos = ss.part_of_speech.to_sym

          @pos_map[pos] ||= {}
          @pos_map[pos]['syn'] ||= []
          @pos_map[pos]['syn'].concat filter(ss.words.map(&:lemma), word)
        }

        o.traverse(:antonyms).with_index.each {|ss|
          break if @visited[ss.synsetid]
          @visited[ss.synsetid] = ss

          pos = ss.part_of_speech.to_sym

          @pos_map[pos] ||= {}
          @pos_map[pos]['ant'] ||= []
          @pos_map[pos]['ant'].concat filter(ss.words.map(&:lemma), word)
        }
      }

      @pos_map
    end

    private

    def filter list, word
      list.reject {|w| w == word}
    end
  end
end
