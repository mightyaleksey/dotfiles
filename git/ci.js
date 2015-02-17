#!/usr/bin/env node

var cp = require('child_process');

function run(command) {
  try {
    return cp.execSync(command).toString();
  } catch(e) {
    process.stderr.write(e.stderr);
    process.stdout.write(e.stdout);
    process.exit(e.status);
  }
}

var branch = run('git symbolic-ref --short HEAD');
var ticket = branch.replace(/^([\w\d-]+).*/i, '$1').trim();
var commit = process.argv.slice(2).join(' ').trim();

var message = ticket && ticket !== 'master'
  ? ticket + ' ' + commit
  : commit;

run('git commit -m \'' + message + '\'');
