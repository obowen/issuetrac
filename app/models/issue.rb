class Issue < ActiveRecord::Base
  attr_accessible :assigned_to, :details, :reported_by, :status, :title
end
