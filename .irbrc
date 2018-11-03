require "awesome_print"

if defined?(PryRails::RAILS_PROMPT)
  Pry.config.prompt = PryRails::RAILS_PROMPT
  AwesomePrint.pry!
else
  AwesomePrint.irb!
end
