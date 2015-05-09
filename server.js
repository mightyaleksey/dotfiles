'use strict';

var fs = require('fs');
var http = require('http');
var parse = require('url').parse;
var path = require('path');

function first(a) {
  return a[0];
}

function inverse(fn) {
  return function inverter(a) {
    return !fn(a);
  }
}

var mimeTypes = {
  '.json': 'application/json',
  '.js':   'application/javascript',
  '.gif':  'image/gif',
  '.jpeg': 'image/jpeg',
  '.png':  'image/png',
  '.svg':  'image/svg+xml',
  '.tiff': 'image/tiff',
  '.css':  'text/css',
  '.html': 'text/html',
  '.htm':  'text/html'
};

var args = process.argv.slice(2, 4);

var pathToStatic = first(args.filter(isNaN));

pathToStatic = pathToStatic
  ? path.resolve(pathToStatic)
  : process.cwd();

var port = parseInt(first(args.filter(inverse(isNaN)))) || 8000;

http.createServer(function (req, res) {
  var url = parse(req.url.replace(/\/$/, ''));
  var pathname = url.pathname;
  var realpath = path.join(pathToStatic, pathname);

  fs.stat(realpath, function (err, stats) {
    if (err || !stats.isFile()) {
      res.statusCode = 404;
      return res.end();
    }

    var extname = path.extname(realpath);
    if (extname in mimeTypes) {
      res.setHeader('content-type', mimeTypes[extname]);
    } else {
      res.setHeader('content-type', 'text/plain');
      res.setHeader('content-disposition', 'attachment; filename="' + path.basename(realpath) + '"');
    }

    fs.createReadStream(realpath).pipe(res);
  });
}).listen(port, function () {
  console.log('port %s; streaming from %s', port, pathToStatic);
});
