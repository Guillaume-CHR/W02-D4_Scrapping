require_relative '../lib/02_member_info'

describe "the function get_townhall_urls" do
  it "the type returned is an array" do
    expect(get_member_info.class).to eq(Array)
  end
  it "the returns something" do
    expect(get_member_info).not_to be_nil
  end
end