# frozen_string_literal: true

RSpec.feature "A closure Tree" do
  scenario "A tree is read in" do
    When "data is read in as a tree" do
      Company.create!(name: "Facebook", reference_id: "META")
      Company.create!(name: "Amazon", reference_id: "AMZN")
      Company.create!(name: "Apple", reference_id: "APPL")
      Company.create!(name: "Netflix", reference_id: "NFLX")
      Company.create!(name: "Google", reference_id: "GOOG")
    end

    Then "it is effectivley read in" do
      expect(Company.all.pluck(:name)).to contain_exactly(
        "Facebook",
        "Amazon",
        "Apple",
        "Netflix",
        "Google",
      )
    end
  end
end
