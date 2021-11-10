class GenerateTicketFailJob < ApplicationJob
  queue_as :default

  # リトライ上限に達した際にログを残す
  #sidekiq_retries_exhausted do |msg, e|
  #  Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  #end

  # Ticketを登録するジョブ(意図的にエラーを発生)
  #
  # @params [String] チケット名
  def perform(name)
    puts "IntentionalError"
    raise "IntentionalError"
  end
end
