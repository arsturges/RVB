class Rulemaking < ActiveRecord::Base
  validates_presence_of :rule, :rule_type_id, :doe_project_manager_id, :short_name #, :legislative_deadline
  validates_numericality_of :rule_type_id, :doe_project_manager_id
  validates_uniqueness_of :short_name

  #foreign keys in table "rulemakings":
  belongs_to :rule_type
  belongs_to :doe_project_manager

  #no foreign keys in table "rulemaking"
  has_many :milestones
  has_many :products
  has_and_belongs_to_many :contractors
  has_and_belongs_to_many  :drivers

  named_scope :ascend_by_rule_type, :order => "rule_types.rule_type"
  named_scope :descend_by_rule_type, :order => "rule_types.rule_type desc"

  named_scope :ascend_by_task, :order => "tasks.task"
  named_scope :descend_by_task, :order => "tasks.task desc"

  named_scope :ascend_by_doe_project_manager, :order => "doe_project_managers.project_manager"
  named_scope :descend_by_doe_project_manager, :order => "doe_project_managers.project_manager desc"

  #default_scope :order => "short_name"
  def find_milestone(phase, task, date_category, revision_number )
      unless @lookup_table
      @lookup_table = {}
        #milestones.by_revision(revision_number).each do |m|
        #why do we use a named_scope here instead of just putting  {:conditions=> {:revision_number => revision_number}}?
        #I refactored this as below. Seems to work okay.
        milestones.find(:all, {:conditions=> {:revision_number => revision_number}}).each do |m|
          @lookup_table["#{m.phase_id}|#{m.task_id}|#{m.date_category_id}"] = m
        end
      end
      @lookup_table["#{phase}|#{task}|#{date_category}"]
   end


  def selectmilestone(phase, task, date_category, revision_number)
    milestone = find_milestone(phase, task, date_category, revision_number)
    milestone ? milestone.milestone : nil
  end

  def phase
    get_rulemaking_milestones
    if Date.today > (@e15 || @h15 || @tmrw) and Date.today <= (@f20 || @e24 || @h24 || @ystrdy)
      "Framework"
    elsif
      Date.today > (@f20 || @e24 || @h24 || @tmrw) and Date.today <= (@f29 || @i29 || @e33 || @h33 || @ystrdy)
      "Preliminary Analysis"
    elsif
      Date.today > (@f29 || @i29 || @e33 || @h33 || @tmrw) and Date.today <= (@f39 || @i39 || @e43 || @h43 || @ystrdy)
      "NOPR"
    elsif
      Date.today >(@f39 || @i39 || @e43 || @h43 || @tmrw) and Date.today <= (@f49 || @i49 || @ystrdy)
      "Final Rule"
    elsif
      Date.today > (@f49 || @i49 || @tmrw)
      "Complete"
    else
      "--"
    end
  end

  def task
    get_rulemaking_milestones
    if (Date.today > (@e15 || @h15 || @tmrw)                  and Date.today <= (@e17 || @h17 || @ystrdy)) or         # AFTER start of Team Analysis and BEFORE start of BT Program Review
        (Date.today > (@f20 || @e24 || @h24 || @tmrw) and Date.today <= (@e26 || @h26 || @ystrdy)) or         #AFTER actual framekwork Fed Reg publication or start of PA Team Analysis and BEFORE start of PA BT Program Review
        (Date.today > (@f29 || @i29 || @e33 || @tmrw)  and Date.today <= (@e35 || @h35 || @ystrdy)) or         # AFTER any PA Fed Ref publication or start of NOPR Team Analysis and BEFORE start of NOPR BT Program Review
        (Date.today > (@f39 || @i39 || @e43 || @h43 || @tmrw) and Date.today <= (@e45 || @h45 || @ystrdy))  # AFTER any NOPR fed reg publication or start of any Final Rule Team Analysis and BEFORE any Final Rule BT Program Review
      "Team Analysis"
    elsif
      (Date.today > (@e17 || @h17 || @tmrw) and Date.today <= (@f17 || @i17 || @ystrdy)) or                     #in Framework BT review
      (Date.today > (@e26 || @h26 || @tmrw) and Date.today <= (@f26 || @i26 || @ystrdy)) or                     #in Prelim. Analysis BT review
      (Date.today > (@e35 || @h35 || @tmrw) and Date.today <= (@f35 || @i35 || @ystrdy)) or                     # in NOPR BT review
      (Date.today > (@e45 || @h45 || @tmrw) and Date.today <= (@f45 || @i45 || @ystrdy))                          # in Final Rule BT Review
      "BT Review"
    elsif
        (Date.today > (@e18 || @h18 || @tmrw) and Date.today <= (@f18 || @i18 || @ystrdy)) or
        (Date.today > (@e27 || @h27 || @tmrw) and Date.today <= (@f27 || @i27 || @ystrdy)) or
        (Date.today > (@e36 || @h36 || @tmrw) and Date.today <= (@f36 || @i36 || @ystrdy)) or
        (Date.today > (@e46 || @h46 || @tmrw) and Date.today <= (@f46 || @i46 ||@ystrdy))
      "Concurrence"
    elsif
        (Date.today > (@e19 || @h19 || @tmrw) and Date.today <= (@f19 || @i19 || @ystrdy)) or
        (Date.today > (@e28 || @h28 || @tmrw) and Date.today <= (@f28 || @i28 || @ystrdy)) or
        (Date.today > (@e38 || @h38 || @tmrw) and Date.today <= (@f38 || @i38 || @ystrdy)) or
        (Date.today > (@e48 || @h48 || @tmrw) and Date.today <= (@f48 || @i48 || @ystrdy))
      "EE Review and Issuance"
    elsif
        (Date.today > (@e20 || @h20 || @tmrw) and Date.today <= (@f20 || @i20 || @ystrdy)) or
        (Date.today > (@e29 || @h29 || @tmrw) and Date.today <= (@f29 || @i29 || @ystrdy)) or
        (Date.today > (@e39 || @h39 || @tmrw) and Date.today <= (@f39 || @i39 || @ystrdy)) or
        (Date.today > (@e49 || @h49 || @tmrw) and Date.today <= (@f49 || @i49 || @ystrdy))
      "Publication"
    else
      "--"
    end
  end

  def get_rulemaking_milestones(revision_number = Revision.maximum(:revision_number))
  if @trmw.nil?
      @tmrw = Date.today + 1
      @ystrdy = Date.today - 1
      @e15 = selectmilestone(1, 17, 3, revision_number)
      @e17 = selectmilestone(1, 1, 3, revision_number)
      @e18 = selectmilestone(1, 7, 3, revision_number)
      @e19 = selectmilestone(1, 3, 3, revision_number)
      @e20 = selectmilestone(1, 4, 3, revision_number)
      @e24 = selectmilestone(2, 17, 3, revision_number)
      @e26 = selectmilestone(2, 1, 3, revision_number)
      @e27 = selectmilestone(2, 7, 3, revision_number)
      @e28 = selectmilestone(2, 3, 3, revision_number)
      @e29 = selectmilestone(2, 4, 3, revision_number)
      @e33 = selectmilestone(3, 17, 3, revision_number)
      @e35 = selectmilestone(3, 1, 3, revision_number)
      @e36 = selectmilestone(3, 7, 3, revision_number)
      @e38 = selectmilestone(3, 2, 3, revision_number)
      @e39 = selectmilestone(3, 4, 3, revision_number)
      @e43 = selectmilestone(4, 17, 3, revision_number)
      @e45 = selectmilestone(4, 1, 3, revision_number)
      @e46 = selectmilestone(4, 7, 3, revision_number)
      @e48 = selectmilestone(4, 2, 3, revision_number)
      @e49 = selectmilestone(4, 4, 3, revision_number)
      @f17 = selectmilestone(1, 1, 4, revision_number)
      @f18 = selectmilestone(1, 7, 4, revision_number)
      @f19 = selectmilestone(1, 3, 4, revision_number)
      @f20 = selectmilestone(1, 4, 4, revision_number)
      @f26 = selectmilestone(2, 1, 4, revision_number)
      @f27 = selectmilestone(2,7, 4, revision_number)
      @f28 = selectmilestone(2, 3, 4, revision_number)
      @f29 = selectmilestone(2, 4, 4, revision_number)
      @f35 = selectmilestone(3, 1, 4, revision_number)
      @f36 = selectmilestone(3, 7, 4, revision_number)
      @f38 = selectmilestone(3, 2, 4, revision_number)
      @f39 = selectmilestone(3, 4, 4, revision_number)
      @f45 = selectmilestone(4, 1, 4, revision_number)
      @f46 = selectmilestone(4, 7, 4, revision_number)
      @f48 = selectmilestone(4, 2, 4, revision_number)
      @f49 = selectmilestone(4, 4, 4, revision_number)
      @h15 = selectmilestone(1, 17, 5, revision_number)
      @h17 = selectmilestone(1, 1, 5, revision_number)
      @h18 = selectmilestone(1, 7, 5, revision_number)
      @h19 = selectmilestone(1, 3, 5, revision_number)
      @h20 = selectmilestone(1, 4, 5, revision_number)
      @h24 = selectmilestone(2, 17, 5, revision_number)
      @h26 = selectmilestone(2, 1, 5, revision_number)
      @h27 = selectmilestone(2, 7, 5, revision_number)
      @h28 = selectmilestone(2, 3, 5, revision_number)
      @h29 = selectmilestone(2, 4, 5, revision_number)
      @h33 = selectmilestone(3, 17, 5, revision_number)
      @h35 = selectmilestone(3, 1, 5, revision_number)
      @h36 = selectmilestone(3, 7, 5, revision_number)
      @h38 = selectmilestone(3, 2, 5, revision_number)
      @h39 = selectmilestone(3, 4, 5, revision_number)
      @h43 = selectmilestone(4, 17, 5, revision_number)
      @h45 = selectmilestone(4, 1, 5, revision_number)
      @h46 = selectmilestone(4, 7, 5, revision_number)
      @h48 = selectmilestone(4, 2, 5, revision_number)
      @h49 = selectmilestone(4, 4, 5, revision_number)
      @i17 = selectmilestone(1, 1, 6, revision_number)
      @i18 = selectmilestone(1, 7, 6, revision_number)
      @i19 = selectmilestone(1, 3, 6, revision_number)
      @i20 = selectmilestone(1, 4, 6, revision_number)
      @i26 = selectmilestone(2, 1, 6, revision_number)
      @i27 = selectmilestone(2, 7, 6, revision_number)
      @i28 = selectmilestone(2, 3, 6, revision_number)
      @i29 = selectmilestone(2, 4, 6, revision_number)
      @i35 = selectmilestone(3, 1, 6, revision_number)
      @i36 = selectmilestone(3, 7, 6, revision_number)
      @i38 = selectmilestone(3, 2, 6, revision_number)
      @i39 = selectmilestone(3, 4, 6, revision_number)
      @i45 = selectmilestone(4, 1, 6, revision_number)
      @i46 = selectmilestone(4, 7, 6, revision_number)
      @i48 = selectmilestone(4, 2, 6, revision_number)
      @i49 = selectmilestone(4, 4, 6, revision_number)
    end
  end
end
