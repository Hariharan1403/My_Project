// parsePR.js
const fs = require('fs');

const prBody = fs.readFileSync('./pr_body.txt', 'utf8');

let testNames = [];

// Match something like: # TESTS\nBankControllerTest, AnotherTest
const match = prBody.match(/# TESTS\s*([\s\S]*?)(\n|$)/i);
if (match && match[1]) {
  testNames = match[1]
    .split(',')
    .map(name => name.trim())
    .filter(name => name.length > 0);
}
if (testNames.length > 0) {
  fs.writeFileSync('testsToRun.txt', testNames.join(','));
} else {
  fs.writeFileSync('testsToRun.txt', 'all');
}
