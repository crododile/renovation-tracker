require "spec_helper"

describe "Inspection" do
  before :all do
    @inspection = Inspection.new(
      {id: 196, property: "Racquet Club",
         unit_number: "110", inspector: "John Berry",
          inspection_date: "2014-07-18",
           attachments: nil, comments: "",
            components: true, new_countertop: nil,
             flooring: nil, appliances: nil, paint: nil})
             
    @managerInspection1 = ManagerInspection.new({
      id: 50, property: "Racquet Club",
       unit_number: "110", components: true,
        new_countertop: nil, flooring: nil,
         appliances: nil, paint: nil})
            
     @managerInspection2 = ManagerInspection.new({
       id: 50, property: "Racquet Club",
        unit_number: "110", components: true,
         new_countertop: true, flooring: nil,
          appliances: nil, paint: nil})
  end
  
  it "matching manager inspection is eql" do
    expect(@inspection.eql_manager_inspection(@managerInspection1)).to be_true
  end
  
  it "disagreeing manager inspection is unequal" do
    expect(@inspection.eql_manager_inspection(@managerInspection2)).to be_false
  end
  
end