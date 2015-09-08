# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe EasyCaptcha::Espeak do
  context 'check default values' do
    subject { EasyCaptcha::Espeak.new }

    its(:amplitude) { (80..120).should include(subject.amplitude) }
    its(:pitch) { (30..70).should include(subject.pitch) }
    its(:gap) { should eq 80 }
    its(:voice) { should be_nil }
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
