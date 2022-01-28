require 'logger'

class UsersController < ApplicationController
  def index
    @message = "abc"
    config.logger.info("テスト")
  end
end
