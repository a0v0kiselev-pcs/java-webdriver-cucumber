
var reporter = require('cucumber-html-reporter');

var options = {
        theme: 'bootstrap',
        jsonFile: 'target/cucumber-report.json',
        output: 'target/cucumber-report.html',
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true
        /*metadata: {
            "App Version": "0.0.0",
            "Test Environment": "STAGING",
            "Browser": "Some Chrome",
            "Platform": "Coffee machine",
            "Parallel": "Scenarios",
            "Executed": "Remote"
        }*/
    };

    reporter.generate(options);


    //more info on `metadata` is available in `options` section below.

    //to generate consodilated report from multi-cucumber JSON files, please use `jsonDir` option instead of `jsonFile`. More info is available in `options` section below.
