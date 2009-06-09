module Wiki
  class Page
    attr_reader :title, :url, :lang
    attr_accessor :content, :author, :change_reason, :version
    
    def initialize(lang, url, version = nil)
      @lang = lang
      @url = sanitize_url(url)
      @version = version
      
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
          'lang' => lang,
          'page' => url,
          'reason' => @change_reason
        }}.to_yaml
        
        index.commit(message, [Wiki.master], (author.nil? ? nil : author.actor))
      end
      
      true
    end
    
    def update(attributes)
      @content = attributes[:content] if attributes[:content]
      @change_reason = attributes[:change_reason] if attributes[:change_reason]
      @author = Wiki::Author.new(attributes[:author]) if attributes[:author]
    end
    
    def blame
      Grit::Blob.blame(Wiki.repo, version || Wiki::MASTER, path)
    end
    
    private
      def commit
        if version.nil?
          Wiki.master
        else
          commit = Wiki.repo.commit(version)
          raise Wiki::InvalidPageVersionError if commit.nil?
          
          commit
        end
      end
    
      def blob
        commit.tree / path unless commit.nil?
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
