require 'pry'

class Definition
  attr_reader :id
  attr_accessor :definition, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @id = attributes.fetch(:id) || @@total_rows += 1
    @word_id = attributes.fetch(:word_id)
  end

  def ==(definition_to_compare)
    (self.definition() == definition_to_compare.definition()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Word.new(self.definition, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(word, word_id)
    self.word = word
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.word, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find_by_word(wor_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wor_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def word
    Word.find(self.word_id)
  end
  
end
