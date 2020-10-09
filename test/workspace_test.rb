require_relative 'test_helper'
describe "workspace tests" do

  describe "initialize workspace" do
    it "can create workspace " do
      VCR.use_cassette("create_workspace") do
        workspace = Workspace.new
        workspace.must_be_instance_of Workspace
      end
    end
  end

  describe "sends a valid message" do
    it "can send a message " do
      VCR.use_cassette("create_workspace") do
        workspace = Workspace.new
        workspace.select_user("Sandy Vasquez")
        final_result = workspace.send_message("Hello World!")
        expect(final_result).must_equal true
      end
    end

    it "fails to send message with invalid token " do
      VCR.use_cassette("create_workspace") do
        workspace = Workspace.new
        env_token = ENV['SLACK_TOKEN']
        ENV['SLACK_TOKEN'] = "Bad token value"
        workspace.select_user("Sandy Vasquez")
        expect{
          workspace.send_message("Hello World!")
        }.must_raise StandardError
        ENV['SLACK_TOKEN'] = env_token
      end
    end

    it "can't send a message without selecting first " do
      VCR.use_cassette("create_workspace") do
        workspace = Workspace.new
        final_result = workspace.send_message("Hello World!")
        expect(final_result).must_equal false
      end
    end
  end
end




