require 'rails_helper'

RSpec.describe Order do
  it {should belong_to :customers}
end
