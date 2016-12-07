require('spec_helper')

describe(Book) do
  describe('#initialize') do
    it('initializes a new book with name and id attributes') do
    book = Book.new({:title => "Nancy Drew: The Mystery at Lilac Inn", :id => nil})
    expect(book.title()).to(eq("Nancy Drew: The Mystery at Lilac Inn"))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(Book.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the title and id of the book to the database') do
      test_title = Book.new({:title => "Nancy Drew: The Mystery at Lilac Inn", :id => nil})
      test_title.save()
      expect(Book.all()).to(eq([test_title]))
    end
  end

  describe('#==') do
    it('it is the same book if it has the same title') do
      book1 = Book.new({:title => "Nancy Drew: The Mystery at Lilac Inn", :id => nil})
      book2 = Book.new({:title => "Nancy Drew: The Mystery at Lilac Inn", :id => nil})
      expect(book1).to(eq(book2))
    end
  end

  describe('.find') do
    it('returns a book by its ID') do
      book1 = Book.new({:title => "Nancy Drew: The Mystery of the Crumbling Wall", :id => nil})
      book1.save
      book2 = Book.new({:title => "Nancy Drew: The Mystery at Lilac Inn", :id => nil})
      book2.save
      expect(Book.find(book1.id)).to(eq(book1))
    end
  end

  describe("#update") do
    it("lets you update books in the database") do
      book = Book.new({:title => "Wild", :id => nil})
      book.save()
      book.update({:title => "Where the Wild Things Are"})
      expect(book.title()).to(eq("Where the Wild Things Are"))
    end
  end

  describe("#delete") do
    it("lets you delete a book from the database") do
      book = Book.new({:title => "Junie B. Jones", :id => nil})
      book.save()
      book2 = Book.new({:title => "Harry Potter and the Sorcerers Stone", :id => nil})
      book2.save()
      book.delete()
      expect(Book.all()).to(eq([book2]))
    end
  end
end
