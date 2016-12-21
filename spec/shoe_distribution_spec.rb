require 'spec_helper'

describe("brand") do
  describe("#save") do
    it("capitalizes every word in a brand name") do
      test_brand = Brand.create({:name => "reebawk", :logo => nil})
      expect(test_brand.name()).to(eq("Reebawk"))
    end
  end
end
