require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Gold", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition2 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition.save()
      definition2 = Definition.new("an omnivorous domesticated hoofed mammal with sparse bristly hair and a flat snout for rooting in the soil, kept for its meat", @word.id, nil)
      definition2.save()
      expect(Word.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition.save()
      definition2 = Definition.new("an omnivorous domesticated hoofed mammal with sparse bristly hair and a flat snout for rooting in the soil, kept for its meat", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word1.id, nil)
      definition.save()
      definition.update("ROSES!", @word.id, nil)
      expect(word1.name).to(eq("ROSES!"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition.save()
      definition2 = Definition.new("an omnivorous domesticated hoofed mammal with sparse bristly hair and a flat snout for rooting in the soil, kept for its meat", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds the definition for a word") do
      word2 = Word.new("Gold", nil)
      word2.save
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition.save()
      definition2 = Definition.new("an omnivorous domesticated hoofed mammal with sparse bristly hair and a flat snout for rooting in the soil, kept for its meat", @word.id, nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([word2]))
    end
  end

  describe('#word') do
    it("finds the word the definition belongs to") do
      definition = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition.save()
      expect(definition.album()).to(eq(@word))
    end
  end

end