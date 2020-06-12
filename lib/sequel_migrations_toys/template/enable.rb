# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations enable
		class Enable
			include Toys::Template

			on_expand do
				tool :enable do
					desc 'Enable migration'

					required_arg :filename

					def run
						require_relative '_migration_file'

						file = MigrationFile.find filename
						file.enable
					end
				end
			end
		end
	end
end
