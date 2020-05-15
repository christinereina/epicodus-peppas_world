require'rspec'
require'word'
require'pry'

describe Word do

  before(:each) do
    Word.clear()
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Gold", nil)
      word.save()
      expect(Word.all).to(eq([word]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Gold", nil)
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Gold", nil)
      word2 = Word.new("Pink", nil)
      expect(word).to(eq(word))
    end
  end

  describe('#update') do
    it ("updates an word by id") do
      word = Word.new("Gold", nil)
      word.save()
      word.update("Golden")
      expect(word.word).to(eq("Golden"))
  end
end

describe('#delete') do
  it("deletes an word by id") do
    word = Word.new("Gold", nil)
    word.save()
    word2 = Word.new("Golden", nil)
    word2.save()
    word.delete()
    expect(Word.all).to(eq([word2]))
  end
end

end