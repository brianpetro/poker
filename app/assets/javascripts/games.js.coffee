# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module("Poker", ["ngResource"])

app.factory "Game", ["$resource", ($resource) ->
  $resource("/games")
]

@GameCtrl = ["$scope", "Game", ($scope, Game) ->
  $scope.games = Game.query()
  $scope.display = (card, suit) ->
  	suitVar = "clubs" if suit == 2
  	suitVar = "diamonds" if suit == 3
  	suitVar = "hearts" if suit == 5
  	suitVar = "spades" if suit == 7
  	cardValue = "vA" if card == 41
  	cardValue = "v2" if card == 2
  	cardValue = "v3" if card == 3
  	cardValue = "v4" if card == 5
  	cardValue = "v5" if card == 7
  	cardValue = "v6" if card == 11
  	cardValue = "v7" if card == 13
  	cardValue = "v8" if card == 17
  	cardValue = "v9" if card == 19
  	cardValue = "v10" if card == 23
  	cardValue = "vJ" if card == 29
  	cardValue = "vQ" if card == 31
  	cardValue = "vK" if card == 37  	
  	return "#{suitVar} #{cardValue}"
]

