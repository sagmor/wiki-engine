require 'test_helper'

class WikiRoutesTest < ActionController::TestCase
  test "path recognition" do
    
    assert_recognizes({
      :controller => 'wiki', :action => 'show', :lang => 'en',
      :page => ['some','page','url']
    }, '/wiki/en/some/page/url')
    
    assert_recognizes({
      :controller => 'wiki', :action => 'show', :lang => 'en',
      :page => ['some','other','page','url']
    }, '/wiki/en/some/other/page/url')

    assert_recognizes({
      :controller => 'wiki', :action => 'show', :lang => 'en',
      :page => ['some','page','url.xml']
    }, '/wiki/en/some/page/url.xml')

    assert_recognizes({
      :controller => 'wiki', :action => 'edit', :lang => 'en',
      :page => ['some','page','url']
    }, '/wiki/en/some/page/url/edit')
  end
end