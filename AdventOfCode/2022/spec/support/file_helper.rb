# frozen_string_literal: true

require "tempfile"

module FileHelper
  def generate_file_with_contents(filename)
    file = Tempfile.new(filename)
    content = yield
    file.write(content)
    file.close
    file
  end
end
