# == Schema Information
#
# Table name: currentunits
#
#  id          :integer          not null, primary key
#  property    :string(255)
#  unit_number :string(255)
#  unit_type   :string(255)
#  square_feet :string(255)
#  rent        :string(255)
#  date        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Currentunit < ActiveRecord::Base
  has_one :manager_inspection
  
  def self.to_csv( options = {})
    CSV.generate( options ) do |csv|
      wanted = column_names - ["created_at", "updated_at"]
      csv << wanted
      all.each do |unit|
        csv << unit.attributes.values_at(*wanted)
      end
    end
  end

  def self.import(file)
    ActiveRecord::Base.connection.execute("TRUNCATE currentunits;")

    columns = CSV.open(file.path).readline
    
    cols = "("
    columns.each do |col|
      pg_column = col.gsub(" ","_").strip
      cols << "#{pg_column.downcase},"
    end
    cols.chop! #remove trailing comma from final shovel
    cols << ")"

    conn = ActiveRecord::Base.connection

    rc = conn.raw_connection

    rc.exec("COPY currentunits #{cols} FROM STDIN WITH CSV")

    open_file = File.open(file.path, 'r')
    open_file.readline
    while !open_file.eof?
      # Add row to copy data
      rc.put_copy_data(open_file.readline)
    end
    rc.put_copy_end 
 
    # Display any error messages
    while res = rc.get_result
      if e_message = res.error_message
        p e_message
      end
    end
    
  end


  
end
