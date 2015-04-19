defmodule LoremIpsum do
	defstruct source: nil
	
	def new(source) do
		if String.starts_with?(source, "http://") do
			words_source = words_from_uri(source)
		else
			words_source = source
		end
		words = String.split(words_source)
		|> Enum.filter(fn(w) -> (not String.match?(w, ~r{</?p>})) end)
		%LoremIpsum{source: words}
	end

	defp words_from_uri(source) do
			HTTPoison.start
			{:ok, %HTTPoison.Response{status_code: 200, body: body}} = 
				HTTPoison.post(source, {:form, []})
			body
			# get the text beginning at the lipsum div
			|> String.split(~r{<div\s+id="lipsum">\s*})
			|> Enum.at(1)
			# and then remove everything after the closing div
			|> String.split(~r{</div>})
			|> Enum.at 0
	end
	
	def source(lorem_ipsum) do
		lorem_ipsum.source
	end
end
