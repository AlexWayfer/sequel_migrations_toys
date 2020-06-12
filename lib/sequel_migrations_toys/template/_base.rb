# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Base class for templates
		class Base
			include Toys::Template

			attr_reader :application

			def initialize(application:)
				@application = application
			end

			private

			def require_application_config
				require "#{context_directory}/config/config"
			end

			def db_connection
				return @db_connection if defined?(@db_connection)

				require_application_config

				@db_connection = application.db_connection
			end

			def db_migrations_dir
				"#{context_directory}/db/migrations"
			end

			# db_connection.loggers << Logger.new($stdout)
		end
	end
end
