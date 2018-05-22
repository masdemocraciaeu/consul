require 'rails_helper'

feature 'Proposals' do

  background do
    Setting["org_name"] = 'MASDEMOCRACIAEUROPA'
  end

  describe "Index" do

    scenario "Dont display popular section on sidebar when org_name is MASDEMOCRACIAEUROPA" do
      proposal = create(:proposal)

      visit proposals_path

      expect(page).not_to have_content I18n.t("proposals.index.top_link_proposals")
      expect(page).not_to have_content I18n.t("proposals.index.top")
    end

    scenario "Dont display votes section on proposal partial when org_name is MASDEMOCRACIAEUROPA" do
      proposal = create(:proposal)

      visit proposals_path

      expect(page).not_to have_css "#proposal_#{proposal.id}_votes"
    end

    scenario "Dont display featured proposals partial when org_name is MASDEMOCRACIAEUROPA" do
      proposal = create(:proposal)

      visit proposals_path

      expect(page).not_to have_css "#featured-proposals"
    end

    scenario "Dont display highest_rated order when org_name is MASDEMOCRACIAEUROPA" do
      proposal = create(:proposal)

      visit proposals_path

      expect(page).not_to have_content "highest rated"
    end

  end

  describe "Show" do

    scenario "Dont display votes section on proposal partial when org_name is MASDEMOCRACIAEUROPA" do
      proposal = create(:proposal)

      visit proposal_path(proposal)

      expect(page).not_to have_css "#proposal_#{proposal.id}_votes"
      expect(page).not_to have_content I18n.t("votes.supports")
    end

  end
end