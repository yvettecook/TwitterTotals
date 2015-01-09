require 'rails_helper'

describe 'Users' do

  let(:yvette) { User.create(name: 'ynzc') }


  it 'have a name' do
    expect(yvette.name).to eq('ynzc')
  end

end
