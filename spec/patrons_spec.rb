require('spec_helper')

describe(Patron) do
  describe('#initialize') do
    it('initializes a new patron with name and id attributes') do
    patron = Patron.new({:name => 'Sanjay Bookta', :id => nil})
    expect(patron.name()).to(eq('Sanjay Bookta'))
    end
  end

  describe('.all') do
    it('returns an empty array at first') do
      expect(Patron.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the name and id of the patron to the database') do
      test_name = Patron.new({:name => "Chris Cross", :id => nil})
      test_name.save()
      expect(Patron.all()).to(eq([test_name]))
    end
  end

  describe('#==') do
    it('it is the same patron if he/she/they has/have the same name') do
      patron1 = Patron.new({:name => "Jimmy John Jones", :id => nil})
      patron2 = Patron.new({:name => "Jimmy John Jones", :id => nil})
      expect(patron1).to(eq(patron2))
    end
  end

  describe('.find') do
    it('returns a patron by its ID') do
      patron1 = Patron.new({:name => "Nancy Drew", :id => nil})
      patron1.save
      patron2 = Patron.new({:name => "Nancy Poo", :id => nil})
      patron2.save
      expect(Patron.find(patron1.id)).to(eq(patron1))
    end
  end

  describe("#update") do
    it("lets you update patrons in the database") do
      patron = Patron.new({:name => "Stephen Fling", :id => nil})
      patron.save()
      patron.update({:name => "Stephen Bedwin Fling"})
      expect(patron.name()).to(eq("Stephen Bedwin Fling"))
    end
  end

  describe("#delete") do
    it("lets you delete a patron from the database") do
      patron = Patron.new({:name => "J.K. Growling", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Robert Balbraith", :id => nil})
      patron2.save()
      patron.delete()
      expect(Patron.all()).to(eq([patron2]))
    end
  end
end
