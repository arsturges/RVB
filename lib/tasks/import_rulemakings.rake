# this won't include rulemaking rows that are missing either a datetime or any of the foreigh keys.

namespace :db do
  task :load_rulemaking_data => :environment do
    require "rubygems"
    require "fastercsv"

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\rulemakings_modified.csv') do |row|
    Rulemaking.create(:id=> row[0], :rule => row[1], :rule_type_id =>
      row[2], :notes => row[3], :doe_project_manager_id => row[4], :legislative_deadline => row[5],
      :phase_id => row[6], :activity_id => row[7], :short_name => row[8])
    end

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\activities.csv') do |row|
    Activity.create(:id => row[0], :activity => row[1], :activity_abbreviation =>
      row[2], :sort => row[3])
    end

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\doe_project_managers.csv') do |row|
    DoeProjectManager.create(:project_manager => row[1])
    end

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\drivers.csv') do |row|
    Driver.create(:driver => row[1])
    end

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\phases.csv') do |row|
    Phase.create(:phase => row[1], :sort => row[2])
    end

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\rule_types.csv') do |row|
    RuleType.create(:rule_type => row[1], :rule_type_abbreviation =>
      row[2])
    end

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\date_categories.csv') do |row|
    DateCategory.create(:date_category => row[1])
    end

    FasterCSV.foreach('X:\j_drive\Andy\rvb\public\milestones.csv') do |row|
    Milestone.create(:rulemaking_id => row[1], :phase_id =>
      row[2], :activity_id => row[3], :date_category_id => row[4], :milestone => row[5])
    end

  end
end