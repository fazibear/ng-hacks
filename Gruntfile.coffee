module.exports = (grunt) ->
  
  coffee_files = 'coffee/*.coffee'
  slm_files   = 'templates/*.slm'
  
  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
          rails: true
        files:
          'public/app.js': [ coffee_files ]
    
    slm:
       multiple_files:
         src: slm_files
         dest: 'public/'
    
    bower_concat:
      all:
        dest: 'public/deps.js'
        cssDest: 'public/deps.css'

    watch:
      coffee:
        files: coffee_files
        tasks: [ 'coffee' ]
      
      slm:
        files: slm_files
        tasks: [ 'slm' ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-slm'
  grunt.loadNpmTasks 'grunt-bower-concat'

  grunt.registerTask 'default', ['coffee', 'slm', 'bower_concat']
