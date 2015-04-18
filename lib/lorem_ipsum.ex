defmodule LoremIpsum do
	defstruct source: nil
	
	def new(source) do
		%LoremIpsum{source: source}
	end
	
	def source(lorem_ipsum) do
		lorem_ipsum.source
	end
end
