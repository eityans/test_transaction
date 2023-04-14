class TicketsCreationService
  def self.create_tickets!(codes)
    now = Time.zone.now
    tickets = codes.map do |code|
      {
        code: code,
        created_at: now,
        updated_at: now,
      }
    end

    Ticket.insert_all!(tickets)
  end
end
