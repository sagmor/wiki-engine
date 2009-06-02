module Wiki
  class Page
    attr_reader :title
    attr_reader :url
    attr_reader :lang
    attr_writer :content
    attr_accessor :author
    
    def initialize(lang, url)
      @lang = lang
      @url = sanitize_url(url)
      
      @title = (@url.split('/')[-1] || 'index').gsub('_',' ')
    end
    
    def content
      @content || (blob && blob.data)
    end
    
    def new_page?
      blob.nil?
    end
    
    def save
      unless @content.nil?
        index = Wiki.repo.index
        index.add(path, @content)
        index.commit("Updated #{@lang.upcase}:#{title} (#{@url}) @ #{Time.now}", [Wiki.master], actor)
      end
      
      true
    end
    
    private
      def blob
        Wiki.master.tree / path rescue nil
      end
    
      def path
        "#{@lang}/#{@url}.wiki"
      end
      
      def actor
        return nil if @author.nil?
          
        Grit::Actor.new(@author.name, @author.email)
      end
      
      def sanitize_url(url)
        url = url.split('/') if url === String
        
        url = url.inject([]) do |array, param|
          clean = param.gsub(/(^(\s)+)|((\s)+$)/,'').gsub('\s+', '_').gsub('.','')
          if clean.blank?
            array
          else
            array << clean
          end
        end

        url.join('/')
      end
  end
end