class ZipCode
  def initialize
    file_to_zip_code_lookup = File.join(Rails.root, 'config', 'initializers', 'zip_code_lookup.yml')
    @zip_code_lookup = YAML.load_file(file_to_zip_code_lookup)
  end

  def find zip_code
    @zip_code_lookup[zip_code.to_s.rjust(5, '0')]
  end

  def add zip_code, options = {}
    false if options["city"].blank?      || options["latitude"].blank? ||
             options["longitude"].blank? || options["county"].blank?

    @zip_code_lookup[zip_code] = options
  end

  def to_yaml
    File.open(File.join(Rails.root, "zip_code_lookup.yml"), "w") do |f|
      f.write(@zip_code_lookup.to_yaml)
    end

    true
  end
end

ZIP_CODE = ZipCode.new
