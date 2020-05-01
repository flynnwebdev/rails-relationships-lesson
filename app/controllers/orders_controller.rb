class OrdersController < ApplicationController
  def new
    @book = Book.find(params[:book_id])

    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @book.title,
        description: "by #{@book.author.full_name}",
        # images: [@book.picture],
        amount: (@book.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
      }],
      success_url: 'http://localhost:3000/orders/complete',
      cancel_url: 'http://localhost:3000/orders/cancel',
    )
    puts @session
  end
end
