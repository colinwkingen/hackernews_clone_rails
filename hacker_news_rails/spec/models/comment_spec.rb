require 'rails-helper'

describe Comment do
  it { should validate_presence_of :text }
  it { should validate_presence_of :user }
  it { should belong_to :post }
end
