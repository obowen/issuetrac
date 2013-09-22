class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :url

  def url
    issue_url(object)
  end
end
