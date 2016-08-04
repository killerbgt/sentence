require 'spec_helper'

describe Sentence do
  it 'has a version number' do
    expect(Sentence::VERSION).not_to be nil
  end

  it 'raises an InvalidString exception when a non-string or empty string is provided' do
    expect {Sentence.reverse(5)}.to raise_error(Sentence::InvalidString)
    expect {Sentence.reverse([1,2,3])}.to raise_error(Sentence::InvalidString)
    expect {Sentence.reverse(true)}.to raise_error(Sentence::InvalidString)
    expect {Sentence.reverse("")}.to raise_error(Sentence::InvalidString)
    expect {Sentence.reverse("  ")}.to raise_error(Sentence::InvalidString)
    expect {Sentence.reverse("Single")}.not_to raise_error
    expect {Sentence.reverse("Multiple words in sentence")}.not_to raise_error
  end

  it 'returns reversed sentence when provided a non-empty string' do
    expect(Sentence.reverse("A")).to eq("A")
    expect(Sentence.reverse("  A")).to eq("A")
    expect(Sentence.reverse("A  ")).to eq("A")
    expect(Sentence.reverse("  A  ")).to eq("A")
    expect(Sentence.reverse("\tABC")).to eq("ABC")
    expect(Sentence.reverse("ABC\t")).to eq("ABC")
    expect(Sentence.reverse("\tABC\t")).to eq("ABC")
    expect(Sentence.reverse("Two Words")).to eq("Words Two")
    expect(Sentence.reverse("  Two  Words  ")).to eq("Words Two")
    expect(Sentence.reverse("the big black cat")).to eq("cat black big the")
  end
end
