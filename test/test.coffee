should = require 'should'
{EventEmitter} = require 'events'
weakInherit = require '../'

Error.stackTraceLimit = Infinity

class Foo
  constructor: (@b)->
  bar:-> 1234
  qux:-> 'hello'
  qix:(@a)-> 42 + @a + @b

it 'should inherit on a function', ->
  fn = (str)-> "test #{str}"
  generator = weakInherit Foo

  obj = generator fn, 10

  (should fn 'hi').equal 'test hi'
  (should obj 'hi').equal 'test hi'
  obj.b.should.equal 10
  (should obj.bar()).equal 1234
  (should obj.qux()).equal 'hello'
  (should obj.qix 20).equal 72
  obj.a.should.equal 20

it 'should work with EventEmitter', (done)->
  fn = (str)-> "test #{str}"
  generator = weakInherit EventEmitter

  obj = generator fn

  (should fn 'hi').equal 'test hi'
  (should obj 'hi').equal 'test hi'
  (should obj.on).be.ok()
  (should obj.emit).be.ok()
  obj.on 'test', (message)->
    message.should.equal 'hello!'
    done()
  obj.emit 'test', 'hello!'
