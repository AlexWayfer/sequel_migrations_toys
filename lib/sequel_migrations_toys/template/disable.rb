# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations disable
		class Disable < Base
			on_expand do |template|
				tool :disable do
					desc 'Disable migration'

					required_arg :filename

					to_run do
						file = migration_file_class(template.db_migrations_dir).find_one filename
						file.disable
					end
				end
			end
		end
	end
end
