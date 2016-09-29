'use strict';

exports.compose = compose;
exports.constant = constant;
exports.curry = curry;
exports.identity = identity;
exports.map = curry(map);

function compose(...fn) {
  const quantity = fn.length;
  return composition;

  function composition() {
    var index = quantity - 1;
    var result = quantity
      ? fn[index].apply(this, arguments)
      : arguments[0];

    if (index < 1) return result;
    while (index--) result = fn[index].call(this, result);
    return result;
  }
}

// constant :: a -> (_ -> a)
function constant(a) {
  return constantly;

  function constantly() {
    return a;
  }
}

function curry(f) {
  const arity = f.length;
  return curried;

  function curried(...args) {
    if (args.length >= arity) {
      return f.apply(this, args);
    }

    return curried.bind(this, ...args);
  }
}

// identity :: a -> a
function identity(a) {
  return a;
}

// map :: (a -> b) -> [a] -> [b]
function map(f, c) {
  const nC = Array(c.length);
  for (var i = c.length; i--;) nC[i] = f(c[i]);
  return nC;
}
