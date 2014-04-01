#!/usr/bin/ruby

class Doc

	def initialize(input=nil)
		@config = read_config
	end

	def create(name)
		template = File.read('lib/charter/charter_template.md')
		charter = File.new("#{@config['session_folder']}/#{name[0]}.md", "w+")
		charter.write(template)
		charter.close
		
		@config['current_session'] = "#{@config['session_folder']}/#{name[0]}.md"
		
		replace_text('<start_time>', Time.now.strftime("%m/%d/%Y %H:%M") + "  \r\n")		
		replace_text('<tester>', @config['tester'])

		write_config
	end

	def bug(text)
		replace_text('<defects>', "1. #{text}  \r\n<defects>")
	end

	def scenario(text)
		replace_text('<scenarios>', "1. #{text}  \r\n<scenarios>")
	end

	def env(text)
		replace_text("<environment>", text)
	end

	def purpose(text)
		replace_text("<purpose>", text)
	end

	def finish
		replace_text('<end_time>', Time.now.strftime("%m/%d/%Y %H:%M"))
		
		aString = File.read(@config['current_session'])
		#remove remaining placeholders
		aString.gsub!(/\<(.*?)\>/, "")
		file = File.open(@config['current_session'], "w")
		file.puts aString
		file.close
	end

	def export(name)
		renderer = Redcarpet::Render::HTML.new(render_options = {})
		markdown = Redcarpet::Markdown.new(renderer, extensions = {})
		text = File.read(@config['current_session'])
		html_file = File.new("#{@config['session_folder']}/#{name}.html", "w+")
		html_text = markdown.render(text)
		html_file.write(html_text)
	end

	def replace_text(find,replace)
		aString = File.read(@config['current_session'])
		aString.gsub!(find, replace)
		file = File.open(@config['current_session'], "w")
		file.puts aString
		file.close
	end

private
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
