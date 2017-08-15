defmodule CvAmp do
  require Poison
  alias Amp.{Template}
  @moduledoc """
  Documentation for CvAmp.
  """

  def main(file) do
    data = read_JSON(file)

    Template.opening_tags
      |> Template.head(data)
      |> Template.closing_head_opening_body_tags
      |> Template.body(data)
      |> Template.closing_tags
      |> write_file
  end

  def write_file(amp_html) do
    File.write!("./index.html", amp_html)
  end

  def read_JSON(file) do

    File.read!(file)
    |> Poison.Parser.parse!
  end
end
