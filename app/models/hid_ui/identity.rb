module HidUi
  class Identity < ActiveRecord::Base
    attr_accessible :input, :identity, :id_type

    class Identifier
      @identity_class = Identity
      @recorder_class = Record::Recorder
      class << self
        attr_accessor :identity_class, :recorder_class

        def find(input, type)
          identity = identity_class.where(input: input, id_type: type).first
          identity && identity.identity
        end

        def map(input, identity, type)
          unless identity_class.where(input: input, identity: identity, id_type: type).exists?
            identity_class.create input: input, identity: identity, id_type: type
          end
          recorder_class.remove(input, type)
          nil
        end
      end
    end
  end
end
