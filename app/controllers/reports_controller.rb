# Controller for automatically generated service reporting across lines.
class ReportsController < ApplicationController
  before_action :confirm_data_access, only: [:index]
  before_action :confirm_data_access_async, only: [:report]

  def index; end

  def report
    case params[:timeframe]
    when 'weekly'
      @report = Reports::LineSummary.generate(1.week.ago, Date.today)
      render partial: "patient_report", locals: { report: @report, lines: LINES, timeframe: params[:timeframe] }

    when 'monthly'
      @report = Reports::LineSummary.generate(1.month.ago, Date.today)
      render partial: "patient_report", locals: { report: @report, lines: LINES, timeframe: params[:timeframe] }

    when 'yearly'
      @report = Reports::LineSummary.generate(1.year.ago, Date.today)
      render partial: "patient_report", locals: { report: @report, lines: LINES, timeframe: params[:timeframe] }

    when 'fulfillment'
      @reports = Rerports::Fulfillmentt.generate
      render partial: "patient_report", locals: { report: @report, lines: LINES, timeframe: params[:timeframe] }

    else
      head :not_acceptable
    end
  end
end
