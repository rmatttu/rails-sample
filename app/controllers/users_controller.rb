require 'logger'

class UsersController < ApplicationController
  def index
    @message = "abc"
    config.logger.info("ใในใ")
    config.logger.info(SOME_CONSTANT[Rails.env]["test"])
  end
end
