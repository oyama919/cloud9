require 'rails_helper'

describe Contact do
  # タイトルと内容があれば有効な状態であること
  it "is valid with contact" do
    contact = Contact.new(name: '宮岡', email: 'test@example.com', content: 'きょうはあついですね')
    expect(contact).to be_valid
  end

  #nameがなければ無効であること
  it "is invalid without a name" do
    contact = Contact.new(email: 'test@example.com', content: 'きょうもあついですね')
    expect(contact).not_to be_valid
  end

  #emailがなければ無効であること
  it "is invalid without a email" do
    contact = Contact.new(name: 'みやおこ', content: 'きょうはすずしいですね')
    expect(contact).not_to be_valid
  end

  #contentがなければ無効であること
  it "is invalid without a content" do
    contact = Contact.new(name: 'miyaoko', email: 'test@example.com')
    expect(contact).not_to be_valid
  end

  #3つともなければ無効であること
  it "is invalid without a 3contents" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

end
