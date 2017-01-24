class Status < ApplicationRecord
  default_scope { order('sortorder') }

end
