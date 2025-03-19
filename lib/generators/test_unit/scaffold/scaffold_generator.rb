require "rails/generators/test_unit/scaffold/scaffold_generator"

module TestUnit # :nodoc:
  module Generators # :nodoc:
    class ScaffoldGenerator < Base # :nodoc:
      def fix_system_test
        if turbo_defined?
          gsub_file File.join("test/system", class_path, "#{file_name.pluralize}_test.rb"), "click_on \"Destroy this #{human_name.downcase}\", match: :first", "accept_confirm { click_on \"Destroy this #{human_name.downcase}\", match: :first }"
        end
      end

      private

      def turbo_defined?
        defined?(Turbo)
      end
    end
  end
end
