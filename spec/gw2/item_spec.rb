require "spec_helper"

describe GW2::Item do
  describe ".all" do
    before :each do
      @items = [12546, 12547, 12548, 12549]
    end

    it "exists" do
      expect(GW2::Item.respond_to?(:all)).to eq(true)
    end

    it "returns all items", :vcr do
      expect(GW2::Item.all).to include(*@items)
    end
  end

  describe ".details" do
    before :each do
      @item_details = {
        "item_id" => "12546",
        "name" => "Lemongrass",
        "description" => "Ingredient",
        "type" => "CraftingMaterial",
        "level" => "80",
        "rarity" => "Basic",
        "vendor_value" => "9",
        "icon_file_id" => "219490",
        "icon_file_signature" => "DF5612F93A11DB5F53FECA523F50D15DBF5A9AA5",
        "game_types" => ["Activity","Dungeon","Pve","Wvw"],
        "flags" => [],
        "restrictions" => []
      }
    end

    it "exists" do
      expect(GW2::Item.respond_to?(:details)).to eq(true)
    end

    it "returns the details of the item", :vcr do
      expect(GW2::Item.details(12546)).to eq(@item_details)
    end
  end
end
