# frozen_string_literal: true

require 'database_cleaner/active_record'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)

  setup { DatabaseCleaner.start }
  teardown { DatabaseCleaner.clean }
end
