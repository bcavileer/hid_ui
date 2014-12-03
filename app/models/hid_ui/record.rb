module HidUi
  class Record < ActiveRecord::Base
    attr_accessible :input, :id_type

    class Recorder
      @record_class = Record
      class << self
        attr_accessor :record_class

        def record(input, type)
          unless record_class.where(input: input, id_type: type).exists?
            record_class.create input: input, id_type: type
          end
          nil
        end

        def remove(input, type)
          record_class.where(input: input, id_type: type).destroy_all
        end

        def recorded(type)
          return typed_records(type) if type
          untyped_records
        end

        private

        def typed_records(type)
          record_class.where(id_type: type).pluck(:input)
        end

        def untyped_records
          record_groups = record_class.all.group_by(&:id_type)
          hash = Hash.new

          record_groups.each do |type, records|
            hash[type] = records.map(&:input) if records
          end

          hash
        end
      end
    end
  end
end
