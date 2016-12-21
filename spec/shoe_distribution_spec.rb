require 'spec_helper'

describe("Brand") do
  describe("#save") do
    it("capitalizes every word in a brand name") do
      test_brand = Brand.create({:name => "reebawk", :logo => nil})
      expect(test_brand.name()).to(eq("Reebawk"))
    end
  end
end

describe("Store") do
  describe("#save") do
    it("capitalizes every word in a store name") do
      test_store = Store.create({:name => "the gip", :address => nil})
      expect(test_store.name()).to(eq("The Gip"))
    end
  end
end
