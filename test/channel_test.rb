require_relative 'test_helper'


#class methods are prefixed with a dot (".add"), and instance methods with a dash ("#add").
describe "Channel #initialize" do
  before do
    @test_channel = Channel.new('general','UG9588', 'talking',150)
  end

  it "given a new Channel instance, should return accurate Channel info" do
    expect(@test_channel).must_be_instance_of Channel
    expect(@test_channel.name).must_equal 'general'
    expect(@test_channel.slack_id).must_equal 'UG9588'
    expect(@test_channel.topic).must_equal 'talking'
    expect(@test_channel.member_count).must_equal 150

  end


  it "user instance variables, should be an instance of string, member count an integer" do
    expect(@test_channel.name).must_be_instance_of String
    expect(@test_channel.slack_id).must_be_instance_of String
    expect(@test_channel.topic).must_be_instance_of String
    expect(@test_channel.member_count).must_be_instance_of Integer
  end
end

describe 'Channel .self.list' do
  before do
    VCR.use_cassette("channels_list") do
      @test_channel_array = Channel.list
    end
  end

  it "should return array of channels" do
    expect(@test_channel_array).must_be_instance_of Array
  end

  it "each channel in array should be an instance of Channel" do
    @test_channel_array.each do |channel|
      expect(channel).must_be_instance_of Channel
    end
  end

end

describe 'Channel #details' do
  before do
    @new_channel = Channel.new('general','UG9588', 'talking',150)
  end

  it 'should return a hash' do
    expect(@new_channel.details).must_be_instance_of Hash
  end
end