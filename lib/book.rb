class Book
  attr_reader :title, :id

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_books = DB.exec('SELECT * FROM books;')
    books = []
    all_books.each() do |book|
      title = book.fetch('title')
      books.push(Book.new({:title => title, :id => nil}))
    end
    books
  end

  define_method(:save) do
     DB.exec("INSERT INTO books (title) VALUES ('#{@title}');")
  end

  define_method(:==) do |another_book|
    self.title().==(another_book.title()).&(self.id().==(another_book.id()))
  end
end
