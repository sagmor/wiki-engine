ActionController::Routing::Routes.draw do |map|
  
  map.with_options({  :path_prefix => 'wiki', 
                      :name_prefix => 'wiki_', 
                      :controller => :wiki }) do |wiki|
    
    wiki.edit      ':lang/*page/edit.:format',      :action => 'edit',
                                                    :conditions => { :method => :get }
    wiki.revisions ':lang/*page/revisions.:format', :action => 'edit',
                                                    :conditions => { :method => :get }
    wiki.page      ':lang/*page.:format',           :action => 'show',
                                                    :conditions => { :method => :get }
    wiki.connect   ':lang/*page.:format',           :action => 'update',
                                                    :conditions => { :method => :post }
    
  end
end
