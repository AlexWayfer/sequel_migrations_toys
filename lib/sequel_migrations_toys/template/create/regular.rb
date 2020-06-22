# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		class Create
			## Define toys for Sequel migrations creation
			class Regular < Create::Base
				on_expand do |template|
					tool :regular do
						desc 'Create regular migration'

						required_arg :name

						to_run do
							create_migration_file template.db_migrations_dir, name
						end
					end
				end
			end
		end
	end
end
