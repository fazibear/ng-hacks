module.exports = (grunt) ->
  
  coffee_files = 'coffee/*.coffee'
  slim_files   = 'templates/*.slim'
  
  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
        files:
          'public/app.js': [ coffee_files ]
    slim:
      dist:
        options:
          pretty: true
        files: [
          expand: true
          cwd: slim_files.split('/')[0]
          src: [ slim_files.split('/')[1] ]
          dest: 'public/'
          ext: '.html'
        ]

    watch:
      coffee:
        files: coffee_files
        tasks: [ 'coffee' ]
      slm:
        files: slim_files
        tasks: [ 'slim' ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-slim'

  grunt.registerTask 'default', ['coffee', 'slim']
