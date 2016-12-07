class Patron
  attr_reader :name, :id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_patrons = DB.exec('SELECT * FROM patrons;')
    patrons = []
    all_patrons.each() do |patron|
      name = patron.fetch('name')
      patrons.push(Patron.new({:name => name, :id => nil}))
    end
    patrons
  end

  define_method(:save) do
     DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}');")
  end

  define_method(:==) do |another_patron|
    self.name().==(another_patron.name()).&(self.id().==(another_patron.id()))
  end
end
