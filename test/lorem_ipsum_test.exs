defmodule LoremIpsumTest do
  use ExUnit.Case

	test "construct from string" do
		source = "Lorem ipsum dolor sit"
		sut = LoremIpsum.new source
		assert (LoremIpsum.source sut) == source
	end

end
