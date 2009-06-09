class WikiController < ApplicationController
  before_filter :extract_format, :only => [:show]
  before_filter :load_page
  before_filter :authorize_edit, :only => [:edit, :update]
  
  rescue_from Wiki::InvalidPageVersionError, :with => :invalid_version
  
  def show
    respond_to do |format|
      format.html
    end
  end
  
  def edit
  end
  
  def update
    @page.update(params[:wiki])
    @page.author = current_wiki_author if self.class.method_defined?( :current_wiki_author )

    if @page.save
      flash[:notice] = 'The page has been saved!'
      redirect_to(wiki_page_path(@page.lang, @page.url))
    end
  end
  
  def preview
    @page.content = params[:wiki][:content]

    render :layout => false
  end
  
  def blame
    @blame = @page.blame
  end
  
  def invalid_version
    respond_to do |format|
      format.html { render :action => 'invalid_version' }
    end
  end
  
  private
    def extract_format
      params[:page][-1], params[:format] = params[:page][-1].split('.')
    end
    
    def load_page
      @page = Wiki::Page.new(params[:lang], params[:page], params[:version])
    end
    
    def authorize_edit
      if self.class.method_defined?( :wiki_editor? )
        render :action => 'unauthorized' unless wiki_editor?
        return false
      end
      
      true
    end
end
