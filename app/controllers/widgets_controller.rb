# frozen_string_literal: true

class WidgetsController < ApplicationController
 

  def index
    @widgetA = Widget.all
    @widgetN = Widget.new
  end

  def create
    @widgetN = Widget.new(user_params)
    if @widgetN.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Widget.find(params[:id]).destroy
    redirect_to root_path
 end

  private

  def user_params
    params.require(:widget).permit(:description, :quantity)
  end
end
