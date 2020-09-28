class PlayersController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @players = Player.all
    render :index
  end

  def new
    @player = Player.new
    render :new
  end

  def create
    player = Player.create(player_params)
    redirect_to player
  end

  def edit
    render :edit
  end

  def show
    @params = params
    @player = Player.find(params[:id])
    render :show
  end

  def import
    # items = []
    # CSV.foreach('link/to/file.csv', headers: true) do |row|
    #   items << row.to_h
    # end
    # Item.import(items)
    file = params[:file].read
    # data = JSON.parse(file)

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

      player.save
    end

    redirect_to action: "index"
  end

  private
  def player_params
    params.require(:player).permit(:name, :set, :description, :amount_cents)
  end
end