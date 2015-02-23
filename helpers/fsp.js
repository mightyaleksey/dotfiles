'use strict';

var fs = require('fs');

/**
 * Оборачивает функцию в промис
 * @param  {function} fn
 * @param  {object}   ctx
 * @return {function}
 */
function promisify(fn, ctx) {
  return function () {
    var args = Array.prototype.slice.call(arguments, 0, fn.length - 1);

    return new Promise(function (resolve, reject) {
      args.push(function (err) {
        err ? reject(err) : resolve(arguments[1] || args[1]);
      });

      fn.apply(ctx, args);
    });
  };
}

/**
 * @param {string} path
 * @param {string} [mode]
 * @return {promise}
 */
exports.mkdir = promisify(fs.mkdir, fs);

/**
 * @param {string} path
 * @return {promise}
 */
exports.readdir = promisify(fs.readdir, fs);

/**
 * @param {string} srcpath
 * @param {string} dstpath
 * @param {string} [type]
 * @return {promise}
 */
exports.symlink = promisify(fs.symlink, fs);

/**
 * @param {string} path
 * @return {promise}
 */
exports.unlink = promisify(fs.unlink, fs);
