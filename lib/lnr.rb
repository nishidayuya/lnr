# frozen_string_literal: true

require "pathname"

module Lnr
  autoload :VERSION, "lnr/version"

  autoload :Cli, "lnr/cli"

  class << self
    def run(source_root_path, destination_root_path)
      source_root_path.find do |source_path|
        relative_path = source_path.relative_path_from(source_root_path)
        destination_path = destination_root_path / relative_path
        next if destination_path.exist?

        case source_path.ftype.to_sym
        when :file
          destination_path.make_link(source_path)
        when :directory
          destination_path.mkpath
          destination_path.utime(source_path.atime, source_path.mtime)
        else
          raise NotImplementedError, "not supported file type: type=#{source_path.ftype} path=#{source_path}"
        end
      end
    end
  end
end
