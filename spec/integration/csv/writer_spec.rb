# -*- coding: utf-8 -*-
require 'integration/spec_helper'

describe Dumpster::CSV::Writer do

  let(:data) { [['col1-row1', 'col2-row1'], ['col1-row2', 'col2-row2']] }
  let(:model) { Dumpster::Model::Generic.new(data) }
  subject { Dumpster::CSV::Writer.new(model) }

  it '#write_to schreibt die CSV Daten auf ein IO Objekt' do
    io = StringIO.new
    subject.write_to(io)

    io.rewind
    io.readlines.should == ["col1-row1,col2-row1\n", "col1-row2,col2-row2\n"]
  end

  it '#write_to_string gibt die CSV-Daten als String zurück' do
    subject.write_to_string.should == "col1-row1,col2-row1\ncol1-row2,col2-row2\n"
  end

  it '#write_to_file schreibt die CSV Daten in eine Datei' do
    output_path = File.join(File.dirname(__FILE__), 'output', 'example.csv')

    FileUtils.rm_f(output_path)
    subject.write_to_file(output_path)

    File.readlines(output_path).should == ["col1-row1,col2-row1\n", "col1-row2,col2-row2\n"]
  end

end

describe Dumpster::CSV::WindowsWriter do

  let(:data) { [['col1-row1', 'col2-row1'], ['col1-row2', 'col2-row2']] }
  let(:model) { Dumpster::Model::Generic.new(data) }
  subject { Dumpster::CSV::WindowsWriter.new(model) }

  it '#write_to schreibt die CSV Daten auf ein IO Objekt' do
    io = StringIO.new
    subject.write_to(io)

    io.rewind
    io.readlines.should == ["col1-row1;col2-row1\n", "col1-row2;col2-row2\n"]
  end

end
