# -*- coding: utf-8 -*-
require 'unit/spec_helper'

require 'dumpster/model/generic'

describe Dumpster::Model::Generic do

  let(:data) { [['col1-row1', 'col2-row1'], ['col1-row2', 'col2-row2']] }
  subject { described_class.new(data) }

  it '#each iteriert über die Daten' do
    rows = []
    subject.each do |row|
      rows << row
    end
    rows.should == data
  end

end
