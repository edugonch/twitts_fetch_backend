class TwittsGetService

    def initialize(tags)
        @tags = tags
    end

    def get_last(limit=10)
        Twitt.where("hashtag in ('#{@tags.join("','")}')").order("created_at DESC").limit(limit)
    end
end