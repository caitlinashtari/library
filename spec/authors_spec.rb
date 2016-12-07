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

  describe('.find') do
    it('returns an author by its ID') do
      author1 = Author.new({:name => "Nancy Drew", :id => nil})
      author1.save
      author2 = Author.new({:name => "Nancy Poo", :id => nil})
      author2.save
      expect(Author.find(author1.id)).to(eq(author1))
    end
  end

  describe("#update") do
    it("lets you update authors in the database") do
      author = Author.new({:name => "Stephen King", :id => nil})
      author.save()
      author.update({:name => "Stephen Edwin King"})
      expect(author.name()).to(eq("Stephen Edwin King"))
    end
  end

  describe("#delete") do
    it("lets you delete an author from the database") do
      author = Author.new({:name => "J.K. Rowling", :id => nil})
      author.save()
      author2 = Author.new({:name => "Robert Galbraith", :id => nil})
      author2.save()
      author.delete()
      expect(Author.all()).to(eq([author2]))
    end
  end
end
