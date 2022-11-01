# frozen_string_literal: true

RSpec.feature "A closure Tree" do
  let(:tech) { Company.create!(name: "Tech", reference_id: "tech") }

  scenario "A tree is read in" do
    When "data is read in as a tree" do
      saas = Company.create!(name: "Saas", reference_id: "saas")
      hardware = Company.create!(name: "Hardware", reference_id: "hardware")
      tech.children << saas << hardware
      meta = Company.create!(name: "Facebook", reference_id: "META")
      amzn = Company.create!(name: "Amazon", reference_id: "AMZN")
      appl = Company.create!(name: "Apple", reference_id: "APPL")
      nflx = Company.create!(name: "Netflix", reference_id: "NFLX")
      goog = Company.create!(name: "Google", reference_id: "GOOG")
      saas.children << meta << nflx << goog
      hardware.children << amzn << appl
    end

    Then "it is effectivley read in" do
      expect(tech.children.map(&:name)).to contain_exactly(
        "Saas",
        "Hardware",
      )
      expect(tech.descendants.map(&:name)).to contain_exactly(
        "Saas",
        "Hardware",
        "Facebook",
        "Amazon",
        "Apple",
        "Netflix",
        "Google",
      )
    end

    And "and can be viewed as a hash tree" do
      expect(map_object_method(tech.hash_tree, :name)).to eq([[
        "Tech",
        [
          ["Saas", [
            ["Facebook", []],
            ["Netflix", []],
            ["Google", []],
          ]],
          ["Hardware", [
            ["Amazon", []],
            ["Apple", []],
          ]],
        ],
      ]])
    end
  end
end

def map_object_method(obj, method)
  obj.map do |sub_obj|
    sub_obj.respond_to?(method) ?
      sub_obj.public_send(method) :
      map_object_method(sub_obj, method)
  end
end
