class Search < ActiveRecord::Base
  belongs_to :search, foreign_key: :searcher_id, class_name: "User"
end
