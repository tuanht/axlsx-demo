require 'spec_helper'

describe 'Basic' do
  context 'with create' do
    it 'basic file' do
      writer = AxlsxDemo::ReportWriter.new
      writer.write
      writer.serialize 'example.xlsx'
    end
  end
end