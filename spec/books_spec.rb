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
end
