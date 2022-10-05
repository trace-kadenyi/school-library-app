class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date

    @book = book

    @person = person
  end

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }
  end
end
