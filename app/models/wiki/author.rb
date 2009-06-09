module Wiki
  class Author
    attr_accessor :name
    attr_accessor :email
    
    def initialize(atributes)
      @name = atributes[:name]
      @email = atributes[:email]
    end
  end
end
