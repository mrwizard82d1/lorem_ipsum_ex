defmodule LoremIpsumTest do
  use ExUnit.Case

	setup do
		{:ok, [uri: "http://www.loremipsum.com", 
					 lorem_start: "Lorem ipsum dolor sit amet"]}
	end

	test "construct from string", %{lorem_start: source} do
		sut = new_sut(source)
		actual_words = LoremIpsum.source sut
		assert String.split(source) == actual_words
	end

	test "construct from uri has correct start", 
	%{uri: source, lorem_start: expected_start} do
		sut = new_sut(source)
		actual_start = LoremIpsum.source(sut) |> Enum.take(5)
		assert String.split(expected_start) == actual_start
	end

	# test "construct from uri has correct host", %{uri: source} do
	# 	sut = new_sut source
	# 	assert (LoremIpsum.source sut).host == URI.parse(source).host
	# end

	def new_sut(source) do
		LoremIpsum.new source
	end

end
