class PlayersController < ApplicationController
  def upsert
    player = Player.where(open_id: upsert_params.fetch(:open_id)).first_or_initialize
    player.update_attributes(
          union_id:   upsert_params[:union_id],
          nick_name:  upsert_params[:nick_name],
          avatar_url: upsert_params[:avatar_url],
          gender:     upsert_params[:gender],
          city:       upsert_params[:city],
          province:   upsert_params[:province],
          country:    upsert_params[:country],
          language:   upsert_params[:language]
    )
    render json: {upserted_player: player.as_json}
  end

  private
  def upsert_params
    @uparams ||= params.permit(:open_id, :union_id, :nick_name, :avatar_url, :gender, :city, :province, :country, :language)
  end
end
