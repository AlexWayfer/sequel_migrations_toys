# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations reversion
		class Reversion < Base
			on_expand do
				tool :reversion do
					desc 'Change version of migration to latest'

					required_arg :filename

					def run
						file = migration_file_class.find filename
						file.reversion
					end
				end
			end
		end
	end
end
