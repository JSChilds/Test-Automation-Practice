require_relative 'spec_helper.rb'
require_relative '../practice_form.rb'

describe PracticeForm do

	before(:all) do
		@form = PracticeForm.new
		@form.go_to_form
	end

	it "should go to the automation form" do
		expect(@form.current_url).to eq("http://toolsqa.com/automation-practice-form/")
	end

	it "should find the main content div that houses the form and for it to have all the appropriate fields" do
		expect(@form.get_div(id: 'content').exists?).to eq(true)

		expect(@form.get_div(id: 'content').text).to include('Practice Automation Form')
		expect(@form.get_div(id: 'content').text).to include('PERSONAL INFORMATION')
		expect(@form.get_div(id: 'content').text).to include('Partial Link Test Link Test')
		expect(@form.get_div(id: 'content').text).to include('First name: Last name:')
		expect(@form.get_div(id: 'content').text).to include('Sex')
		expect(@form.get_div(id: 'content').text).to include('Years of Experience')
		expect(@form.get_div(id: 'content').text).to include('Date:')
		expect(@form.get_div(id: 'content').text).to include('Profession')
		expect(@form.get_div(id: 'content').text).to include('Profile Picture')
		expect(@form.get_div(id: 'content').text).to include('Download Framework')
		expect(@form.get_div(id: 'content').text).to include('Automation Tool')
		expect(@form.get_div(id: 'content').text).to include('Continents')
		expect(@form.get_div(id: 'content').text).to include('Selenium Commands')
	end

	it "should find partial link test and link back to the form when it's clicked" do
		expect(@form.get_link(href: 'http://toolsqa.wpengine.com/automation-practice-form/').exists?).to eq(true)
	
		@form.get_link(href: 'http://toolsqa.wpengine.com/automation-practice-form/').click
		expect(@form.current_url).to eq('http://toolsqa.com/automation-practice-form/')
	end

	it "should find link test and link to the practice table when it's clicked" do
		expect(@form.get_link(href: 'http://toolsqa.wpengine.com/automation-practice-table/').exists?).to eq(true)
	
		@form.get_link(href: 'http://toolsqa.wpengine.com/automation-practice-table/').click
		expect(@form.current_url).to eq('http://toolsqa.com/automation-practice-table/')
		expect(@form.get_table(class: 'tsc_table_s13').exists?).to eq(true)

		@form.go_to_form
	end

	it "should find the first name text field and enter text into it" do
		expect(@form.get_text_field(name: 'firstname').exists?).to eq(true)
	
		@form.get_text_field(name: 'firstname').send_keys('Joseph')
		expect(@form.get_text_field(name: 'firstname').value).to eq('Joseph')
	end

	it "should find the last name text field and enter text into it" do
		expect(@form.get_text_field(name: 'lastname').exists?).to eq(true)
	
		@form.get_text_field(name: 'lastname').send_keys('Childs')
		expect(@form.get_text_field(name: 'lastname').value).to eq('Childs')
	end

	it "should find the male and female radio options and set them" do
		expect(@form.get_radio_button(id: 'sex-0').exists?).to eq(true)
		expect(@form.get_radio_button(id: 'sex-1').exists?).to eq(true)

		@form.get_radio_button(id: 'sex-0').set
		expect(@form.get_radio_button(id: 'sex-0').set?).to eq(true)

		@form.get_radio_button(id: 'sex-1').set
		expect(@form.get_radio_button(id: 'sex-1').set?).to eq(true)
	end

	it "should find the 1, 2, 3, 4, 5, 6 and 7 years of experience radio options" do
		expect(@form.get_radio_button(id: 'exp-0').exists?).to eq(true)
		expect(@form.get_radio_button(id: 'exp-1').exists?).to eq(true)
		expect(@form.get_radio_button(id: 'exp-2').exists?).to eq(true)
		expect(@form.get_radio_button(id: 'exp-3').exists?).to eq(true)
		expect(@form.get_radio_button(id: 'exp-4').exists?).to eq(true)
		expect(@form.get_radio_button(id: 'exp-5').exists?).to eq(true)
		expect(@form.get_radio_button(id: 'exp-6').exists?).to eq(true)
	end

	it "should set the 1, 2, 3, 4, 5, 6 and 7 years of experience radio options" do
		@form.get_radio_button(id: 'exp-0').set
		expect(@form.get_radio_button(id: 'exp-0').set?).to eq(true)

		@form.get_radio_button(id: 'exp-1').set
		expect(@form.get_radio_button(id: 'exp-1').set?).to eq(true)

		@form.get_radio_button(id: 'exp-2').set
		expect(@form.get_radio_button(id: 'exp-2').set?).to eq(true)

		@form.get_radio_button(id: 'exp-3').set
		expect(@form.get_radio_button(id: 'exp-3').set?).to eq(true)

		@form.get_radio_button(id: 'exp-4').set
		expect(@form.get_radio_button(id: 'exp-4').set?).to eq(true)

		@form.get_radio_button(id: 'exp-5').set
		expect(@form.get_radio_button(id: 'exp-5').set?).to eq(true)

		@form.get_radio_button(id: 'exp-6').set
		expect(@form.get_radio_button(id: 'exp-6').set?).to eq(true)
	end

	it "should find the date text field and enter text into it" do
		expect(@form.get_text_field(id: 'datepicker').exists?).to eq(true)

		@form.get_text_field(id: 'datepicker').send_keys('02/08/2017')
		expect(@form.get_text_field(id: 'datepicker').value).to eq('02/08/2017')
	end

	it "should find the manual tester and automation tester checkbox options for profession and select them" do
		expect(@form.get_checkbox(id: 'profession-0').exists?).to eq(true)
		expect(@form.get_checkbox(id: 'profession-1').exists?).to eq(true)

		@form.get_checkbox(id: 'profession-0').set
		expect(@form.get_checkbox(id: 'profession-0').set?).to eq(true)

		@form.get_checkbox(id: 'profession-1').set
		expect(@form.get_checkbox(id: 'profession-1').set?).to eq(true)
	end

	it "should find the choose file button for profile picture and when it's clicked, give an option to upload a file" do
		expect(@form.get_file_field(id: 'photo').exists?).to eq(true)
		
		@form.get_file_field(id: 'photo').value=('/Users/Tech-A40/Jumanji.png')
		expect(@form.get_file_field(id: 'photo').value).to eq('C:\\fakepath\\Jumanji.png')
	end

	it "should find the selenium automation hybrid framework link for download framework and when clicked, download a file called OnlineStore.zip" do
		expect(@form.get_link(href: 'http://toolsqa.wpengine.com/wp-content/uploads/2014/04/OnlineStore.zip').exists?).to eq(true)
	
		@form.get_link(href: 'http://toolsqa.wpengine.com/wp-content/uploads/2014/04/OnlineStore.zip').click

		sleep(20)

	 	expect(File.directory?("#{Dir.pwd}/downloads")).to be(true)
	 	expect(File.exist?("#{Dir.pwd}/downloads/OnlineStore.zip")).to be(true)
	end

	it "should find the selenium automation hybrid framework link for download framework and when clicked, download a file called Test-File-to-Download.xlsx" do
		expect(@form.get_link(href: 'http://20tvni1sjxyh352kld2lslvc.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Test-File-to-Download.xlsx').exists?).to eq(true)
	
		@form.get_link(href: 'http://20tvni1sjxyh352kld2lslvc.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Test-File-to-Download.xlsx').click

		sleep(5)

	 	expect(File.directory?("#{Dir.pwd}/downloads")).to be(true)
	 	expect(File.exist?("#{Dir.pwd}/downloads/Test-File-to-Download.xlsx")).to be(true)
	end

	it "should find the QTP, Selenium IDE and Selenium Webdriver checkbox options for automation tool and select them" do
		expect(@form.get_checkbox(id: 'tool-0').exists?).to eq(true)
		expect(@form.get_checkbox(id: 'tool-1').exists?).to eq(true)
		expect(@form.get_checkbox(id: 'tool-2').exists?).to eq(true)

		@form.get_checkbox(id: 'tool-0').set
		expect(@form.get_checkbox(id: 'tool-0').set?).to eq(true)

		@form.get_checkbox(id: 'tool-1').set
		expect(@form.get_checkbox(id: 'tool-1').set?).to eq(true)

		@form.get_checkbox(id: 'tool-2').set
		expect(@form.get_checkbox(id: 'tool-2').set?).to eq(true)
	end

	it "should find the Asia, Europe, Africa, Australia, North America, South America and Antarctica select options for continents" do
		expect(@form.get_select_list(id: 'continents').exists?).to eq(true)

		expect(@form.get_select_list(id: 'continents')).to include('Asia')
		expect(@form.get_select_list(id: 'continents')).to include('Europe')
		expect(@form.get_select_list(id: 'continents')).to include('Africa')
		expect(@form.get_select_list(id: 'continents')).to include('Australia')
		expect(@form.get_select_list(id: 'continents')).to include('North America')
		expect(@form.get_select_list(id: 'continents')).to include('South America')
		expect(@form.get_select_list(id: 'continents')).to include('Antartica')
	end

	it "should select the Asia, Europe, Africa, Australia, North America, South America and Antartica select options for continents" do
		@form.get_select_list(id: 'continents').select('Asia')
		expect(@form.get_select_list(id: 'continents').selected?('Asia')).to eq(true)

		@form.get_select_list(id: 'continents').select('Europe')
		expect(@form.get_select_list(id: 'continents').selected?('Europe')).to eq(true)

		@form.get_select_list(id: 'continents').select('Africa')
		expect(@form.get_select_list(id: 'continents').selected?('Africa')).to eq(true)

		@form.get_select_list(id: 'continents').select('Australia')
		expect(@form.get_select_list(id: 'continents').selected?('Australia')).to eq(true)

		@form.get_select_list(id: 'continents').select('North America')
		expect(@form.get_select_list(id: 'continents').selected?('North America')).to eq(true)

		@form.get_select_list(id: 'continents').select('South America')
		expect(@form.get_select_list(id: 'continents').selected?('South America')).to eq(true)

		@form.get_select_list(id: 'continents').select('Antartica')
		expect(@form.get_select_list(id: 'continents').selected?('Antartica')).to eq(true)
	end

	it "should find the browser, navigation, switch, wait and webElement commands select options for Selenium commands" do
		expect(@form.get_select_list(id: 'selenium_commands').exists?).to eq(true)

		expect(@form.get_select_list(id: 'selenium_commands')).to include('Browser Commands')
		expect(@form.get_select_list(id: 'selenium_commands')).to include('Navigation Commands')
		expect(@form.get_select_list(id: 'selenium_commands')).to include('Switch Commands')
		expect(@form.get_select_list(id: 'selenium_commands')).to include('Wait Commands')
		expect(@form.get_select_list(id: 'selenium_commands')).to include('WebElement Commands')
	end

	it "should select the browser, navigation, switch, wait and webElement commands select options for Selenium commands" do
		@form.get_select_list(id: 'selenium_commands').select('Browser Commands')
		expect(@form.get_select_list(id: 'selenium_commands').selected?('Browser Commands')).to eq(true)

		@form.get_select_list(id: 'selenium_commands').select('Navigation Commands')
		expect(@form.get_select_list(id: 'selenium_commands').selected?('Browser Commands')).to eq(true)

		@form.get_select_list(id: 'selenium_commands').select('Switch Commands')
		expect(@form.get_select_list(id: 'selenium_commands').selected?('Browser Commands')).to eq(true)

		@form.get_select_list(id: 'selenium_commands').select('Wait Commands')
		expect(@form.get_select_list(id: 'selenium_commands').selected?('Browser Commands')).to eq(true)

		@form.get_select_list(id: 'selenium_commands').select('WebElement Commands')
		expect(@form.get_select_list(id: 'selenium_commands').selected?('Browser Commands')).to eq(true)
	end

	it "should find the submit button and submit the data when clicked" do
		expect(@form.get_button(id: 'submit').exists?).to eq(true)

		@form.get_button(id: 'submit').click

		expect(@form.current_url).to include('?firstname=')
		expect(@form.current_url).to include('&lastname=')
		expect(@form.current_url).to include('&photo=')
		expect(@form.current_url).to include('&continents=')
		expect(@form.current_url).to include('&submit=')
	end

	it "should find the nexted text label and return the text inside" do
		expect(@form.get_label(id: 'NextedText').exists?).to eq(true)
		expect(@form.get_label(id: 'NextedText').text).to eq('Text1'"\n"'Text2')
	end

end