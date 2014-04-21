require 'open3'

module Pgxn
  def self.version
    # This comes out of stderr, apparently.
    pgxn_exec("--version")[2].gets.strip
  end

  def self.install(extension_name)
    si, so, se = pgxn_exec("install #{extension_name}")

    while s = so.gets
      puts s
    end
  end

  def self.pgxn_exec(cmd)
    si, so, se = Open3.popen3 "PYTHONPATH='#{pgxn_path}' #{pgxn_bin_path}/pgxn #{cmd}"
  end

  private
  def self.pgxn_path
    File.join(File.dirname(__FILE__), '../vendor/pgxnclient')
  end

  def self.pgxn_bin_path
    File.join(pgxn_path, 'bin')
  end
end
