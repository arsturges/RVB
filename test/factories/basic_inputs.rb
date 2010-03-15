Factory.define :activity do |a|
    a.activity 'First activity'
    a.sort '235'
  end

Factory.define :date_category do |d|
  d.date_category 'Planned Start'
end

Factory.define :doe_project_manager do |d|
  d.project_manager 'John Doe'
end

Factory.define :driver do |d|
  d.driver 'EISA 2007'
end

Factory.define :phase do |p|
  p.phase 'NOPR'
  p.sort '246'
end

Factory.define :rule_type do |r|
  r.rule_type 'Standard'
  r.rule_type_abbreviation 'std'
end