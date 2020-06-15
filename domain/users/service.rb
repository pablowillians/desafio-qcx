module Users
  class Service
    def generate_jwt(id)
      rails_secret = Rails.application.secrets.secret_key_base
      expiration_time = 60.days.from_now.to_i
      JWT.encode({ id: id, exp: expiration_time }, rails_secret)
    end
  end
end