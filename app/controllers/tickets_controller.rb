class TicketsController < ApplicationController
  def generate
    uuid = SecureRandom.uuid
    GenerateTicketJob.perform_later(uuid)
    render plain: "generate ticket job start: #{uuid}"
  end

  def generate_delay
    uuid = SecureRandom.uuid
    GenerateTicketDelayJob.perform_later(uuid)
    render plain: "generate ticket delay job start: #{uuid}"
  end

  def generate_fail
    uuid = SecureRandom.uuid
    GenerateTicketFailJob.perform_later(uuid)
    render plain: "generate ticket fail job start: #{uuid}"
  end

  def generate_sometimes
    uuid = SecureRandom.uuid
    GenerateTicketSometimesJob.perform_later(uuid)
    render plain: "generate ticket sometimes job start: #{uuid}"
  end

  def delete
    id = Ticket.all.last.id
    DeleteTicketJob.perform_later(id)
    render plain: "delete #{id} job start"
  end
end
