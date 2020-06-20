# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations enable
		class Enable < Base
			on_expand do
				tool :enable do
					desc 'Enable migration'

					required_arg :filename

					def run
						file = migration_file_class.find filename
						file.enable
					end
				end
			end
		end
	end
end
