#!/usr/bin/env node
'use strict';

var program = require('commander');
var pkg = require('../package');

program
  .version(pkg.version)
  .option('-u, --user <name>', 'User\'s name')
  .option('-m, --mail <email>', 'User\'s email')
  .parse(process.argv);

var user = program.user || pkg.author.name;
var mail = program.mail || pkg.author.email;

var core = require('../index');

core.mkdir()
  .then(core.copy)
  .then(core.link)
  .catch(console.error);
