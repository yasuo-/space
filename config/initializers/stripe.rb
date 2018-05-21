# Configuring the application

# The application makes use of your publishable and secret API keys to interact with Stripe.
# An initializer is a good place to set these values,
# which will be provided when the application is started.
Rails.configuration.stripe = {
  publishable_key: Rails.application.secrets.stripe_publishable_key,
  secret_key: Rails.application.secrets.stripe_secret_key,
  client_id: Rails.application.secrets.stripe_connect_client_id
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]