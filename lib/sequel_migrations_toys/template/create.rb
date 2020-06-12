# frozen_string_literal: true

module SequelMigrationsToys
	class Template
		## Define toys for Sequel migrations creation
		class Create < Base
			on_expand do |template|
				tool :create do
					require_relative 'create/_base'

					require_relative 'create/regular'
					expand Create::Regular, application: template.application
				end

				alias_tool :create, 'create:regular'
				alias_tool :new, :create
			end
		end
	end
end
