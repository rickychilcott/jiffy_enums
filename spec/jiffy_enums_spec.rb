require 'spec_helper'

describe JiffyEnums do
  it { should be_a_kind_of Module }
end

class ExampleEnums < JiffyEnum
  define :Yes do
    def say
      'I say hello'
    end

    def is_cool
      true
    end
  end

  define :No do
    def say
      'you say good bye'
    end

    def is_cool
      false
    end
  end

  define :Maybe do
    def is_cool
      nil
    end
  end

  define :Woot, 'Woot', 10 do
    def is_cool
      nil
    end
  end

  def say
    'no go'
  end
  
  def we_all_say
    'something'
  end
end

describe ExampleEnums do
  subject { ExampleEnums }
  describe 'the enums (accessed as class methods)' do
    it 'has correct ordinal values' do
      expect(subject.Yes.ordinal).to eq  1
      expect(subject.No.ordinal).to eq  2
      expect(subject.Maybe.ordinal).to eq  3
    end

    it 'has correct key values' do
      expect(subject.Yes.key).to eq  :Yes
      expect(subject.No.key).to eq  :No
      expect(subject.Maybe.key).to eq  :Maybe
    end

    it 'allows function calls to defined functions in the enum' do
      expect(subject.Yes.say).to eq  'I say hello'
      expect(subject.No.say).to eq  'you say good bye'
    end

    it 'has access to globally defined functions' do
      expect(subject.Maybe.say).to eq 'no go'
      expect(subject.Maybe.we_all_say).to eq 'something'
      expect(subject.Yes.we_all_say).to eq 'something'
      expect(subject.No.we_all_say).to eq 'something'
    end  
  end

  describe '#for_ordinal(10)' do
    it 'finds Woot' do
      expect(subject.for_ordinal(10).value).to eq 'Woot'
    end
  end

  describe 'enumerable methods' do
    it 'selects' do
      result = subject.select { |enum| enum.is_cool }
      expect(result).to match_array([ExampleEnums.Yes])
    end
  end
end
