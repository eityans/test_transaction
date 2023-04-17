require 'rails_helper'

RSpec.describe ImportTicketsService do
  describe '#create_tickets!' do
    it "チケットが重複している時、ActiveRecord::RecordNotUniqueが発生する" do

      expect {
        ImportTicketsService.create_tickets!(%w[AAA AAA XXX])
      }.to raise_error(ImportTicketsService::CodeAlreadyExists)

    end

    it "チケットが重複している時、ActiveRecord::RecordNotUniqueが発生して、チケットの数が変わらない" do
      expect {
        expect {
          ImportTicketsService.create_tickets!(%w[AAA AAA XXX])
        }.to raise_error(ImportTicketsService::CodeAlreadyExists)
      }.not_to change { Ticket.count }
    end

    it "無効化になったトランザクションを利用しているのでエラーになる例" do
      expect {
        ImportTicketsService.create_tickets!(%w[AAA AAA XXX])
      }.to raise_error(ImportTicketsService::CodeAlreadyExists)

      p Ticket.count
    end

    it "無効化になったトランザクションを利用していないのでエラーにならない例" do
      expect {
        ImportTicketsService.create_tickets!(%w[AAA AAA XXX])
      }.to raise_error(ImportTicketsService::CodeAlreadyExists)
      expect(1+1).to eq(2)
    end

    it "無効化になりうる部分をトランザクションで覆うことで、エラーを回避する例" do
      expect {
        ActiveRecord::Base.transaction do
          ImportTicketsService.create_tickets!(%w[AAA AAA XXX])
        end
      }.to raise_error(ImportTicketsService::CodeAlreadyExists)
      p Ticket.count
    end
  end
end
