module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        modx: grunt.file.readJSON('_build/config.json'),
        sshconfig: grunt.file.readJSON('/Users/jako/Documents/MODx/partout.json'),
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
                outputStyle: 'expanded',
                sourcemap: false
            },
            dist: {
                files: {
                    'source/css/mgr/colorpicker.css': 'source/sass/mgr/colorpicker.scss'
                }
            }
        },
        cssmin: {
            css: {
                src: [
                    'source/css/mgr/colorpicker.css'
                ],
                dest: 'assets/components/colorpicker/css/mgr/colorpicker.min.css'
            }
        },
        sftp: {
            css: {
                files: {
                    "./": [
                        'assets/components/colorpicker/css/mgr/colorpicker.min.css',
                        'source/css/mgr/colorpicker.css'
                    ]
                },
                options: {
                    path: '<%= sshconfig.hostpath %>develop/colorpicker/',
                    srcBasePath: 'develop/colorpicker/',
                    host: '<%= sshconfig.host %>',
                    username: '<%= sshconfig.username %>',
                    privateKey: '<%= sshconfig.privateKey %>',
                    passphrase: '<%= sshconfig.passphrase %>',
                    showProgress: true
                }
            },
            js: {
                files: {
                    "./": ['assets/components/colorpicker/js/mgr/colorpicker.min.js']
                },
                options: {
                    path: '<%= sshconfig.hostpath %>develop/colorpicker/',
                    srcBasePath: 'develop/colorpicker/',
                    host: '<%= sshconfig.host %>',
                    username: '<%= sshconfig.username %>',
                    privateKey: '<%= sshconfig.privateKey %>',
                    passphrase: '<%= sshconfig.passphrase %>',
                    showProgress: true
                }
            }
        },
        watch: {
            js: {
                files: [
                    'source/**/*.js'
                ],
                tasks: ['uglify', 'usebanner:js', 'sftp:js']
            },
            css: {
                files: [
                    'source/**/*.scss'
                ],
                tasks: ['sass', 'cssmin', 'usebanner:css', 'sftp:css']
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
                    src: 'core/components/colorpicker/elements/**/*.php',
                    dest: 'core/components/colorpicker/elements/'
                }, {
                    src: 'source/js/mgr/**/*.js',
                    dest: 'source/js/mgr/'
                }],
                options: {
                    replacements: [{
                        pattern: /Copyright 2017(-\d{4})? by/g,
                        replacement: 'Copyright ' + (new Date().getFullYear() > 2017 ? '2017-' : '') + new Date().getFullYear() + ' by'
                    }, {
                        pattern: /(@copyright .*?) 2017(-\d{4})?/g,
                        replacement: '$1 ' + (new Date().getFullYear() > 2017 ? '2017-' : '') + new Date().getFullYear()
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
    grunt.loadNpmTasks('grunt-banner');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-postcss');
    grunt.loadNpmTasks('grunt-sass');
    grunt.loadNpmTasks('grunt-ssh');
    grunt.loadNpmTasks('grunt-string-replace');
    grunt.renameTask('string-replace', 'bump');

    //register the task
    grunt.registerTask('default', ['bump', 'uglify', 'sass', 'cssmin', 'usebanner', 'sftp']);
};
