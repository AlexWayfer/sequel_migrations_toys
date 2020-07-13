# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for rollback migrations
		class Rollback < Base
			on_expand do |template|
				tool :rollback do
					include :exec, exit_on_nonzero_status: true

					desc 'Rollback the database N steps'

					optional_arg :step, accept: Integer, default: 1

					to_run do
						files = migration_file_class(template.db_migrations_dir).find_all '*'
						file = files[-1 - step.abs]

						target = file ? file.version : 0

						## https://github.com/dazuma/toys/issues/33
						exec_tool ['database:migrations:run', "--target=#{target}"]

						target_string = file ? file.basename : 'empty database.'

						puts "Rolled back to #{target_string}"
					end
				end
			end
		end
	end
end
