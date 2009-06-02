class WikiController < ApplicationController
  before_filter :extract_format, :only => [:show]
  before_filter :load_page
  
  def show
    respond_to do |format|
      format.html
    end
  end
  
  def edit
  end
  
  def update
    @page.content = params[:wiki][:content]

    if @page.save
      flash[:notice] = 'La Página se ha salvado!'
      redirect_to(wiki_page_path(@page.lang, @page.url))
    end
  end
  
  private
    def extract_format
      page, format = params[:page][-1].split('.')
      
      params[:page][-1] = page
      params[:format] = format
    end
    
    def load_page
      @page = Wiki::Page.new(params[:lang], params[:page])
    end

end