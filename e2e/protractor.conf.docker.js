// Protractor configuration file, see link for more information
// https://github.com/angular/protractor/blob/master/lib/config.ts

const protractorConf = require('./protractor.conf.js');

exports.config = {
  ...protractorConf.config,
  directConnect: false,
  // CAREFUL: These endpoints must match the docker-compose.yml services names
  seleniumAddress: 'http://selenium-chrome-standalone:4444/wd/hub',
  baseUrl: 'http://app-serve:4200/',
};
