# app/controllers/array_product_controller.rb
# frozen_string_literal: true

class ArrayProductController < ApplicationController
  def index
    @default_values = [-7, 2, 3, -4, 5, -6]
  end

  def calculate
    input_array = params[:input_array].split(',').map(&:strip)

    if input_array.empty?
      flash[:error] = 'Массив не должен быть пустым'
      redirect_to array_product_index_path
      return
    end

    unless input_array.all? { |element| numeric?(element) }
      flash[:error] = 'Все элементы должны быть числами!'
      redirect_to array_product_index_path
      return
    end

    input_array.map!(&:to_i)

    if input_array.empty?
      flash[:error] = 'Массив должен содержать хотя бы одно число'
      redirect_to array_product_index_path
      return
    end

    negative_sum = input_array.select { |num| num.negative? }.sum
    first_odd_index = input_array.index(&:odd?)

    input_array[first_odd_index] = negative_sum if first_odd_index

    @result_array = input_array

    flash[:error] = nil
  end

  private

  def numeric?(input)
    Float(input) != nil rescue false
  end
end

