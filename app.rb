require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:rules)
end

get("/:rps") do
  @user_rps = params.fetch("rps")
  @opponent = ["rock", "paper", "scissors"]
  @opponent_sample = @opponent.sample
  erb(:flexible)
end
