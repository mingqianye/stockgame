class PlayerOperationsQuery
  # returns:  [{"bought"=>6, "tick_id"=>468}, {"noop"=>6, "tick_id"=>467}, {"noop"=>6, "tick_id"=>469}, {"noop"=>6, "tick_id"=>471}, {"noop"=>6, "tick_id"=>472}, {"noop"=>6, "tick_id"=>473}, {"noop"=>6, "tick_id"=>474}, {"noop"=>6, "tick_id"=>475}, {"noop"=>6, "tick_id"=>476}, {"sold"=>6, "tick_id"=>470}]
  def self.count_op_types_for(tushare_code:, num_points:, ktype:, start_date:)
    Operation
      .joins(:game, :tick)
      .where('games.tushare_code = ?',     tushare_code)
      .where('games.num_points = ?',       num_points)
      .where('games.ktype = ?',            ktype)
      .where('DATE(games.start_date) = ?', start_date)
      .group('operations.op_type, operations.tick_id')
      .select('operations.tick_id, operations.op_type, COUNT(*) AS count')
      .as_json
      .map { |x| {x.fetch('op_type') => x.fetch('count'), 'tick_id' => x.fetch('tick_id')} }
      .group_by{|x| x.fetch('tick_id')}
      .values
      .map { |x| x.reduce{|total, y| total.merge(y)} }
  end
end
