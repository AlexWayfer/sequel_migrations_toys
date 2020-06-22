# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations reversion
		class Reversion < Base
			on_expand do |template|
				tool :reversion do
					desc 'Change version of migration to latest'

					required_arg :filename

					to_run do
						file = migration_file_class(template.db_migrations_dir).find filename
						file.reversion
					end
				end
			end
		end
	end
end
