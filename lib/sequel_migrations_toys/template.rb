# frozen_string_literal: true

require 'toys-core'

module SequelMigrationsToys
	## Define toys for Sequel migrations
	class Template
		include Toys::Template

		attr_reader :db_migrations_dir, :db_connection_proc

		def initialize(db_migrations_dir: 'db/migrations', db_connection_proc:)
			@db_migrations_dir = db_migrations_dir
			@db_connection_proc = db_connection_proc
		end

		on_expand do |template|
			tool :database do
				tool :migrations do
					require_relative 'template/_base'

					subtool_apply do
						include Base::CommonMigrationsCode
					end

					%w[Create List Check Enable Disable Reversion Run Rollback]
						.each do |template_name|
							require_relative "template/#{template_name.downcase}"
							expand Template.const_get(template_name, false),
								db_migrations_dir: template.db_migrations_dir,
								db_connection_proc: template.db_connection_proc
						end
				end

				alias_tool :migrate, 'migrations:run'
				alias_tool :migrations, 'migrations:list'
			end
		end
	end
end
