class GenerateTicketDelayJob < ApplicationJob
  queue_as :default

  # 指定秒待機してからTicketを登録するジョブ
  #
  # @params [String] チケット名
  # @params [Integer] 待機秒
  def perform(name, sec = 10)
    sleep sec
    t = Ticket.create(name: name)
    puts "generate_ticket_delay: #{t}"
  end
end
