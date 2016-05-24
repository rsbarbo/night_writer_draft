class FileReader

  def self.read(input_read)
    File.read(input_read).chomp
  end

end
