class TicketsCreationService
  def self.create_tickets!(codes)
    codes.each do |code|
      Ticket.create!(code: code)
    end
  end
end
