class Author
  attr_reader :name, :id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_authors = DB.exec('SELECT * FROM authors;')
    authors = []
    all_authors.each() do |author|
      name = author.fetch('name')
      authors.push(Author.new({:name => name, :id => nil}))
    end
    authors
  end

  define_method(:save) do
     DB.exec("INSERT INTO authors (name) VALUES ('#{@name}');")
  end

  define_method(:==) do |another_author|
    self.name().==(another_author.name()).&(self.id().==(another_author.id()))
  end
end
