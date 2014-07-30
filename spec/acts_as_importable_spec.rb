require 'spec_helper'


describe ActsAsImportable do

  let(:csv_file_path) { "#{File.dirname(__FILE__)}/fixtures/test_import.csv" }

  it 'returns a hash of csv headers and importable fields' do
    expect(Person.importable_fields(csv_file_path)).to eq({csv: ["first_name", "last", "company name"], person: ["first_name", "last_name"]})
  end

  context 'when provided with a csv and column mappings hash' do 
    it 'imports a csv with the correct mappings' do 
      mapping = {"first_name" => "first_name", "last_name" => "last"}
      expect{Person.import_records(csv_file_path, mapping)}.to change{Person.count}.from(0).to(6)
    end
  end
end
