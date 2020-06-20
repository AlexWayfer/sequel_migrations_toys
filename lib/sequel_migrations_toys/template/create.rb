# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for Sequel migrations creation
		class Create < Template::Base
			on_expand do |template|
				tool :create do
					require_relative 'create/_base'

					subtool_apply do
						include Create::Base::CommonMigrationsCreateCode
					end

					require_relative 'create/regular'
					expand Create::Regular,
						db_connection_proc: template.db_connection_proc
				end

				alias_tool :create, 'create:regular'
				alias_tool :new, :create
			end
		end
	end
end
