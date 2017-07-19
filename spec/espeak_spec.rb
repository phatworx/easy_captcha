# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe EasyCaptcha::Espeak do
  context 'check default values' do
    subject { EasyCaptcha::Espeak.new }

    describe '#amplitude' do
      subject { super().amplitude }
      it { (80..120).should include(subject.amplitude) }
    end

    describe '#pitch' do
      subject { super().pitch }
      it { (30..70).should include(subject.pitch) }
    end

    describe '#gap' do
      subject { super().gap }
      it { is_expected.to eq 80 }
    end

    describe '#voice' do
      subject { super().voice }
      it { is_expected.to be_nil }
    end
  end

  context 'check config: voices' do
    let(:voices) { ['german', 'german+m1'] }
    subject do
      EasyCaptcha::Espeak.new do |config|
        config.voice = voices
      end
    end
    it { expect(voices).to include(subject.voice) }
  end
end
