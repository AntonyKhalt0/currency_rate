# frozen_string_literal: true

shared_examples_for "API success response" do
  it "returns 200 status" do
    expect(response).to be_successful
  end
end

shared_examples_for "API fields" do
  it "return all fields" do
    expect(resource_response[attr]).to eq resource.send(attr).as_json
  end
end
