class ImportTicketsService
  class CodeAlreadyExists < StandardError; end

  def self.create_tickets!(codes)
    tickets = codes.map{ |code| {code:} }
    Ticket.insert_all!(tickets)
  rescue ActiveRecord::RecordNotUnique
    raise CodeAlreadyExists.new("チケットがダブってるよ")
  end
end
