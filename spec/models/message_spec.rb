require 'rails_helper'

# RSpec.describe Message, type: :model do
#   describe "#create" do
#     before do
#       @message = FactoryBot.build(:message)
#       @message.image = fixture_file_upload("public/images/test_image.png")
#     end

#     it "contentもimageも存在していれば保存できる" do
#       expect(@message).to be_valid
#     end

#     it "contentがなくてもimageが存在していれば保存できる" do
#       @message.content = ""
#       expect(@message).to be_valid
#     end

#     it "imageがなくてもcontentがあれば保存できる" do
#       @message.image = ""
#       expect(@message).to be_valid
#     end

#     it "contentもimageも空だと保存できない" do
#       @message.content = ""
#       @message.image = ""
#       @message.valid?
#       expect(@message.errors.full_messages).to include("") 
#     end
#   end
# end
RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
      @message.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
    end

    it 'contentが存在していれば保存できること' do
      @message.image = nil
      expect(@message).to be_valid
    end

    it 'imageが存在していれば保存できること' do
      @message.content = nil
      expect(@message).to be_valid
    end

    it 'contentとimageが空では保存できないこと' do
      @message.content = nil
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end
  end
end