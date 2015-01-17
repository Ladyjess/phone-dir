class Contact

  @@all_contacts = []

  def initialize(contact_name, contact_number=nil, id=nil, find_me=nil)
    @contact_name = contact_name
    @contact_number = contact_number
    @id = @@all_contacts.length().+(1)
    @find_me = find_me
  end

  define_method(:contact_name) do
    @contact_name
  end

  define_method(:contact_number) do
    @contact_number
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_singleton_method(:find_me) do |identification|
    @@all_contacts.each() do |my_contact|
      if my_contact.id().eql?(identification.to_i())
        return my_contact
      end
    end
    nil
  end

  define_singleton_method(:search) do |search_term|
    results = []
    @@all_contacts.each() do |my_contact|
      if my_contact.contact_name().downcase().include?(search_term.downcase()) or my_contact.contact_number().include?(search_term)
        results << my_contact
      end
    end
    results
  end
end



class Phone

  @@all_phones = []
  define_method(:initialize) do |office, cell|
    @office = office
    @cell = cell

  end
end
