ActiveRecord::Schema.define(:version => 1) do
  create_table :people do |t|
    t.string    :first_name
    t.string    :last_name

    t.timestamps
  end
end