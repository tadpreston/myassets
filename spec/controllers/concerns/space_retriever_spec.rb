require 'rails_helper'

RSpec.describe SpaceRetriever, type: :concern do

  let(:space) { create(:space) }
  let(:group_titles) { %w(groupOne groupTwo groupThree) }
  subject { SpaceRetriever.new(space.id) }

  before do
    group_titles.each { |title| create(:group, space: space, title: title) }
  end

  describe "#space_name" do
    it "returns the space name" do
      expect(subject.name).to eq(space.name)
    end
  end
  describe "#space_description" do
    it "returns the space description" do
      expect(subject.description).to eq(space.description)
    end
  end
  describe "#group_titles" do
    subject { SpaceRetriever.new(space.id).group_titles }
    it { is_expected.to be_an Array }
    it { is_expected.to match_array(group_titles) }
  end

  describe "#group_descriptions" do
    subject { SpaceRetriever.new(space.id).group_descriptions }
    it { is_expected.to be_an Array }
    it "has the correct number of elements" do
      expect(subject.count).to eq(group_titles.count)
    end
  end
end
