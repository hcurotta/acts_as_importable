require "acts_as_importable/version"
require "active_support/concern"

module ActsAsImportable
 extend ActiveSupport::Concern

  module ClassMethods
    def acts_as_importable(*fields)

      class << self; attr_accessor :permissible_fields; end
      self.permissible_fields = fields.map(&:to_s) & self.attribute_names

      include ActsAsImportable::Core
    end
  end
end


module ActsAsImportable
  module Core
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def importable_fields(csv_file_path)
        csv_headers = CSV.read(csv_file_path)[0]
        {:csv => csv_headers, self.name.downcase.to_sym => self.permissible_fields}
      end

      def import_records(csv_file_path, column_mapping)
        csv = SmarterCSV.process(csv_file_path)
        csv.map! {|c| replace_keys(c, column_mapping)}
        csv.each do |record|
          Person.create!(record)
        end
      end

      private

      def replace_keys(hash, mapping)
        Hash[hash.map {|k, v| mapping[k.to_s].nil? ? nil :[mapping[k.to_s], v] }.compact]
      end
    end
  end
end
