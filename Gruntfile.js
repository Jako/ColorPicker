module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        modx: grunt.file.readJSON('_build/config.json'),
        banner: '/*!\n' +
            ' * <%= modx.name %> - <%= modx.description %>\n' +
            ' * Version: <%= modx.version %>\n' +
            ' * Build date: <%= grunt.template.today("yyyy-mm-dd") %>\n' +
            ' */\n',
        usebanner: {
            css: {
                options: {
                    position: 'bottom',
                    banner: '<%= banner %>'
                },
                files: {
                    src: [
                        'assets/components/colorpicker/css/mgr/colorpicker.min.css'
                    ]
                }
            },
            js: {
                options: {
                    position: 'top',
                    banner: '<%= banner %>'
                },
                files: {
                    src: [
                        'assets/components/colorpicker/js/mgr/colorpicker.min.js'
                    ]
                }
            }
        },
        uglify: {
            mgr: {
                src: [
                    'source/js/mgr/colorpicker.js',
                    'source/js/mgr/colorpickerfield.js',
                    'source/js/mgr/colorpickertv.js'
                ],
                dest: 'assets/components/colorpicker/js/mgr/colorpicker.min.js'
            }
        },
        sass: {
            options: {
                implementation: require('node-sass'),
                outputStyle: 'expanded',
                sourcemap: false
            },
            mgr: {
                files: {
                    'source/css/mgr/colorpicker.css': 'source/sass/mgr/colorpicker.scss'
                }
            }
        },
        postcss: {
            options: {
                processors: [
                    require('pixrem')(),
                    require('autoprefixer')()
                ]
            },
            mgr: {
                src: [
                    'source/css/mgr/colorpicker.css'
                ]
            }
        },
        cssmin: {
            mgr: {
                src: [
                    'source/css/mgr/colorpicker.css'
                ],
                dest: 'assets/components/colorpicker/css/mgr/colorpicker.min.css'
            }
        },
        imagemin: {
            png: {
                options: {
                    optimizationLevel: 7
                },
                files: [
                    {
                        expand: true,
                        cwd: 'source/images/',
                        src: ['**/*.png'],
                        dest: 'assets/components/colorpicker/images/',
                        ext: '.png'
                    }
                ]
            },
            gif: {
                files: [
                    {
                        expand: true,
                        cwd: 'source/images/',
                        src: ['**/*.gif'],
                        dest: 'assets/components/colorpicker/images/',
                        ext: '.gif'
                    }
                ]
            }
        },
        watch: {
            js: {
                files: [
                    'source/**/*.js'
                ],
                tasks: ['uglify', 'usebanner:js']
            },
            css: {
                files: [
                    'source/**/*.scss'
                ],
                tasks: ['sass', 'postcss', 'cssmin', 'usebanner:css']
            },
            config: {
                files: [
                    '_build/config.json'
                ],
                tasks: ['default']
            }
        },
        bump: {
            copyright: {
                files: [{
                    src: 'core/components/colorpicker/model/colorpicker/colorpicker.class.php',
                    dest: 'core/components/colorpicker/model/colorpicker/colorpicker.class.php'
                }],
                options: {
                    replacements: [{
                        pattern: /Copyright 2017(-\d{4})? by/g,
                        replacement: 'Copyright ' + (new Date().getFullYear() > 2017 ? '2017-' : '') + new Date().getFullYear() + ' by'
                    }]
                }
            },
            version: {
                files: [{
                    src: 'core/components/colorpicker/model/colorpicker/colorpicker.class.php',
                    dest: 'core/components/colorpicker/model/colorpicker/colorpicker.class.php'
                }],
                options: {
                    replacements: [{
                        pattern: /version = '\d+.\d+.\d+[-a-z0-9]*'/ig,
                        replacement: 'version = \'' + '<%= modx.version %>' + '\''
                    }]
                }
            },
            inputoptions: {
                files: [{
                    src: 'core/components/colorpicker/elements/tv/input/tpl/colorpicker.options.tpl',
                    dest: 'core/components/colorpicker/elements/tv/input/tpl/colorpicker.options.tpl'
                }],
                options: {
                    replacements: [{
                        pattern: /&copy; 2017(-\d{4})?/g,
                        replacement: '&copy; ' + (new Date().getFullYear() > 2017 ? '2017-' : '') + new Date().getFullYear()
                    }]
                }
            },
            outputoptions: {
                files: [{
                    src: 'core/components/colorpicker/elements/tv/output/tpl/colorpicker.options.tpl',
                    dest: 'core/components/colorpicker/elements/tv/output/tpl/colorpicker.options.tpl'
                }],
                options: {
                    replacements: [{
                        pattern: /&copy; 2017(-\d{4})?/g,
                        replacement: '&copy; ' + (new Date().getFullYear() > 2017 ? '2017-' : '') + new Date().getFullYear()
                    }]
                }
            },
            docs: {
                files: [{
                    src: 'mkdocs.yml',
                    dest: 'mkdocs.yml'
                }],
                options: {
                    replacements: [{
                        pattern: /&copy; 2017(-\d{4})?/g,
                        replacement: '&copy; ' + (new Date().getFullYear() > 2017 ? '2017-' : '') + new Date().getFullYear()
                    }]
                }
            }
        }
    });

    //load the packages
    grunt.loadNpmTasks('@lodder/grunt-postcss');
    grunt.loadNpmTasks('grunt-banner');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-imagemin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-sass');
    grunt.loadNpmTasks('grunt-string-replace');
    grunt.renameTask('string-replace', 'bump');

    //register the task
    grunt.registerTask('default', ['bump', 'uglify', 'sass', 'postcss', 'cssmin', 'usebanner']);
};
