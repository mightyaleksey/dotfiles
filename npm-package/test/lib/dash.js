'use strict';

const { constant, curry, map } = require('../../lib/dash');
const test = require('tape');

test('constant', t => {
  t.equal(constant(5)(), 5);
  t.end();
});

test('curry', t => {
  const add = curry((a, b, c = 0) => a + b + c);
  t.equal(add(1)(2), 3);
  t.equal(add(1, 2), 3);
  t.equal(add(1)()(2), 3);
  t.equal(add()(1)(2), 3);
  t.equal(add(1, 2, 3), 6);
  t.equal(add(1)(2, 3), 6);
  t.end();
});

test('map', t => {
  const inc = a => a + 1;
  t.deepEqual(map(inc, [1, 2, 3]), [2, 3, 4]);
  t.end();
});
