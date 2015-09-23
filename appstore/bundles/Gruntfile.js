module.exports = function(grunt) {

  grunt.initConfig({
	elm: {
	  compile: {
		files: {
		  "js/BUNDLE683682163861286312.js": ["elm/BUNDLE683682163861286312.elm"]
		}
	  }
	},
	watch: {
	  elm: {
		files: ["elm/BUNDLE683682163861286312.elm"],
		tasks: ["elm"]
	  }
	},
	clean: ["elm/elm-stuff/build-artifacts"]
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-elm');

  grunt.registerTask('default', ['elm']);

};
