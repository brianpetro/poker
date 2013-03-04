class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
	respond_to :json, :html
	
  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
  	@seat1 = get_cards('seat1')
  	@seat2 = get_cards('seat2')
  	@seat3 = get_cards('seat3')
  	@seat4 = get_cards('seat4')
  	@seat5 = get_cards('seat5')
  	@seat6 = get_cards('seat6')
  	@seat7 = get_cards('seat7')
  	@seat8 = get_cards('seat8')
  	@flop = get_cards('flop')
  	@turn = get_cards('turn')
  	@river = get_cards('river')
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params[:game]
    end
    
  	def get_cards(deal_motion)
  		card = []
			card[1] = [41, 2] # Ace of Clubs
			card[2] = [2, 2]
			card[3] = [3, 2]
			card[4] = [5, 2]
			card[5] = [7, 2]
			card[6] = [11, 2]
			card[7] = [13, 2]
			card[8] = [17, 2]
			card[9] = [19, 2]
			card[10] = [23, 2]
			card[11] = [29, 2]
			card[12] = [31, 2]
			card[13] = [37, 2]

			card[14] = [41, 3] # Ace of diamonds
			card[15] = [2, 3]
			card[16] = [3, 3]
			card[17] = [5, 3]
			card[18] = [7, 3]
			card[19] = [11, 3]
			card[20] = [13, 3]
			card[21] = [17, 3]
			card[22] = [19, 3]
			card[23] = [23, 3]
			card[24] = [29, 3]
			card[25] = [31, 3]
			card[26] = [37, 3]

			card[27] = [41, 5,] # Ace of hearts
			card[28] = [2, 5,]
			card[29] = [3, 5,]
			card[30] = [5, 5,]
			card[31] = [7, 5,]
			card[32] = [11, 5,]
			card[33] = [13, 5,]
			card[34] = [17, 5,]
			card[35] = [19, 5,]
			card[36] = [23, 5,]
			card[37] = [29, 5,]
			card[38] = [31, 5,]
			card[39] = [37, 5,]

			card[40] = [41, 7,] # Ace of spades
			card[41] = [2, 7,]
			card[42] = [3, 7,]
			card[43] = [5, 7,]
			card[44] = [7, 7,]
			card[45] = [11, 7,]
			card[46] = [13, 7,]
			card[47] = [17, 7,]
			card[48] = [19, 7,]
			card[49] = [23, 7,]
			card[50] = [29, 7,]
			card[51] = [31, 7,]
			card[0] = [37, 7,]
			draw = card.sample(52)
			return [draw[0], draw[1]] if deal_motion == 'seat1'
			return [draw[2], draw[3]] if deal_motion == 'seat2'
			return [draw[4], draw[5]] if deal_motion == 'seat3'
			return [draw[6], draw[7]] if deal_motion == 'seat4'
			return [draw[8], draw[9]] if deal_motion == 'seat5'
			return [draw[10], draw[11]] if deal_motion == 'seat6'
			return [draw[12], draw[13]] if deal_motion == 'seat7'
			return [draw[14], draw[15]] if deal_motion == 'seat8'
			
			return [draw[51], draw[50], draw[49]] if deal_motion == 'flop'
			return [draw[48]] if deal_motion == 'turn'
			return [draw[47]] if deal_motion == 'river'
			
			
		end
		
end
