task :create_user, [:email, :password] => :environment do |task, args|
  email_address = args[:email]
  password = args[:password]

  user_is_already_registered = User.find_by_email(email_address)

  if user_is_already_registered
    abort "\n\n\e[33mAlready exists an user with this email address < #{email_address} >.\e[0m\n\n"
  end

  user = User.new(email: email_address, password: password)

  unless user.valid?
    error_message = user.errors.messages.map do |field, message|
      "The field " +
        field.to_s +
        " " + message.join(" and ")
    end

    abort "\n\n\e[33mUser can't be registered: \n\n~> " + error_message.join("\n~> ") + "\n\n\e[0m"
  end

  user.save

  puts "\n\n\e[32mUser registered successfully!\e[0m\n\n"
end
