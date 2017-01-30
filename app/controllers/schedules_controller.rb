class SchedulesController < ApplicationController
  before_action :set_client, only: [:start_schedule, :stop_schedule, :generate_bill]
  def start_schedule
    set_client
    @schedule = Schedule.new({ start_time: Time.now, client_id: @client.id})
    @schedule.save
    @client.update_attributes(is_active: true)
  end
  def stop_schedule
    set_client
    @client.schedules.last.update_attributes(end_time: Time.now)
    @schedule = @client.schedules.last
    @client.update_attributes(is_active: false)
    update_duration
  end

  def generate_bill
    @schedules = @client.schedules
    @complete_duration = get_complete_duration
    @total_amount = @complete_duration * params[:rate].to_i
  end

  private
  def set_client
    @client = Client.find(params[:id])
  end
  def update_duration
    start_time = @schedule.start_time.localtime
    end_time = @schedule.end_time.localtime
    duration = ((end_time - start_time)/3600).round(2)
    @schedule.update_attributes(duration: duration)
  end
  def get_complete_duration
    duration_array = @schedules.map { |schedule| schedule.duration }
    duration_array.inject(0){|sum,x| sum + x.to_f }.round(2)
  end
end
