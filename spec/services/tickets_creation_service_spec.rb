require 'rails_helper'

RSpec.describe TicketsCreationService do
  describe '#create_tickets!' do
    it "チケットが重複している時、ActiveRecord::RecordNotUniqueが発生して、チケットの数が変わらない" do
      expect {
        expect {
          TicketsCreationService.create_tickets!(%w[AAA AAA XXX])
        }.to raise_error(ActiveRecord::RecordNotUnique)
      }.not_to change { Ticket.count }
    end
  end
end
