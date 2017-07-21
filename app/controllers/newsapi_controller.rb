class NewsapiController < ApplicationController
    skip_before_action :authenticate_user!
  def news
    p  params["news"]
    newsType = HTTParty.get("https://newsapi.org/v1/articles?source=#{params[:news]}&apiKey=59126808b2724541acd1c195d82b52a0", {
        query: {
          units: "si"
        },
        headers: { "Accept" => "application/json" }
    }).parsed_response
    p newsType
    render json: newsType, status: :ok

  end
end
