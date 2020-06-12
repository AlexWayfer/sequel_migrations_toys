# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations check
		class Check
			include Toys::Template

			on_expand do
				tool :check do
					desc 'Check applied migrations'

					def run
						require_relative '_migration_file'

						if MigrationFile.applied_not_existing.any?
							puts 'Applied, but not existing'
							MigrationFile.applied_not_existing.each(&:print)
							puts "\n" if MigrationFile.existing_not_applied.any?
						end

						return unless MigrationFile.existing_not_applied.any?

						puts 'Existing, but not applied'
						MigrationFile.existing_not_applied.each(&:print)
					end
				end
			end
		end
	end
end
