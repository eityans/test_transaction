class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
  end

  def create_tickets
    ImportTicketsService.create_tickets!(params[:codes].split(','))
    redirect_to tickets_path
  end
end
