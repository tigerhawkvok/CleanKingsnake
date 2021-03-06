#spawn = require('child_process').spawn
#require("load-grunt-tasks")(grunt)

module.exports = (grunt) ->
  # Gruntfile
  # https://github.com/sindresorhus/grunt-shell
  grunt.loadNpmTasks("grunt-shell")
  # https://www.npmjs.com/package/grunt-contrib-coffee
  grunt.loadNpmTasks("grunt-contrib-coffee")
  # https://github.com/gruntjs/grunt-contrib-watch
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    shell:
      options:
        stderr: false
      bam:
        command: "cake bam"
      min:
        command: "cake min"
      pack:
        command: ["cd \"C:\\Program Files (x86)\\Google\\Chrome\\Application\" & chrome.exe --pack-extension=C:\\Users\\Philip\\Dropbox\\GitHub\\CleanKingsnake\\cleankingsnake --pack-extension-key=C:\\Users\\Philip\\Dropbox\\GitHub\\CleanKingsnake\\key.pem"].join(" & ")
      compress:
        command: ["rm cleankingsnake.zip","7za a -mx9 -tzip -y -ssw cleankingsnake.zip cleankingsnake/*"].join("&&")
    coffee:
      compile:
        options:
          bare: true
          join: true
          sourceMapDir: "coffee/maps"
          sourceMap: true
        files:
          "cleankingsnake/c.js":"coffee/*.coffee"
    watch:
      scripts:
        files: ["coffee/*.coffee"]
        tasks: ["coffee:compile","shell:min"]
  # Now the tasks
  grunt.registerTask("default",["watch"])
  grunt.registerTask("compile","Compile coffeescript",["coffee:compile","shell:min"])
  grunt.registerTask("pack","Pack for release",["shell:pack"])
  grunt.registerTask("compress","Compress for upload",["shell:compress"])
  grunt.registerTask "build","Compile, update, and compress", ->
    grunt.task.run("compile","compress","pack")
