require 'rails_helper'

describe 'Users' do

  let(:yvette) { User.create(name: 'ynzc') }


  it 'have a name' do
    expect(yvette.name).to eq('ynzc')
  end

  xit 'can confirm that the username exists' do
    expect(yvette.confirm_account).to eq(true)
  end

  xit 'can get information on an account' do
    expect(yvette.get_account).to eq({})
  end

end
