defmodule LoremIpsum do
	defstruct source: nil
	
	def new(source) do
		if String.starts_with?(source, "http://") do
			HTTPoison.start
			{:ok, %HTTPoison.Response{status_code: 200, body: body}} = 
				HTTPoison.post("http://www.lipsum.com/feed/html", {:form, []})
			lorem_start = body
			|> String.split(~r{<div\s+id="lipsum">\s*})
			|> Enum.at 1
			words_source = lorem_start 
			|> String.split(~r{</div>})
			|> Enum.at 0
		else
			words_source = source
		end
		words = String.split(words_source)
		|> Enum.filter(fn(w) -> (not String.match?(w, ~r{</?p>})) end)
		%LoremIpsum{source: words}
	end
	
	def source(lorem_ipsum) do
		lorem_ipsum.source
	end
end
