'use strict';

var _ = require('lodash');
var fs = require('./helpers/fsp');
var path = require('path');

var configs = path.join(__dirname, 'configs');
var links = path.join(__dirname, 'dest');
var patches = path.join(__dirname, 'patches');

exports.copy = function () {
  return fs.readdir(configs)
    .then(function (files) {
      return Promise.all(files.map(function (file) {
        var src = path.join(configs, file);
        var dst = path.join(links, path.basename(file));
        return fs.copy(src, dst);
      }));
    });
};

exports.link = function () {
  return fs.readdir(links)
    .then(function (files) {
      return Promise.all(files.map(function (file) {
        var src = path.join(links, file);
        var dst = path.join(fs.homedir(), path.basename(file));
        return fs.symlink(src, dst)
          .catch(function (err) {
            if (err.code !== 'EEXIST') {
              throw err;
            }

            return fs.unlink(dst)
              .then(function () {
                return fs.symlink(src, dst);
              });
          });
      }));
    });
};

exports.mkdir = function () {
  return fs.mkdir(links)
    .catch(function (err) {
      if (err.code !== 'EEXIST') {
        throw err;
      }

      return links;
    });
};

exports.patch = function () {};
