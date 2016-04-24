require 'rails_helper'

RSpec.describe SearchController do
  context "present" do
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

      expect(controller.present(results)).to eq([
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
end
