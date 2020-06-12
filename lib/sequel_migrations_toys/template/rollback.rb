# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for rollback migrations
		class Rollback
			include Toys::Template

			on_expand do
				tool :rollback do
					desc 'Rollback the database N steps'

					optional_arg :step, accept: Integer, default: 1

					def run
						exec_tool 'db:dump'

						require_relative '_migration_file'

						file = MigrationFile.find('*', only_one: false)[-1 - step.abs]

						## https://github.com/dazuma/toys/issues/33
						exec_tool ['db:migrations:run', "--target=#{file.version}"]

						puts "Rolled back to #{file.basename}"
					end
				end
			end
		end
	end
end
