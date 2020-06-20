# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		class Create
			## Base class for Sequel migrations creation toys
			class Base < Template::Base
				include Toys::Template

				# private

				## Common code for migrations creation
				module CommonMigrationsCreateCode
					private

					def create_migration_file(name, content = nil)
						file = migration_file_class.new(name: name, content: content)

						file.generate
					end

					def render_template(filename)
						require 'erb'
						filename = "#{db_migrations_dir}/templates/#{filename}.rb.erb"
						renderer = ERB.new File.read filename
						renderer.filename = filename
						renderer.result binding
					end
				end
			end
		end
	end
end
