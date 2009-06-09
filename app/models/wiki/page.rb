module Wiki
  class Page
    attr_reader :title
    attr_reader :url
    attr_reader :lang
    attr_writer :content
    attr_accessor :author
    attr_accessor :change_reason
    
    def initialize(lang, url)
      @lang = lang
      @url = sanitize_url(url)
      
      @title = (@url.split('/')[-1] || 'index').gsub('_',' ').titleize
    end
    
    def content
      @content || (blob && blob.data) || ''
    end
    
    def new_page?
      blob.nil?
    end
    
    def save
      unless @content.nil?
        index = Wiki.repo.index
        index.add(path, @content)
        message = { 'Update' => {
          'title' => title,
          'lang' => @lang,
          'page' => @url,
          'reason' => @change_reason
        }}.to_yaml
        
        index.commit(message, [Wiki.master], actor)
      end
      
      true
    end
    
    def update(attributes)
      @content = attributes[:content] if attributes[:content]
      @change_reason = attributes[:change_reason] if attributes[:change_reason]
      @author = Wiki::Author.new(attributes[:author]) if attributes[:author]
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
