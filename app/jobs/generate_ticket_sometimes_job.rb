class GenerateTicketSometimesJob < ApplicationJob
  queue_as :default

  # リトライ上限に達した際にログを残す
  #sidekiq_retries_exhausted do |msg, e|
  #  Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  #end

  # n回に1回程度Ticketを登録するジョブ
  #
  # @params [String] チケット名
  # @params [Integer] n
  def perform(name, n = 10)
    if SecureRandom.random_number(10000) % n == 0
      t = Ticket.create(name: name)
      puts "generate_ticket: #{t}"
    else
      puts "Fail"
      raise "Fail"
    end
  end
end
