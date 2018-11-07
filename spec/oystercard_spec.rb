require 'oystercard'

describe Oystercard do
  it 'should have a balance' do
    expect(subject.balance).to eq 0
  end
  describe 'a group of tests that require a top_up' do
    before do
      subject.top_up(50)
    end
    describe '#top_up' do
      it 'should be to recieve top up from user' do
        expect(subject.balance).to eq 50
      end
    end
    describe '#deduct' do
      it 'should deduct an amount from the balance' do
        subject.deduct(10)
        expect(subject.balance).to eq 40
      end
    end
  end
  it 'should have a maximum balance of £90' do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
    message = "The maximum balance is £#{Oystercard::MAXIMUM_BALANCE}"
    expect { subject.top_up(1) }.to raise_error(message)
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'when touched in changes in_transit to true' do
    subject.touch_in
    expect(subject).to be_in_journey
  end

 it 'when touched out it changes in_transit to false' do
   subject.touch_in
   subject.touch_out
   expect(subject).not_to be_in_journey
 end
end
