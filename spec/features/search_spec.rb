require_relative '../spec_helper.rb'
require_relative '../../lib/page.rb'
describe "Google search function", :type => :feature do

  before(:each) do
    @main = Page::Main.new
    @main.home.load
  end

  it "should get the search result for test" do
    search_term = 'test'
    @main.home.search(search_term)
    search_result = @main.search_result
    expect(search_result).to be_displayed
    expect(search_result.results[0].title.text.downcase).to include(search_term.downcase)
  end

  it "should return no result for ......" do
    search_term = '......'
    @main.home.search(search_term)
    search_result = @main.search_result
    expect(search_result).to be_displayed
    expect(search_result.no_result.title.text).to eq("Your search - #{search_term} - did not match any documents.")
    expect(search_result).not_to have_results
  end

end
