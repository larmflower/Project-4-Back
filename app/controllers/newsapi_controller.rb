class NewsapiController < ApplicationController
  def news

    newsforecast = HTTParty.get("https://newsapi.org/v1/articles?source=#{params[:news]}&apiKey=59126808b2724541acd1c195d82b52a0", {
        query: {
          units: "si"
        },
        headers: { "Accept" => "application/json" }
    }).parsed_response

    render json: newsforecast, status: :ok

  end
end
