require_relative '../spec_helper.rb'
require_relative '../../lib/page.rb'
describe "Google", :type => :feature do
  shared_examples 'page object testing' do
    context 'search function' do
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
  end

  describe 'chrome driver', driver: :chrome do
    it_behaves_like 'page object testing'
  end

  describe 'chrome headless driver', driver: :chrome_headless do
    it_behaves_like 'page object testing'
  end

end