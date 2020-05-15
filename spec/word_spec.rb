require 'rspec'
require 'word'
require 'definition'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('#save') do
    it("saves a word") do
      word1 = Word.new("Pink". nil)
      word1.save()
      word2 = Word.new("Pig", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word1 = Word.new("Pink". nil)
      word1.save()
      word2 = Word.new("Pig", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word1 = Word.new("Pink". nil)
      word2 = Word.new("Pig", nil)
      expect(word1).to(eq(word1))
    end
  end
  
  describe('#update') do
    it("updates an word by id") do
      word1 = Word.new("Pink". nil)
      word1.save()
      word1.update("Peppa")
      expect(word1.name).to(eq("Peppa", nil))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word1 = Word.new("Pink". nil)
      word1.save()
      word2 = Word.new("Pig", nil)
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('initialize') do
    it('it initializes newly added word') do
      word1 = Word.new("Pink". nil)
      word1.save()
      expect(word1.name).to(eq("Pink"))
    end
  end

end