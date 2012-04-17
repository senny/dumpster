# -*- coding: utf-8 -*-
require 'dumpster'

describe Dumpster do

  let(:model) { stub }

  context 'CSV' do
    it '#csv_writer erstellt einen CSV-Writer für das Model' do
      writer = described_class.csv_writer(model)
      writer.should be_kind_of(Dumpster::CSV::Writer)
    end

    it '#csv_writer kann einen Windows-spezifischen Writer erstellen' do
      writer = described_class.csv_writer(model, :type => :windows)
      writer.should be_kind_of(Dumpster::CSV::WindowsWriter)
    end
  end

  context 'Excel' do
    it '#excel_writer erstellt einen Excel-Writer für das Model' do
      writer = described_class.excel_writer(model)
      writer.should be_kind_of(Dumpster::Excel::Writer)
    end
  end

end
