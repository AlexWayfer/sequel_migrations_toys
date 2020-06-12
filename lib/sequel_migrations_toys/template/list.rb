# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations list
		class List
			include Toys::Template

			on_expand do
				tool :list do
					desc 'Show all migrations'

					def run
						require_relative '_migration_file'

						files = MigrationFile.find '*', only_one: false
						files.each(&:print)
					end
				end
			end
		end
	end
end
