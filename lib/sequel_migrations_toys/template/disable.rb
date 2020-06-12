# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations disable
		class Disable
			include Toys::Template

			on_expand do
				tool :disable do
					desc 'Disable migration'

					required_arg :filename

					def run
						require_relative '_migration_file'

						file = MigrationFile.find filename
						file.disable
					end
				end
			end
		end
	end
end
