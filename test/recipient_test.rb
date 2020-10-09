require_relative 'test_helper'

describe 'Recipient' do
  describe '#initialize' do
    before do
      @name_test = 'Poco'
      @slack_id_test = 'U576'
      @new_recipient = Recipient.new(@name_test, @slack_id_test)
    end

    it 'can create a new instance of Recipient' do
      expect(@new_recipient).must_be_instance_of Recipient
    end

    it 'can access attributes' do
      expect(@new_recipient.name).must_equal @name_test
      expect(@new_recipient.slack_id).must_equal @slack_id_test
    end
  end
end