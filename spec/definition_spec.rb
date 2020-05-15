require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Defintion.clear()
    word1 = Word.new("Pink". nil)
    word1.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition1 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition2 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      expect(definition1).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition1 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("an omnivorous domesticated hoofed mammal with sparse bristly hair and a flat snout for rooting in the soil, kept for its meat", @word.id, nil)
      definition2.save()
      expect(Word.all).to(eq([definition1, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition1 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("an omnivorous domesticated hoofed mammal with sparse bristly hair and a flat snout for rooting in the soil, kept for its meat", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition1 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition1 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word1.id, nil)
      definition1.save()
      definition1.update("ROSES!", @word.id, nil)
      expect(word1.name).to(eq("ROSES!"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition1 = Definition.new("of a color intermediate between red and white, as of coral or salmon", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("an omnivorous domesticated hoofed mammal with sparse bristly hair and a flat snout for rooting in the soil, kept for its meat", @word.id, nil)
      definition2.save()
      definition1.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end