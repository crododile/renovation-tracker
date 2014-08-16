require 'csv'
require 'active_record'

#creates dtable and seeds it from a csv
#use:
# save seed data in lib/assets
#rake csv_to_pg filename=#{filename} modelname=#{name #of your rails model to associate with this table}

task :csv_to_pg => :environment do
  @db_info = ActiveRecord::Base.configurations[Rails.env]
    
  def create_model_from_csv filename, model_name
    c = CSV.open(filename)
    columns = c.readline
    command = "rails generate model " << model_name.to_s.capitalize
  
    columns.each do |header|
      command << " " << header.to_s.downcase << ":string"
    end
    p "generating migration"
    system command
  end

  def copy_table_from_csv filename, modelname 
    columns = CSV.open(filename).readline
    
    cols = "("
    columns.each do |col|
      cols << "#{col.downcase},"
    end
    cols.chop!
    cols << ")"

    conn = ActiveRecord::Base.connection

    rc = conn.raw_connection

    rc.exec("COPY #{modelname.pluralize} #{cols} FROM STDIN WITH CSV")

    file = File.open(filename, 'r')
    file.readline
    while !file.eof?
      # Add row to copy data
      rc.put_copy_data(file.readline)
    end
    rc.put_copy_end 
 
    # Display any error messages
    while res = rc.get_result
      if e_message = res.error_message
        p e_message
      end
    end
    
  end
  #
  TABLES = [
    "AcquisitionUnit",
    "CurrentUnit",
    "Inspection",
    "Inspector",
    "ProductionSchedule",
    "Property",
    "UnitCost"
  ]

    relative_path = "../../assets/unitlist.csv"
    full_path = File.expand_path(relative_path, __FILE__)
    # create_model_from_csv full_path, table
    # p "migrating"
    # system "rake db:migrate"
    p "copying"
    copy_table_from_csv full_path, "CurrentUnit"
    p "done, now go write your model!"

end