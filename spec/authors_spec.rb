require('spec_helper')

describe(Author) do
  describe('#initialize') do
    it('initializes a new author with name and id attributes') do
    author = Author.new({:name => "Bo Bauthor", :id => nil})
    expect(author.name()).to(eq("Bo Bauthor"))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(Author.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the name and id of the author to the database') do
      test_author = Author.new({:name => "Scott Chya", :id => nil})
      test_author.save()
      expect(Author.all()).to(eq([test_author]))
    end
  end

  describe('#==') do
    it('it is the same author if it has the same name') do
      author1 = Author.new({:name => "Scott Chya", :id => nil})
      author2 = Author.new({:name => "Scott Chya", :id => nil})
      expect(author1).to(eq(author2))
    end
  end
end
