# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe EasyCaptcha::Espeak do
  context 'check default values' do
    subject { EasyCaptcha::Espeak.new }

    it(:amplitude) { (80..120).should include(subject.amplitude) }
    it(:pitch) { (30..70).should include(subject.pitch) }
    it(:gap) { should eq 80 }
    it(:voice) { should be_nil }
  end

  context 'check config: voices' do
    let(:voices) { ['german', 'german+m1'] }
    subject do
      EasyCaptcha::Espeak.new do |config|
        config.voice = voices
      end
    end
    it { voices.should include(subject.voice) }
  end
end
