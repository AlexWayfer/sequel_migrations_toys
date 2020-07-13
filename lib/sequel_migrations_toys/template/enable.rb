# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations enable
		class Enable < Base
			on_expand do |template|
				tool :enable do
					desc 'Enable migration'

					required_arg :filename

					to_run do
						file = migration_file_class(template.db_migrations_dir).find_one filename
						file.enable
					end
				end
			end
		end
	end
end
