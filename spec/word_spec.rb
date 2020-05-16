require'rspec'
require'word'
require 'definition'
require 'pry'

describe "#Word" do

  before(:each) do
    Word.clear()
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new({:word => "Peppa", :id => nil})
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
      word = Word.new({:word => "Peppa", :id => nil})
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new({:word => "Peppa", :id => nil})
      word2 = Word.new({:word => "Pig", :id => nil})
      expect(word).to(eq(word))
    end
  end

  describe('#update') do
    it ("updates an word by id") do
      word = Word.new({:word => "Peppa", :id => nil})
      word.save()
      word.update("George")
      expect(word.word).to(eq("George"))
  end
end

describe('#delete') do
  it("deletes an word by id") do
    word = Word.new({:word => "Peppa", :id => nil})
    word.save()
    word2 = Word.new({:word => "Pig", :id => nil})
    word2.save()
    word.delete()
    expect(Word.all).to(eq([word2]))
  end
end

end