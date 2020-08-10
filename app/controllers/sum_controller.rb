class SumController < ApplicationController

  def initialize
    @sum_service = SumService.new
  end

  def sum
    puts "param2 #{params[:par2].class} param #{params}"
    first = params[:par1].to_f
    second = params[:par2].to_f

    result = @sum_service.sum first, second
    render json: {"result" => result}, status: :ok
  end
end