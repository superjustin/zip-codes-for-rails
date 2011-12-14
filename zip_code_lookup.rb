class ZipCode
  def initialize
    file_to_zip_code_lookup = File.join(Rails.root, 'config', 'initializers', 'zip_code_lookup.yml')
    @zip_code_lookup = YAML.load_file(file_to_zip_code_lookup)
  end

  def find zip_code
    @zip_code_lookup[zip_code]
  end
end

ZIP_CODE = ZipCode.new
