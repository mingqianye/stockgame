namespace :load_ticks do
  desc 'Loads final.csv to ticks table'
  task :load => :environment do
    require 'csv'
    ticks = []
    CSV.foreach("/data/ticks.csv") do |row|
      ticks << Tick.new( 
        tushare_code: row.fetch(0),
        share_name:   row.fetch(1),
        date:         Date.parse(row.fetch(2)),
        ktype:        'D',
        open:         row.fetch(3).to_f.round(2),
        close:        row.fetch(4).to_f.round(2),
        high:         row.fetch(5).to_f.round(2),
        low:          row.fetch(6).to_f.round(2),
        volume:       row.fetch(7).to_f
      )
      if ticks.count == 10000
        Tick.import(ticks)
        ticks = []
      end
    end
    Tick.import(ticks)
  end
end
