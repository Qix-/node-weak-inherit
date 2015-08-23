# node-weak-inherit [![Travis-CI.org Build Status](https://img.shields.io/travis/Qix-/node-weak-inherit.svg?style=flat-square)](https://travis-ci.org/Qix-/node-weak-inherit) [![Coveralls.io Coverage Rating](https://img.shields.io/coveralls/Qix-/node-weak-inherit.svg?style=flat-square)](https://coveralls.io/r/Qix-/node-weak-inherit)
> Weakly inherit a class/function's prototype on any object

This point of this module is to allow the extension of a class and its method
on top of objects that are not necessarily classes themselves.

This is useful for API builders in particular which need to "extend" a class
on to a function that is still callable itself.

## Example
```javascript
var weakInherit = require('weak-inherit');
var EventEmitter = require('events').EventEmitter;

var fn = function (name) {
	console.log('Hello,', name);
};

// anything we pass to `generator` will extend EventEmitter
var generator = weakInherit(EventEmitter);

var obj = generator(fn);

fn('Qix'); //-> Hello, Qix

fn.on('test', function () {
	console.log('Hi!');
});

fn.emit('test'); //-> Hi!
```

## License
Licensed under the [MIT License](http://opensource.org/licenses/MIT).
You can find a copy of it in [LICENSE](LICENSE).
