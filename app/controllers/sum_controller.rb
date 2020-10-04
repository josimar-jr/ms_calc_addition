class SumController < ApplicationController

  def initialize
    @sum_service = SumService.new
  end

  def sum
    first = params[:value1].to_f
    second = params[:value2].to_f

    result = @sum_service.sum first, second
    render json: {"result" => result}, status: :ok
  end
end