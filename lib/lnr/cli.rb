require "lnr"

module Lnr::Cli
  class << self
    USAGE = <<~EOS
      #{File.basename(Process.argv0)} source_directory destination_directory
    EOS

    def run(argv)
      source_root, destination_root = *argv
      if !destination_root
        $stderr.puts(USAGE)
        exit(1)
      end

      source_root_path = Pathname(source_root).expand_path
      destination_root_path = Pathname(destination_root).expand_path
      Lnr.run(source_root_path, destination_root_path)
    end
  end
end
