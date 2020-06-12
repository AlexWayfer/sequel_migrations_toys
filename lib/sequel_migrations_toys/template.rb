# frozen_string_literal: true

require 'toys-core'

module SequelMigrationsToys
	## Define toys for Sequel migrations
	class Template
		include Toys::Template

		attr_reader :application

		def initialize(application:)
			@application = application
		end

		on_expand do |template|
			tool :migrations do
				require_relative 'template/_base'

				require_relative 'template/create'
				expand Template::Create, application: template.application

				require_relative 'template/list'
				expand Template::List

				require_relative 'template/check'
				expand Template::Check

				require_relative 'template/enable'
				expand Template::Enable

				require_relative 'template/disable'
				expand Template::Disable

				require_relative 'template/reversion'
				expand Template::Reversion

				require_relative 'template/run'
				expand Template::Run, application: template.application

				require_relative 'template/rollback'
				expand Template::Rollback
			end

			alias_tool :migrate, 'migrations:run'
			alias_tool :migrations, 'migrations:list'
		end
	end
end
