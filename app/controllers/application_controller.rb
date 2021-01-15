class ApplicationController < ActionController::API

        def encode_token(payload)
            JWT.encode(payload, 'secret') #second argument is the secret
        end
end
