  Factory.sequence :name do |n|
    "John Doe #{n}"
  end

  Factory.sequence :string do |n|
    "random string  #{n}"
  end

  Factory.sequence :integer do |n|
    "#{n}"
  end

Factory.define :activity do |a|
    a.activity { Factory.next(:string)}
    a.sort { Factory.next(:integer)}
  end

Factory.define :date_category do |d|
  d.date_category { Factory.next(:string) }
end

Factory.define :doe_project_manager do |d|
  d.project_manager { Factory.next(:name) }

end

Factory.define :driver do |d|
  d.driver { Factory.next(:string)}
end

Factory.define :phase do |p|
  p.phase {Factory.next(:string)}
  p.sort { Factory.next(:integer)}
end

  Factory.define :product do |p|
    p.product { Factory.next(:string)}
    p.association :rulemaking
    p.association :sector
  end

Factory.define :milestone do |m|
  m.association :rulemaking
  m.association :phase
  m.association :activity
  m.association :date_category
  m.milestone Date.today
  m.association :revision_number, :factory => :revision
end

  Factory.define :revision do |r|
    r.revision_number { Factory.next(:integer)}
    r.revision_date Date.today
  end

Factory.define :rule_type do |rt|
  rt.rule_type { Factory.next(:string)}
  rt.rule_type_abbreviation { Factory.next(:string) }
end

Factory.define :rulemaking do |r|
  r.rule {Factory.next(:string)}
  r.association :rule_type
  r.association :doe_project_manager
  r.legislative_deadline Date.today
  r.association :phase
  r.association :activity
  r.short_name {Factory.next(:string)}
end

Factory.define :sector do |s|
  s.sector { Factory.next(:string)}
end