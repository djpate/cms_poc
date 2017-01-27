class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
    render :index, layout: nil
  end
end
