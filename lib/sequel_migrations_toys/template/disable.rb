# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations disable
		class Disable < Base
			on_expand do
				tool :disable do
					desc 'Disable migration'

					required_arg :filename

					def run
						file = migration_file_class.find filename
						file.disable
					end
				end
			end
		end
	end
end
