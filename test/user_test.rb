require_relative 'test_helper'

#class methods are prefixed with a dot (".add"), and instance methods with a dash ("#add").
describe "#initialize" do
  before do
    @test_case = User.new('Ariel','UH1234', 'Ariel Jones')
  end

  context 'given a new User instance' do
    it "should return accurate user info" do
      expect(@test_case).must_be_instance_of User
      expect(@test_case.name).must_equal 'Ariel'
      expect(@test_case.slack_id).must_equal 'UH1234'
      expect(@test_case.real_name).must_equal 'Ariel Jones'
    end
  end
  context ' user instance variables' do
    it "should be an instance of string" do
      expect(@test_case.name).must_be_instance_of String
      expect(@test_case.slack_id).must_be_instance_of String
      expect(@test_case.real_name).must_be_instance_of String
    end
  end
end
#
# describe '.self.list' do
#   it "should return array users/members" do
#     VCR.use_cassette("???") do
#       @test_array = User.list
#     end
#
#     # how can i use the vcr to test if get method response is good?
#
#   end
#
#   it "should return array of new User Instances" do
#     before do
#       @test_array = User.list
#     end
#   end
# end
#
# describe '#details' do
#
# end