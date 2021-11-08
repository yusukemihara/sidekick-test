class GenerateTicketFailJob < ApplicationJob
  queue_as :default

  # Ticketを登録するジョブ(意図的にエラーを発生)
  #
  # @params [String] チケット名
  def perform(name)
    puts "IntentionalError"
    raise "IntentionalError"
  end
end
