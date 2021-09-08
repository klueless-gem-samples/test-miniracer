# frozen_string_literal: true

RSpec.describe Test::Miniracer do
  it 'has a version number' do
    expect(Test::Miniracer::VERSION).not_to be nil
  end

  it 'has a standard error' do
    expect { raise Test::Miniracer::Error, 'some message' }
      .to raise_error('some message')
  end
end
