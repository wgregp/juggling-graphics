var getConfig = require('hjs-webpack')
var files = require('./src/files.js')

module.exports = getConfig({
  in: 'src/juggling-graphics.coffee',
  out: 'build',
  clearBeforeBuild: '!(juggling-graphics.png|favicon.ico)',

  package: { name: 'juggling-graphics', version: '0.1.0' },
  html: function (context) {
    var config = {
        'title': 'juggling•graphics ✾ a siteswap illustrator',
        'publicPath': '/'
    }
    return {
      'index.html': files.index(context, config),
      'cache.manifest': files.manifest(context),
      '.htaccess': files.htaccess(context)
    }
  }
})
