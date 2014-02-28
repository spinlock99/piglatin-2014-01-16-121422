require 'spec_helper'
require 'piglatin'

describe PigLatin do
  subject(:pig_latin) { PigLatin.new(base_string) }
  let(:base_string) { "hello world" }

  describe "#new" do
    specify { expect { PigLatin.new }.to_not raise_error }
    specify { expect { PigLatin.new "hello world" }.to_not raise_error }
  end

  describe ".phrase" do
    it { pl = PigLatin.new(base_string); pl.should eq(base_string) }
    it { pl = pig_latin; pl = "hi"; pl.should eq("hi") }
  end

  describe ".translate" do
    context "words that start with a vowel" do
      context "append 'ay' to the word if it ends in a consonant" do
        let(:base_string) { "ask" }
        its(:translate) { should eq("askay") }
      end
      context "append 'yay' to the word if it ends with a vowel" do
        let(:base_string) { "apple" }
        its(:translate) { should eq("appleyay") }
      end
      context "append 'nay' to the word if it ends with 'y'" do
        let(:base_string) { "any" }
        its(:translate) { should eq("anynay") }
      end
    end
    context "words that start with a single consonant" do
      context "move the consonant to the end of the word and append 'ay'" do
        context "hello" do
          let(:base_string) { "hello" }
          its(:translate) { should eq("ellohay") }
        end
        context "world" do
          let(:base_string) { "world" }
          its(:translate) { should eq("orldway") }
        end
      end
    end
    context "words that start with multiple consonants" do
      context "known" do
        let(:base_string) { "knonw" }
        its(:translate) { should eq("onwknay") }
      end
      context "special" do
        let(:base_string) { "special" }
        its(:translate) { should eq("ecialspay") }
      end
    end
    context "multiple words" do
      context "hello world" do
        let(:base_string) { "hello world" }
        its(:translate) { should eq("ellohay orldway") }
      end
      context "well-being" do
        let(:base_string) { "well-being" }
        its(:translate) { should eq("ellway-eingbay") }
      end
    end
    context "capital letters" do
      context "Bill" do
        let(:base_string) { "Bill" }
        its(:translate) { should eq("Illbay") }
      end
      context "Andrew" do
        let(:base_string) { "Andrew" }
        its(:translate) { should eq("Andreway") }
      end
    end
    context "punctuation marks" do
      context "fantastic!" do
        let(:base_string) { "fantastic!" }
        its(:translate) { should eq("antasticfay!") }
      end
      context "Three things: one, two, three." do
        let(:base_string) { "Three things: one, two, three." }
        its(:translate) { should eq("Eethray ingsthay: oneyay, otway, eethray.") }
      end
    end
  end
end
