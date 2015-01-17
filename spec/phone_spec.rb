require('rspec')
require('phonebook')


describe(Contact) do
  before() do
    Contact.clear()
 end

  describe('#contact_name') do
   it("gives the name of the contact") do
    test_entry = Contact.new("Janice")
      expect(test_entry.contact_name()).to(eq("Janice"))
    end
  end

  describe('#contact_number') do
    it("provides the number of the contact") do
      test_entry = Contact.new(nil, "080756739")
      expect(test_entry.contact_number()).to(eq("080756739"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".find_me") do
    it("returns contact by id number") do
      test_entry = Contact.new("Calvin", 68000)
      test_entry.save()
      test_entry2 = Contact.new("Calvin", 67000)
      test_entry2.save()
      expect(Contact.find_me(test_entry.id())).to(eq(test_entry))
    end
  end

  describe('#id') do
    it("returns id of the contact") do
      test_entry = Contact.new("Calvin", 68000)
      test_entry2 = Contact.new("Kimbery", 123456)
      test_entry.save()
      expect(test_entry.id()).to(eq(1))
    end
  end


  describe("#save") do
    it('adds a contact to the list of saved contacts') do
      test_entry = Contact.new("Amber", "Calvin")
      test_entry.save()
      expect(Contact.all()).to(eq([test_entry]))
    end
  end

  describe('.clear') do
    it("clears the contact history") do
      Contact.new("Amber").save()
      Contact.new("Kevin").save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end
end


# describe(Phone) do
#   describe('#') do
#     it("")
#     who = Type.new
#     expect(what.contact_name).to(eq())
#   end
