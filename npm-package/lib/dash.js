'use strict';

exports.constant = constant;
exports.curry = curry;
exports.identity = identity;
exports.map = curry(map);

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
