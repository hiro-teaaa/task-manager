require 'rails_helper'

RSpec.describe Label, type: :model do
  # 正常系
  it "is valid with label_name is not nil and shorter than 10" do
    label = Label.new(
      label_name: "テストラベル"
    )
    expect(label).to be_valid
  end

  it "is vaild with lenght of label_name is 10" do
      label = Label.new(
        label_name: "a" * 10
      )
      expect(label).to be_valid
  end
  # 異常系
  it "is not valid with label_name is nil" do
    label = Label.new(
      label_name: nil
    )
    label.valid?
    expect(label.errors[:label_name]).to include("can't be blank")
  end

  it "is vaild with lenght of label_name is longer than 10" do
    label = Label.new(label_name: "a" * 11)
    label.valid?
    expect(label.errors[:label_name]).to include("is too long (maximum is 10 characters)")
  end

end
