defmodule LoremIpsumTest do
  use ExUnit.Case

	setup do
		{:ok, [uri_source: "http://www.loremipsum.com"]}
	end

	test "construct from string" do
		source = "Lorem ipsum dolor sit"
		sut = LoremIpsum.new source
		assert (LoremIpsum.source sut) == source
	end

	test "construct from uri has correct scheme", %{uri_source: source} do
		sut = LoremIpsum.new source
		assert (LoremIpsum.source sut).scheme == URI.parse(source).scheme
	end

	test "construct from uri has correct host", %{uri_source: source} do
		sut = LoremIpsum.new source
		assert (LoremIpsum.source sut).host == URI.parse(source).host
	end

end
