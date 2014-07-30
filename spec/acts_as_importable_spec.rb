require 'spec_helper'


describe ActsAsImportable do

  let(:csv_file_path) { "#{File.dirname(__FILE__)}/fixtures/test_import_1.csv" }

  it 'returns a hash of csv headers and importable fields' do
    expect(Person.importable_fields(csv_file_path)).to eq({csv: ["First Name","Last","email","company","job title","phone number"], person: ["first_name", "last_name", "email", "company_name", "phone_number", "website"]})
  end

  context 'when provided with a csv and column mappings hash' do 
    it 'imports a csv with the correct mappings' do 

      mapping =  {
        "first_name" => "First Name",
         "last_name" => "Last",
             "email" => "email",
      "company_name" => "company",
      "phone_number" => "phone number",
           "website" => ""
      }
      expect{Person.import_records(csv_file_path, mapping)}.to change{Person.count}.from(0).to(18)
      binding.pry
    end
  end
end
