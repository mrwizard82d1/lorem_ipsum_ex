defmodule LoremIpsumTest do
  use ExUnit.Case

	test "construct from string" do
		source = "Lorem ipsum dolor sit"
		sut = LoremIpsum.new source
		assert (LoremIpsum.source sut) == source
	end

	test "construct from uri has correct scheme" do
		source = "http://www.loremipsum.com"
		sut = LoremIpsum.new source
		assert (LoremIpsum.source sut).scheme == URI.parse(source).scheme
	end

	test "construct from uri has correct host" do
		source = "http://www.loremipsum.com"
		sut = LoremIpsum.new source
		assert (LoremIpsum.source sut).host == URI.parse(source).host
	end

end
