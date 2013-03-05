# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module("Poker", ["ngResource"])

app.factory "Game", ["$resource", ($resource) ->
  $resource("/games")
]

@GameCtrl = ["$scope", "Game", ($scope, Game) ->
  $scope.games = Game.query()
  $scope.classDisplay = (card, suit) ->
  	suitVar = "clubs" if suit == 2
  	suitVar = "diams" if suit == 3
  	suitVar = "hearts" if suit == 5
  	suitVar = "spades" if suit == 7
  	cardValue = "rank-a" if card == 41
  	cardValue = "rank-2" if card == 2
  	cardValue = "rank-3" if card == 3
  	cardValue = "rank-4" if card == 5
  	cardValue = "rank-5" if card == 7
  	cardValue = "rank-6" if card == 11
  	cardValue = "rank-7" if card == 13
  	cardValue = "rank-8" if card == 17
  	cardValue = "rank-9" if card == 19
  	cardValue = "rank-10" if card == 23
  	cardValue = "rank-j" if card == 29
  	cardValue = "rank-q" if card == 31
  	cardValue = "rank-k" if card == 37  	
  	return "#{suitVar} #{cardValue}"
  	
  $scope.valDisplay = (card) ->
  	cardValue = "A" if card == 41
  	cardValue = "2" if card == 2
  	cardValue = "3" if card == 3
  	cardValue = "4" if card == 5
  	cardValue = "5" if card == 7
  	cardValue = "6" if card == 11
  	cardValue = "7" if card == 13
  	cardValue = "8" if card == 17
  	cardValue = "9" if card == 19
  	cardValue = "10" if card == 23
  	cardValue = "J" if card == 29
  	cardValue = "Q" if card == 31
  	cardValue = "K" if card == 37  	
  	return "#{cardValue}"
  	
  $scope.suitDisplay = (suit) ->
  	suitVar = "♣" if suit == 2
  	suitVar = "♦" if suit == 3
  	suitVar = "♥" if suit == 5
  	suitVar = "♠" if suit == 7
  	return "#{suitVar}"
]

