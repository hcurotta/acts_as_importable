ActiveRecord::Schema.define(:version => 1) do
  create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.integer :list_id
      t.string :phone_number
      t.string :vendor_id
      t.string :website

    t.timestamps
  end
end