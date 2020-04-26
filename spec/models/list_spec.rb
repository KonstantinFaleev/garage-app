require 'rails_helper'

RSpec.describe List, type: :model do
  it "cannot be empty" do
    todo_list = List.new
    expect (todo_list).not_to be_valid
  end

  it "title not longer than 255 symbols" do
    todo_list = List.new(title: 'a' * 254)
    expect (todo_list).to be_valid
  end

  it 'list validates presence' do
    record = List.new
    record.title = ''
    record.valid?
    expect(record.errors[:title]).to include("can't be blank")

    record.title = 'test'
    expect(record.errors[:title]).to_not include("can't be blank")
  end
end
