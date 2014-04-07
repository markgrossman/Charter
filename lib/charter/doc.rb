#!/usr/bin/ruby

class Doc

	def initialize(input=nil)
		@config = read_config
	end

	def create_charter(name)
		template = File.read(File.dirname(__FILE__) + '/charter_template.md')
		charter = File.new("#{@config['session_folder']}/#{name[0]}.md", "w+")
		charter.write(template)
		charter.close

		@config['current_session'] = "#{@config['session_folder']}/#{name[0]}.md"
		@config['start_time'] = Time.now.strftime("%l:%M %P")

		replace_text('<start_time>', @config['start_time'] + "  \r\n")
		replace_text('<tester>', @config['tester'])

		write_config
	end

	def add_bug(text, screenshot)
		replace_text('<defects>', "1. #{text}  \r\n<defects>")
		if screenshot
			%x(screencapture -s "#{@config['session_folder']}/#{text}".jpg)
			replace_text('<defects>', "    - Screenshot Attached  \r\n<defects>")
		end
	end

	def add_scenario(text)
		replace_text('<scenarios>', "1. #{text}  \r\n<scenarios>")
	end

	def set_env(text)
		replace_text('<environment>', "1. #{text}  \r\n<environment>")
	end

	def set_purpose(text)
		replace_text('<purpose>', text)
	end

	def finish_charter
		@config['end_time'] = Time.now.strftime("%l:%M %P")
		replace_text('<end_time>', @config['end_time'])

		elapsed_time = (Time.parse(@config['end_time']) - Time.parse(@config['start_time']))/60

		replace_text('<elapsed>',elapsed_time.to_i.to_s + ' minutes')

		aString = File.read(@config['current_session'])

		#remove remaining placeholders
		aString.gsub!(/\<(.*?)\>/, "")

		file = File.open(@config['current_session'], "w")
		file.puts aString
		file.close
	end

	def export_charter(name)
		renderer = Redcarpet::Render::HTML.new(render_options = {})
		markdown = Redcarpet::Markdown.new(renderer, extensions = {})
		text = File.read(@config['current_session'])
		html_file = File.new("#{@config['session_folder']}/#{name}.html", "w+")
		html_text = markdown.render(text)
		html_file.write(html_text)
	end

private
	def replace_text(find,replace)
		aString = File.read(@config['current_session'])
		aString.gsub!(find, replace)
		file = File.open(@config['current_session'], "w")
		file.puts aString
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
