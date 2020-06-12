# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations reversion
		class Reversion
			include Toys::Template

			on_expand do
				tool :reversion do
					desc 'Change version of migration to latest'

					required_arg :filename

					def run
						require_relative '_migration_file'

						file = MigrationFile.find filename
						file.reversion
					end
				end
			end
		end
	end
end
