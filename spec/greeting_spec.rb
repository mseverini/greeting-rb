require 'rspec'
require_relative '../lib/greeting'

RSpec.describe Greeting do
  describe "#greet" do
    subject { Greeting.greet name }
    describe "when nil" do
      let(:name) { nil }

      it { is_expected.to eq "Hello, my friend." }
    end

    context "when a single name is said" do
      let(:name) {"Bob"}
      it {is_expected.to eq "Hello, Bob."}
    end

    context "when a single name is shouted" do
      let(:name) {"JERRY"}
      it {is_expected.to eq "HELLO JERRY!"}
    end

    context "when there are two said names" do
      let(:name) {["Jill", "Jane"]}
      it {is_expected.to eq "Hello, Jill and Jane."}
    end

    context "when there are multiple said names" do
      let(:name) {["Amy", "Brian", "Charlotte"]}
      it {is_expected.to eq "Hello, Amy, Brian, and Charlotte."}
    end

    context "when there are spoken and shouted names" do
      let(:name) {["Amy", "BRIAN", "Charlotte"]}
      it {is_expected.to eq "Hello, Amy and Charlotte. AND HELLO BRIAN!"}
    end

    context "when names are combined" do
      let(:name) {["Bob", "Charlie, Dianne"]}
      it {is_expected.to eq "Hello, Bob, Charlie, and Dianne."}
    end

    context "when names are combined" do
      let(:name) {["Bob", "\"Charlie, Dianne\""]}
      it {is_expected.to eq "Hello, Bob and Charlie, Dianne."}
    end
  end
end
