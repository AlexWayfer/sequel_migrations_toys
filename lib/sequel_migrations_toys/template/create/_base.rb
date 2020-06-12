# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		class Create
			## Base class for Sequel migrations creation toys
			class Base < Template::Base
				include Toys::Template

				private

				def create_migration_file(name, content = nil)
					require_relative '../_migration_file'

					file = MigrationFile.new name: name, content: content

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
