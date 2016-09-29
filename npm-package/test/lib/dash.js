'use strict';

const {
  compose,
  constant,
  curry,
  identity,
  map,
} = require('../../lib/dash');
const test = require('tape');

const add = curry((a, b, c = 0) => a + b + c);
const inc = add(1);

test.only('compose', t => {
  t.equal(compose()(5), 5);
  t.equal(compose(add)(5, 1), 6);
  t.equal(compose(identity)(5), 5);
  t.equal(compose(identity, add(1))(5), 6);
  t.equal(compose(add(1), identity)(5), 6);
  t.end();
});

test('constant', t => {
  t.equal(constant(5)(), 5);
  t.end();
});

test('curry', t => {
  t.equal(add(1)(2), 3);
  t.equal(add(1, 2), 3);
  t.equal(add(1)()(2), 3);
  t.equal(add()(1)(2), 3);
  t.equal(add(1, 2, 3), 6);
  t.equal(add(1)(2, 3), 6);
  t.end();
});

test('map', t => {
  t.deepEqual(map(inc, [1, 2, 3]), [2, 3, 4]);
  t.end();
});
