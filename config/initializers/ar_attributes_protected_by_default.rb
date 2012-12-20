module ActiveRecord
 class Base
    private
    def attributes_protected_by_default
     default = [self.class.inheritance_column]
     default << 'id' if self.class.primary_key.eql? 'id'
     default
    end
 end
end