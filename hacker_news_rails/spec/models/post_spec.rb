require 'rails_helper'

describe Post do
  it { should validate_presence_of :url }
  it { should validate_presence_of :title }
  it { should have_many :comments }
end
