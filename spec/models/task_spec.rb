require 'rails_helper'

RSpec.describe Task, type: :model do
  it "cannot be empty" do
    todo_list = Task.new
    expect (todo_list).not_to be_valid
  end

  it "name not longer than 255 symbols" do
    todo_list = Task.new(name: 'a' * 254)
    expect (todo_list).to be_valid
  end

  it 'task validates presence' do
    record = Task.new
    record.name = ''
    record.valid?
    expect(record.errors[:name]).to include("can't be blank")

    record.name = 'test'
    expect(record.errors[:name]).to_not include("can't be blank")
  end
end
