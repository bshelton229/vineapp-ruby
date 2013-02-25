require 'spec_helper'

describe VineApp::Resource do
  before :each do
    stub_request(:get, VineApp::Client::DEFAULT_ENDPOINT+'bgD2rJXvOi1').to_return({:body => File.open(File.expand_path('../files/vine.html', __FILE__)).read })
  end

  it 'Should wrap video' do
    vine = VineApp.get('bgD2rJXvOi1')
    expect(vine.video).to eq("https://vines.s3.amazonaws.com/videos/A78A7230-46CD-4B0F-91F2-69DF5A68DFB3-182-000000401CC86A78_1.0.5.mp4?versionId=CwZ4WmiQ21NPUHha8LCT3bZeQ7Yh2gEx")
  end

  it 'Sould build attrs from a hash' do
    data = VineApp.client.get('bgD2rJXvOi1')
    data["title"] = 'NEW TITLE'
    vine = VineApp::Resource.new(data)
    data.each do |k,v|
      expect(vine.send(k.to_sym)).to eq(v)
    end
  end
end
