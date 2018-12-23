require './2018/day11/day11'
RSpec.describe Day11 do
  describe '.search_max_pos' do
    subject { described_class.search_max_pos(serial_number, square_size) }

    context 'case 1' do
      let(:serial_number) { 18 }
      let(:square_size) { 3 }

      it { is_expected.to eq(["33,45", 29]) }
    end

    context 'case 2' do
      let(:serial_number) { 42 }
      let(:square_size) { 3 }

      it { is_expected.to eq(["21,61", 30]) }
    end

    context 'case 3' do
      let(:serial_number) { 18 }
      let(:square_size) { 16 }

      it { is_expected.to eq(["90,269", 113]) }
    end

    context 'case 4' do
      let(:serial_number) { 42 }
      let(:square_size) { 12 }

      it { is_expected.to eq(["232,251", 119] ) }
    end
  end
end