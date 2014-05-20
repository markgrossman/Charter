require 'yaml/store'

class ConfigStore
	def initialize(input = nil)
	    @store = YAML::Store.new("config.yml")
	end

	def write(key,value)
		@store.transaction do
  			@store[key] = value
		end
	end

	def read(key)
		@store.transaction { @store.fetch(key, {} )}
	end
end