module Wiki
  class Author
    attr_accessor :name
    attr_accessor :email
    
    def initialize(atributes)
      @name = atributes[:name]
      @email = atributes[:email]
    end
    
    def actor
      Grit::Actor.new(name, email)
    end
  end
end
