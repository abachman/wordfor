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
      @input_word = word
      @visited = {}
      @pos_map = {}

      origins = @lexicon.lookup_synsets word

      origins.each {|o|
        break if visited?(o)
        add_synset_to_map o, :synonyms

        o.traverse(:hyponyms).with_index.each {|ss|
          break if visited?(ss)
          add_synset_to_map ss, :hyponyms
        }

        o.traverse(:hypernyms).with_index.each {|ss|
          break if visited?(ss)
          add_synset_to_map ss, :hypernyms
        }

        o.traverse(:antonyms).with_index.each {|ss|
          break if visited?(ss)
          add_synset_to_map ss, :antonyms
        }
      }

      @pos_map
    end

    private

    def visited? ss
      if @visited[ss.synsetid]
        true
      else
        @visited[ss.synsetid] = ss
        false
      end
    end

    def filter list, word
      list.reject {|w| w == word}
    end

    def add_synset_to_map synset, relation
      pos = synset.part_of_speech.to_sym

      @pos_map[pos] ||= {}
      @pos_map[pos][relation] ||= []
      @pos_map[pos][relation].concat filter(synset.words.map(&:lemma), @input_word)
    end
  end
end
