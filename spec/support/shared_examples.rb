shared_examples "JSON API Rewards method" do
  it "sends correct request" do
    do_request
    expect(stubed_request).to have_been_requested
  end
end
