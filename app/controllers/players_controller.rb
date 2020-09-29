class PlayersController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :sort_column, :sort_direction

  def index
    query = Player
    query = query.order(sort_column + " " + sort_direction) if params[:sort].present? && params[:direction].present?
    query = query.by_name(params[:search]) if params[:search].present?
    @players = query.paginate(page: params[:page])

    render :index
  end

  def show
    @params = params
    @player = Player.find(params[:id])
    render :show
  end

  def import
    return redirect_to action: "index" if params[:file].blank?
    file = params[:file].read

    players = []
    user_data = JSON.parse(file)
    users = user_data.map do |line|
      player = Player.new
      player.player = line['Player']
      player.team = line['Team']
      player.position = line['Pos']
      player.attempts = line['Att']
      player.attempts_per_game = line['Att/G']
      player.yds = line['Yds']
      player.avg = line['Avg']
      player.yards_per_game = line['Yds/G']
      player.touchdowns = line['TD']
      player.longest_rush = line['Lng']
      player.first_rush_downs = line['1st']
      player.first_rush_down_percentage = line['1st%']
      player.rushing_20_yards = line['20+']
      player.rushing_40_yards = line['40+']
      player.fumbles = line['FUM']

      players << player
    end
    Player.import( players, on_duplicate_key_update: Player.column_names - ["id", "player"] )

    redirect_to action: "index"
  end

  def export
    query = Player.all
    query = query.order(sort_column + " " + sort_direction) if params[:sort].present? && params[:direction].present?
    query = query.by_name(params[:search]) if params[:search].present?
    @players = query

    respond_to do |format|
      format.html
      format.csv { send_data @players.to_csv, filename: "players-#{Date.today}.csv" }
    end
  end

  private

  def search_params
    params.require(:player).permit(:search, :sort, :direction)
  end

  def sort_column
    Player.column_names.include?(params[:sort]) ? params[:sort] : "player"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
