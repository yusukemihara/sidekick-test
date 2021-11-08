class GenerateTicketJob < ApplicationJob
  queue_as :default

  # Ticketを登録するジョブ
  #
  # @params [String] チケット名
  def perform(name)
    t = Ticket.create(name: name)
    puts "generate_ticket: #{t}"
  end
end
