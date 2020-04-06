const getYarnWorkspaces = require('get-yarn-workspaces');
const { override, babelInclude } = require('customize-cra');

console.log(getYarnWorkspaces());
module.exports = override(
  babelInclude(getYarnWorkspaces())
);
