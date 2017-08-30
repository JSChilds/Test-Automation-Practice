require 'watir'

class PracticeForm

	def initialize
		download_directory = "#{Dir.pwd}/downloads"
		download_directory.tr!('/', '\\') if Selenium::WebDriver::Platform.windows?

		profile = Selenium::WebDriver::Chrome::Profile.new
		profile['download.prompt_for_download'] = false
		profile['download.default_directory'] = download_directory

		@browser = Watir::Browser.new :chrome, profile: profile
	end

	def go_to_form
		@browser.goto('http://toolsqa.com/automation-practice-form/')
	end

	def current_url
		@browser.url
	end

	def get_div(target)
		div = @browser.div(target)
		div.exists?
		div
	end

	def get_link(target)
		link = @browser.link(target)
		link.exists?
		link
	end

	def get_text_field(target)
		text_field = @browser.text_field(target)
		text_field.exists?
		text_field
	end

	def get_radio_button(target)
		radio = @browser.radio(target)
		radio.exists?
		radio
	end

	def get_checkbox(target)
		checkbox = @browser.checkbox(target)
		checkbox.exists?
		checkbox
	end

	def get_select_list(target)
		select_list = @browser.select_list(target)
		select_list.exists?
		select_list
	end

	def get_button(target)
		button = @browser.button(target)
		button.exists?
		button
	end

	def get_label(target)
		label = @browser.label(target)
		label.exists?
		label
	end

	def get_file_field(target)
		file_field = @browser.file_field(target)
		file_field.exists?
		file_field
	end

	def get_table(target)
		table = @browser.table(target)
		table.exists?
		table
	end
end