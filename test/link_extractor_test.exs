defmodule LinkExtractorTest do
  use ExUnit.Case
  alias LinkExtractor.Link

  @message """
  Augie,

  Ctrl-p: https://github.com/kien/ctrlp.vim

  That is probably my absolute favorite vim plugin
  """

  @expected_link %Link{
    url: "https://github.com/kien/ctrlp.vim",
    title: "kien/ctrlp.vim · GitHub",
  }

  test "when text is injected into the system, those links are stored,.....", context do
    LinkExtractor.inject @message
    :timer.sleep 1000
    assert LinkExtractor.get_links == [@expected_link]
  end
end
