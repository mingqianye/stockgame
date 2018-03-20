namespace :load_ticks do
  desc 'Loads final.csv to ticks table'
  task :load => :environment do
    require 'csv'
    CSV.foreach("#{Rails.root}/data/ticks.csv") do |row|
      Tick.find_or_initialize_by( 
        tushare_code: row.fetch(0),
        share_name:   row.fetch(1),
        date:         Date.parse(row.fetch(2)),
        ktype:        'D'
      ).update_attributes(
        open:         row.fetch(3),
        close:        row.fetch(4),
        high:         row.fetch(5),
        low:          row.fetch(6),
        volume:       row.fetch(7)
      )
    end
  end
end
