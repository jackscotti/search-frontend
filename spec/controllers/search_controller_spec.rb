require 'rails_helper'

RSpec.describe SearchController do
  context "#present_for_index" do
    let(:result_1) {{
        "title" => "title 1",
        "description" => "description 1",
        "link" => "gov/something-1",
    }}
    let(:result_2) {{
        "title" => "title 2",
        "description" => "description 2",
        "link" => "gov/something-2",
    }}
    let(:results) {{
      "results" =>[
        result_1,
        result_2,
      ]
    }}

    it "selects title and paths" do
      controller = SearchController.new

      expect(controller.present_for_index(results)).to eq([
        {
          "title" => result_1["title"],
          "link" => result_1["link"],
        },
        {
          "title" => result_2["title"],
          "link" => result_2["link"],
        }
      ])
    end
  end

  context "#present_for_show" do
    let(:result) {{
        "title" => "title 1",
        "description" => "description 1",
        "link" => "gov/something-1",
    }}

    it "selects title and description" do
      controller = SearchController.new

      expect(controller.present_for_show(result)).to eq(
        {
          "title" => result["title"],
          "description" => result["description"],
        },
      )
    end
  end
end
