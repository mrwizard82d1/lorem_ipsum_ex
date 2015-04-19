defmodule LoremIpsumTest do
  use ExUnit.Case

	@lorem_ipsum_start "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"

	setup do
		{:ok, [uri: "http://www.lipsum.com/feed/html/", 
					 lorem_start: @lorem_ipsum_start]}
	end

	test "construct from string", %{lorem_start: source} do
		sut = new_sut(source)
		actual_words = LoremIpsum.source sut
		assert String.split(source) == actual_words
	end

	test "construct from uri has correct start", 
	%{uri: uri_source, lorem_start: expected_start} do
		sut = new_sut(uri_source)
		actual_start = LoremIpsum.source(sut) |> Enum.take(5)
		# Lorem ipsum dolor sit amet,
		assert (String.split(expected_start) |>  Enum.take(5)) == actual_start
	end

	# test "construct from uri has correct host", %{uri: source} do
	# 	sut = new_sut source
	# 	assert (LoremIpsum.source sut).host == URI.parse(source).host
	# end

	def new_sut(source) do
		LoremIpsum.new source
	end

end
