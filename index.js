'use strict';

module.exports = function weakInherit(fn) {
	return function (obj) {
		fn.apply(obj, [].slice.call(arguments, 1));

		for (var k in fn.prototype) {
			if (fn.prototype.hasOwnProperty(k)) {
				obj[k] = fn.prototype[k];
			}
		}

		return obj;
	};
};
