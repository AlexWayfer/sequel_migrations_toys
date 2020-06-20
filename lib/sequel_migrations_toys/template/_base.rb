# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Base class for templates
		class Base
			include Toys::Template

			attr_reader :db_connection_proc

			def initialize(db_connection_proc:)
				@db_connection_proc = db_connection_proc
			end

			def db_connection
				return @db_connection if defined? @db_connection

				@db_connection = db_connection_proc.call

				@db_connection.loggers << Logger.new($stdout)

				@db_connection
			end

			# private

			## Module with common code for migrations
			CommonMigrationsCode = Module.new do
				private

				def migration_file_class(db_connection = nil)
					return @migration_file_class if defined? @migration_file_class

					require "#{__dir__}/_migration_file"

					context_directory = self.context_directory
					db_migrations_dir = self.db_migrations_dir
					@migration_file_class = Class.new(MigrationFile) do
						self.root_dir = context_directory
						self.db_migrations_dir = db_migrations_dir
						self.db_connection = db_connection
					end
				end

				def db_migrations_dir
					"#{context_directory}/db/migrations"
				end
			end
		end
	end
end
