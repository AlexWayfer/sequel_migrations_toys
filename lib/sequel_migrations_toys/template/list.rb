# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations list
		class List < Base
			on_expand do |template|
				tool :list do
					desc 'Show all migrations'

					to_run do
						files =
							migration_file_class(template.db_migrations_dir, template.db_connection)
								.find_all '*'
						files.each(&:print)
					end
				end

				alias_tool :status, :list
			end
		end
	end
end
