gem "activerecord", "=4.2.7"

require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'farm.sqlite3')

class Field < ActiveRecord::Base

  field :field_type, as: :string
  field :field_size, as: :integer

end

Field.auto_upgrade!
