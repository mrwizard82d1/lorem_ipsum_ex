defmodule LoremIpsum do
	defstruct source: nil
	
	def new(source) do
		if String.starts_with?(source, "http://") do
			%LoremIpsum{source: URI.parse(source)}
		else
			%LoremIpsum{source: source}
		end
	end
	
	def source(lorem_ipsum) do
		lorem_ipsum.source
	end
end
