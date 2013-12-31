class BaseController < ApplicationController
  respond_to :json

  def render_api_error(message, errors, options = { })
    status = options[:status] || 422

    if (message and errors)
      render(
        json: {
          status: status,
          message: message,
          errors: errors
        },
        status: status
      )
    end
  end
end
