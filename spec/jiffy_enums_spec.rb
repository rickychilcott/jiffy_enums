require 'spec_helper'

describe JiffyEnums do
  it {should be_a_kind_of Module}
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

  def say
    "no go"
  end
  
  def we_all_say
    'something'
  end
end

describe ExampleEnums do
  subject { ExampleEnums }
  describe "the enums (accessed as class methods)" do
    it "has correct ordinal values" do
      subject.Yes.ordinal.should == 1
      subject.No.ordinal.should == 2
      subject.Maybe.ordinal.should == 3
    end

    it "has correct key values" do
      subject.Yes.key.should == :Yes
      subject.No.key.should == :No
      subject.Maybe.key.should == :Maybe
    end

    it "allows function calls to defined functions in the enum" do
      subject.Yes.say.should == 'I say hello'
      subject.No.say.should == 'you say good bye'
    end

    it "has access to globally defined functions" do
      subject.Maybe.say.should == 'no go'
      subject.Maybe.we_all_say.should == 'something'
      subject.Yes.we_all_say.should == 'something'
      subject.No.we_all_say.should == 'something'
    end  
  end

  describe "enumerable methods" do
    it "selects" do
      result = subject.select {|enum| enum.is_cool }
      result.should match_array([ExampleEnums.Yes])
    end
  end
end
