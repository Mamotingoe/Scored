require 'sinatra'
require '/home/mamotingoe/code/Mamotingoe/Scored/cluster.rb'

class App < Sinatra::Base
  before do
    # Check if the user is logged in and has consented to the collection and use of their data. If not, redirect the user to the appropriate page.
    if !session[:user] || !session[:data_consent]
      redirect to('/data-consent')
    end
  end

  get '/' do
    # Get the user's features from a form, database, or other source.

    features = get_features_from_user

    # Pre-process the data before predicting the credit score.
    preprocessed_features = preprocess_data(features)

    # Check if the pre-processed data contains any sensitive or harmful information. If so, do not predict the credit score.
    if check_for_sensitive_information(preprocessed_features)
      raise 'The data contains sensitive or harmful information. Cannot predict the credit score.'
    end

    # Predict the user's credit score
    cluster = Cluster.new
    cluster.fit(preprocessed_features)
    predicted_credit_score = cluster.predict(preprocessed_features)

    # Display the user's predicted credit score
    erb :index, locals: { predicted_credit_score: predicted_credit_score }
  end

  # Add additional safety checks to the other endpoints as needed.
end
