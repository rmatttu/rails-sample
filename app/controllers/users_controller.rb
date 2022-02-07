require 'logger'

class UsersController < ApplicationController
  def index
    @message = "abc"
    config.logger.info("テスト")
    config.logger.info(SOME_CONSTANT[Rails.env]["test"])
  end
end
