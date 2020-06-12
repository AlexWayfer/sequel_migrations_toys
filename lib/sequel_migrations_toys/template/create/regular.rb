# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		class Create
			## Define toys for Sequel migrations creation
			class Regular < Create::Base
				on_expand do
					tool :regular do
						desc 'Create regular migration'

						required_arg :name

						def run
							create_migration_file name
						end
					end
				end
			end
		end
	end
end
