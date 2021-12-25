module RequestStubHelpers
  
  def api_fixture(fixture_name, file_extension = 'json')
    Pathname.new('./test/fixtures/').join("#{fixture_name}.#{file_extension}").read
  end

end
