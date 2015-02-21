#!/usr/bin/env node
'use strict';

var fs = require('fs');
var path = require('path');

var configPath = path.join(__dirname, 'configs');
var destPath = path.join(__dirname, 'dest');

/**
 * Копирование и линковка файлов
 */
Promise.all([mkdir(destPath), readdir(configPath)])
  .then(splat(function (dest, files) {
    return Promise.all(files.map(function (file) {
      return copy(file, path.join(dest, path.basename(file)));
    }));
  }))
  .then(function (files) {
    return Promise.all(files.map(symlink));
  })
  .catch(console.error);

/**
 * Путь к домашней директории пользователя
 * @return {string}
 */
function getHomedir() {
  return process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE;
}

/**
 * @param  {function} fn
 * @return {function}
 */
function splat(fn) {
  return function (args) {
    return fn.apply(null, args);
  }
}

/**
 * Копирует файл
 * @todo  Учитывать права исходного файла
 * @param  {string}  source
 * @param  {string}  target
 * @return {promise}
 */
function copy(source, target) {
  var readable = fs.createReadStream(source);
  var writable = fs.createWriteStream(target);

  return new Promise(function (resolve, reject) {
    writable.once('error', reject);

    writable.once('finish', function () {
      resolve(target);
    });

    readable.pipe(writable);
  });
}

/**
 * Аналог mkdir -p
 * @param  {string}  dirpath
 * @param  {string}  mode
 * @return {promise}
 */
function mkdir(dirpath, mode) {
  return new Promise(function (resolve, reject) {
    fs.mkdir(dirpath, mode || '0777', function (err) {
      if (err && err.code !== 'EEXIST') {
        return reject(err);
      }

      resolve(dirpath);
    });
  });
}

/**
 * Возвращает список файлов директории
 * @param  {string}  dirpath
 * @return {promise}
 */
function readdir(dirpath) {
  return new Promise(function (resolve, reject) {
    fs.readdir(dirpath, function (err, files) {
      if (err) {
        return reject(err);
      }

      resolve(files.map(function (file) {
        return path.join(dirpath, file);
      }));
    });
  });
}

/**
 * Линкует указанный файл в домашнюю директорию пользователя
 * @param  {string}  filepath
 * @return {promise}
 */
function symlink(filepath) {
  return new Promise(function (resolve, reject) {
    var dest = path.join(getHomedir(), path.basename(filepath));

    fs.symlink(filepath, dest, function (resolve, reject) {
      if (err) {
        return reject(err);
      }

      resolve(filepath);
    });
  });
}
