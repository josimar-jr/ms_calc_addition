class HealthcheckController < ApplicationController

  def show
    render json: {"status" => "ok"}, status: :ok
  end
end
