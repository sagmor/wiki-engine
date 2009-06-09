ActionController::Routing::Routes.draw do |map|
  
  map.with_options({  :path_prefix => 'wiki', 
                      :name_prefix => 'wiki_', 
                      :controller => 'wiki' }) do |wiki|
    
    wiki.edit      ':lang/*page/edit',              :action => 'edit',
                                                    :conditions => { :method => :get }
    wiki.preview   ':lang/*page/preview',           :action => 'preview',
                                                    :conditions => { :method => :post }
    wiki.connect   ':lang/',                        :action => 'show',
                                                    :conditions => { :method => :get },
                                                    :page => ['index']
    wiki.page      ':lang/*page.:format',           :action => 'show',
                                                    :conditions => { :method => :get }
    wiki.connect   ':lang/*page.:format',           :action => 'update',
                                                    :conditions => { :method => :post }
    
  end
end
