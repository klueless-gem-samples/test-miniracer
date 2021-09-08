# frozen_string_literal: true
require 'net/http'

RSpec.describe "SimpleJs" do
  let(:ctx) { MiniRacer::Context.new }
  let(:data) { { "first_name" => 'David', "last_name" => 'Cruwys' } }

  def my_name()
    'David'
  end

  context 'simple javascript expressions' do
    it 'setup lambda and run' do
      ctx.eval 'var addAandB = (a, b) => a+b;'
      # puts ctx.eval 'addAandB(20,22)'
      expect(ctx.eval 'addAandB(20,22)').to eq(42)
    end

    it 'run some ruby code inside of javascript' do
      ctx.attach("math.wrap_my_name", proc { my_name })
      # puts ctx.eval 'math.wrap_my_name()'

      # ctx.eval 'var addAandB = (a, b) => a+b;'
      # puts ctx.eval 'addAandB(20,22)'
      expect(ctx.eval 'math.wrap_my_name()').to eq('David')
    end

    it 'run some ruby data inside javascript' do
      ctx.attach("mydata", proc { data })
      puts ctx.eval 'mydata()'

      # ctx.eval 'var addAandB = (a, b) => a+b;'
      # puts ctx.eval 'addAandB(20,22)'
      expect(ctx.eval 'mydata()').to eq(data)
      
    end

    context 'load js from cdn' do
      let(:uri) { URI("https://cdnjs.cloudflare.com/ajax/libs/classnames/2.3.1/index.min.js") }
      let(:js) { Net::HTTP.get(uri) }

      it 'print content' do
        # puts js

        ctx.eval('window = {};')
        ctx.eval('window.classNames = ["Davd"];')
        ctx.eval(js)
        # ctx.eval("var classNames = require('classnames')");
# classNames('foo', 'bar'); // => 'foo bar'
      end

    end

#     context = MiniRacer::Context.new
# context.attach("array_and_hash", proc{{a: 1, b: [1, {a: 1}]}})
# puts context.eval 'array_and_hash()'

#     context = MiniRacer::Context.new

    # it 'grab javascript process version' do
    #   context = MiniRacer::Context.new
    #   puts context.eval 'process.versions'
    # end
  end

end


