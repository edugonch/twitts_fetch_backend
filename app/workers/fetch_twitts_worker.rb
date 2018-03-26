class FetchTwittsWorker
  include Sidekiq::Worker

  def perform
    service = TwitterFetchService.new
    service.fetch_last
  end
end
