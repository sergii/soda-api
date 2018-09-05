require 'rails_helper'

RSpec.describe Word, type: :model do
  it { should validate_presence_of(:word) }
  it { should validate_presence_of(:appearance) }
end
