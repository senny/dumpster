# -*- coding: utf-8 -*-
require 'integration/spec_helper'

describe Dumpster::Excel::Writer do

  let(:data) { [['col1-row1', 'col2-row1'], ['col1-row2', 'col2-row2']] }
  let(:model) { Dumpster::Model::Generic.new(data) }
  subject { described_class.new(model) }

  it '#write_to_string gibt die Daten als String zurück' do
    excel = subject.write_to_string
    excel.should_not be_nil
    excel.should_not == ''
  end

  it '#write_to_file schreibt die Daten in eine Excel Datei' do
    output_path = File.join(File.dirname(__FILE__), 'output', 'example.xlsx')
    FileUtils.rm_f(output_path)

    subject.write_to_file(output_path)

    File.exists?(output_path).should be_true
  end

  it 'enable auto filtering on the table' do
    output_path = File.join(File.dirname(__FILE__), 'output', 'auto_filter.xlsx')
    FileUtils.rm_f(output_path)

    subject.extend Dumpster::Excel::AutoFilter
    subject.write_to_file(output_path)

    File.exists?(output_path).should be_true
  end
end
