module Api::V1
        class TwittsController < ApiController
            before_action :get_twitts, only: [:index]
            # Returns the list of last 10 twitts
            #
            # @response_status 200
            # @response_root twitts
            # @response_class Array<TwittSerializer>

            def index
                render json: @twitts
            end

        private
            def get_twitts
                service = TwittsGetService.new(params[:hashtags].split(','))
                @twitts = service.get_last
            end
        end
end