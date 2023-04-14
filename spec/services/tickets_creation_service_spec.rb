require 'rails_helper'

RSpec.describe TicketsCreationService do
  describe '#create_tickets!' do
    it 'creates new tickets' do
      expect {
        TicketsCreationService.create_tickets!(['ABC123', 'DEF456', 'GHI789'])
      }.to change(Ticket, :count).by(3)
    end

    it 'raises an error if a code is blank' do
      expect {
        TicketsCreationService.create_tickets!(['ABC123', '', 'GHI789'])
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'raises an error if a code is not unique' do
      Ticket.create!(code: 'ABC123')
      expect {
        TicketsCreationService.create_tickets!(['ABC123', 'DEF456', 'GHI789'])
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
