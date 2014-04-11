#!/usr/bin/ruby

class Doc

	def initialize(input=nil)
		@config = read_config
	end

	def create_charter(name)
		template = File.read(File.dirname(__FILE__) + '/charter_template.md')
		charter = File.new("#{@config['session_folder']}/#{name}.md", "w+")
		charter.write(template)
		charter.close

		@config['session_name'] = name
		@config['current_session'] = "#{@config['session_folder']}/#{name}.md"
		@config['start_time'] = Time.now.strftime("%l:%M %P")
		@config['defects'] = "false"
		@config['notes'] = "false"
		@config['scenarios'] = "false"

		replace_text('<start_time>', @config['start_time'] + "  ")
		replace_text('<tester>', @config['tester'])

		write_config
	end

	def add_bug(text, screenshot)
		replace_text('<defects>', "1. #{text}  \r\n<defects>")
		@config['defects'] = "true"
		if screenshot
			%x(screencapture -s "#{@config['session_folder']}/#{text}".jpg)
			replace_text('<defects>', "    * ![Alt text](#{@config['session_folder']}/#{text}.jpg)  \r\n<defects>")
		end
		write_config
	end

	def add_scenario(text)
		replace_text('<scenarios>', "1. #{text}  \r\n<scenarios>")
		@config['scenarios'] = 'true'
		write_config
	end

	def set_env(text)
		replace_text('<environment>', "* #{text}  \r\n<environment>")
	end

	def set_purpose(text)
		replace_text('<purpose>', text)
	end

	def add_note(text)
		replace_text('<notes>', "1. #{text}  \r\n<notes>")
		@config['notes'] = 'true'
		write_config
	end

	def add_tag(text)
		replace_text('<tags>', "@#{text} <tags>")
	end

	def finish_charter
		set_default_text
		
		set_end_time
		
		remove_placeholders
	end

	def export_charter
		renderer = Redcarpet::Render::HTML.new(render_options = {})
		markdown = Redcarpet::Markdown.new(renderer, extensions = {})
		markdown_text = File.read(@config['current_session'])
		html_file = File.new("#{@config['session_folder']}/#{@config['session_name'].gsub(" ", "-")}.html", "w+")
		html_text = markdown.render(markdown_text)
		html_file.write(html_text)
	end

	def find_files_with_tags(tag)
		files = %x(grep -rnw -l --include=*.md #{@config['session_folder']} -e '@#{tag}').split("\n")
		files.each do |file|
			puts file.split('/')[-1]
		end
	end

private
	def replace_text(find,replace)
		file_text = File.read(@config['current_session'])
		file_text.gsub!(find, replace)
		file = File.open(@config['current_session'], "w")
		file.puts file_text
		file.close
	end

	def set_default_text
		@config['defects'] == 'false' ? replace_text('<defects>', 'No defects found during this session') : nil

		@config['notes'] == 'false' ? replace_text('<notes>', 'No notes for this session') : nil

		@config['scenarios'] == 'false' ? replace_text('<scenarios>', 'No scenarios for this session') : nil
	end

	def set_end_time
		@config['end_time'] = Time.now.strftime("%l:%M %P")

		replace_text('<end_time>', @config['end_time'] + "  ")

		elapsed_time = (Time.parse(@config['end_time']) - Time.parse(@config['start_time']))/60

		replace_text('<elapsed>',elapsed_time.to_i.to_s + ' minutes')
	end

	def remove_placeholders
		file_text = File.read(@config['current_session'])
		file_text.gsub!(/\<(.*?)\>/, "")
		file = File.open(@config['current_session'], "w")
		file.puts file_text
		file.close
	end

	def read_config
    	if File.exists? File.expand_path(SESSION_CONFIG)
      		return YAML.load_file(File.expand_path(SESSION_CONFIG))
    	else
      		return {}
    	end
    end

    def write_config
  		File.open(File.expand_path(SESSION_CONFIG), 'w') { |yf| YAML::dump(@config, yf) }
  	end
end
