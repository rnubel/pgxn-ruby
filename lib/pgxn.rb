require 'open3'

module Pgxn
  def self.version
    # This comes out of stderr, apparently.
    pgxn_exec("--version") do |stdin, stdout, stderr|
      return stderr.gets.strip
    end
  end

  def self.install(extension_name)
    pgxn_exec("install #{extension_name}") do |stdin, stdout, stderr|
      # TODO: Find a better way to do this. Maybe exec?
      while s = stdout.gets
        puts s
      end
    end
  end

  def self.pgxn_exec(cmd)
    yield Open3.popen3 "PYTHONPATH='#{pgxn_path}' #{pgxn_bin_path}/pgxn #{cmd}"
  end

  private
  def self.pgxn_path
    File.join(File.dirname(__FILE__), '../vendor/pgxnclient')
  end

  def self.pgxn_bin_path
    File.join(pgxn_path, 'bin')
  end
end
