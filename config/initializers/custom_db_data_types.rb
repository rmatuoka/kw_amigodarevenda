class ActiveRecord::ConnectionAdapters::MysqlAdapter
 def native_database_types_with_custom
    returning native_database_types_without_custom do |h|
     h[:varbinary] = {:name => "varbinary"}
     h[:fixed_binary] = {:name => "binary"}
    end
 end
end
 
class ActiveRecord::ConnectionAdapters::MysqlColumn
 def simplified_type_with_custom(sql_type)
    return :varbinary  if sql_type =~ /varbinary/i
    return :fixed_binary  if sql_type =~ /binary/i
    return simplified_type_without_custom(sql_type)
 end
 
 def klass_with_custom
    return String if type == :varbinary
    return String if type == :fixed_binary
    return klass_without_custom
 end
end
 
class ActiveRecord::ConnectionAdapters::TableDefinition
 %w( varbinary fixed_binary ).each do |column_type|
    class_eval <<-EOV, __FILE__, __LINE__ + 1
     def #{column_type}(*args)                                               # def string(*args)
       options = args.extract_options!                                       #   options = args.extract_options!
       column_names = args                                                   #   column_names = args
                                                                             #
       column_names.each { |name| column(name, '#{column_type}', options) }  #   column_names.each { |name| column(name, 'string', options) }
     end                                                                     # end
    EOV
 end
end