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
end
