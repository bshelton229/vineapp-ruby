require 'spec_helper'

describe VineApp do
  before :each do
    stub_request(:get, VineApp::Client::DEFAULT_ENDPOINT+'bgD2rJXvOi1').to_return({:body => File.open(File.expand_path('../files/vine.html', __FILE__)).read })
  end

  it 'should have a version number' do
    VineApp::VERSION.should_not be_nil
  end

  it 'Should take an id string, or a full url' do
    vine1 = VineApp.get('bgD2rJXvOi1')
    vine2 = VineApp.get('https://vine.co/v/bgD2rJXvOi1')
    a_request(:get, 'https://vine.co/v/bgD2rJXvOi1').should have_been_made.times(2)
    expect( vine1.video ).to eq( vine2.video )
  end

  it 'Should return a Vine::Resource' do
    v = VineApp.get('bgD2rJXvOi1')
    expect(v).to be_a(VineApp::Resource)
  end
end
