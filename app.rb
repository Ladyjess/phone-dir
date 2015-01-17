require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/phonebook')

get('/') do
  @my_contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  contact_name = params.fetch("contact_name")
  contact_number = params.fetch("contact_number")
  new_contact = Contact.new(contact_name, contact_number)
  new_contact.save()
  @my_contacts = Contact.all()
  erb(:index)
end

get('/contacts/:id') do
  @new_contact = Contact.find_me(params.fetch("id"))
  erb(:contact_detail)
end

post('/search') do
  query = params.fetch("search_term")
  @searched_contacts = Contact.search(query)
  erb(:index)

end
