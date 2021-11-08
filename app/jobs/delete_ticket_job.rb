class DeleteTicketJob < ApplicationJob
  queue_as :default

  # Ticketを削除するジョブ
  #
  # @params [Integer] id
  def perform(id)
    Ticket.find(id).destroy
  end
end
