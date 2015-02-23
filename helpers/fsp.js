'use strict';

var fs = require('fs');
var through = require('through2');

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
 * @param  {string}   srcpath
 * @param  {string}   dstpath
 */
exports.copy = function (srcpath, dstpath) {
  var readable = fs.createReadStream(srcpath);
  var writable = fs.createWriteStream(dstpath);

  return new Promise(function (resolve, reject) {
    readable.once('error', reject);
    writable.once('error', reject);

    writable.once('finish', function () {
      resolve(dstpath);
    });

    readable
      .pipe(writable);
  });
}

/**
 * @return {string}
 */
exports.homedir = function () {
  return process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE;
};

/**
 * @param  {string}   srcpath
 * @param  {string}   dstpath
 * @param  {function} fn
 */
exports.transform = function (srcpath, dstpath, fn) {
  var readable = fs.createReadStream(srcpath);
  var transform = through.obj(fn);
  var writable = fs.createWriteStream(dstpath);

  return new Promise(function (resolve, reject) {
    readable.once('error', reject);
    transform.once('error', reject);
    writable.once('error', reject);

    writable.once('finish', function () {
      resolve(dstpath);
    });

    readable
      .pipe(transform)
      .pipe(writable);
  });
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
