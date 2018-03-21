class InsertPlayerOperationService
  def self.insert!(params, new_game_id: SecureRandom.hex(10))
    params[:operations].each do |op|
      Operation.create(
        game_id:      new_game_id,
        open_id:      params.fetch(:open_id),
        tushare_code: params.fetch(:tushare_code),
        ktype:        params.fetch(:ktype).to_s,
        num_points:   params.fetch(:num_points).to_i,
        start_date:   Date.parse(params.fetch(:start_date)),
        op_type:      op.fetch(:operation_type),
        point_index:  op.fetch(:point_index),
        operated_at:  DateTime.strptime(op.fetch(:operated_at).to_s,'%s')
      )
    end
    'ok'
  end
end
