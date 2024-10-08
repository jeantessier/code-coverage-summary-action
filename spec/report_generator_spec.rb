require './lib/report_generator'

describe ReportGenerator do
  subject(:generator) { described_class.new '' }

  let(:out) { spy('out') }
  let(:node) { double('node') }

  describe 'print_counter' do
    it 'shows expected stats' do
      # Given
      allow(node).to receive(:[]).with(:missed).and_return(1)
      allow(node).to receive(:[]).with(:covered).and_return(1)
      allow(node).to receive(:[]).with(:type).and_return('abc')

      # When
      generator.print_counter(out, node)

      # Then
      expect(out).to have_received(:puts).with('| | abc | 50% | 1 | 2 | _1_ |')
    end
  end

  describe 'print_section' do
    it 'spells out default package if name is empty' do
      # Given
      name = ''

      # and
      allow(node).to receive(:xpath).with('counter').and_return([])

      # When
      generator.print_section(out, name, node)

      # Then
      expect(out).to have_received(:puts).with('| **_default_** | | | | | |').ordered
      expect(out).to have_received(:puts).with('| | | | | | |').ordered
    end

    it 'includes package name in the table header' do
      # Given
      name = 'some.package.name'

      # and
      allow(node).to receive(:xpath).with('counter').and_return([])

      # When
      generator.print_section(out, name, node)

      # Then
      expect(out).to have_received(:puts).with("| **#{name}** | | | | | |").ordered
      expect(out).to have_received(:puts).with('| | | | | | |').ordered
    end

    it 'includes one row per package' do
      # Given
      name = 'some.package.name'

      # and
      counter1 = { type: 'abc', missed: 123, covered: 123 }
      counter2 = { type: 'def', missed: 456, covered: 789 }

      # and
      allow(node).to receive(:xpath).with('counter').and_return([counter1, counter2])

      # When
      generator.print_section(out, name, node)

      # Then
      expect(out).to have_received(:puts).with("| **#{name}** | | | | | |").ordered
      expect(out).to have_received(:puts).with('| | abc | 50% | 123 | 246 | _123_ |').ordered
      expect(out).to have_received(:puts).with('| | def | 63% | 789 | 1245 | _456_ |').ordered
      expect(out).to have_received(:puts).with('| | | | | | |').ordered
    end
  end
end
