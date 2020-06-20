# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for migrations check
		class Check < Base
			on_expand do |template|
				tool :check do
					desc 'Check applied migrations'

					to_run do
						migration_file_class = migration_file_class(template.db_connection)

						if migration_file_class.applied_not_existing.any?
							puts 'Applied, but not existing'
							migration_file_class.applied_not_existing.each(&:print)

							puts "\n" if migration_file_class.existing_not_applied.any?
						end

						return if migration_file_class.existing_not_applied.empty?

						puts 'Existing, but not applied'
						migration_file_class.existing_not_applied.each(&:print)
					end
				end
			end
		end
	end
end
