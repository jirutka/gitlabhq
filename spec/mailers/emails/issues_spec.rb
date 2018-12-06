# frozen_string_literal: true

require 'spec_helper'
require 'email_spec'

describe Emails::Issues do
  include EmailSpec::Matchers

  describe "#import_issues_csv_email" do
    let(:user) { create(:user) }
    let(:project) { create(:project) }

    subject { Notify.import_issues_csv_email(user.id, project.id, @results) }

    it "shows number of successful issues imported" do
      @results = { success: 165, errors: [], valid_file: true }

      expect(subject).to have_body_text "165 issues imported"
    end

    it "shows error when file is invalid" do
      @results = { success: 0, errors: [], valid_file: false }

      expect(subject).to have_body_text "Error parsing CSV"
    end

    it "shows line numbers with errors" do
      @results = { success: 0, errors: [23, 34, 58], valid_file: false }

      expect(subject).to have_body_text "23, 34, 58"
    end
  end
end
