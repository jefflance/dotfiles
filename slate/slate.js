// $HOME/.slate.js
//
//    This is a global JavaScript config file for Slate.
//    If no ~/.slate.js file exists Slate will use a default
//    .slate configuration file
//
//    This file includes calls to files in $HOME/.slate.d directory.
//    It's a modular configuration of Slate.
//
// Jeff LANCE <jeff.lance@mala.fr>
//
// 12/10/2014
//


// GLOBAL VARIABLES
var slate_dir = '~/.slate.d/js';
var slate_files = ['config', 'functions', 'operation', 'layouts', 'resize', 'bindings'];

// LOAD CONFIG FILES
for (var i in slate_files) {
    var success_config = slate.source(slate_dir + '/' + slate_files[i] + '.js', true);
    slate.log('[SLATE] -------------- Load File ' + slate_files[i] + '.js' + ' --------------');
}

// END OF LOGGING LOADS OF CONFIG FILES
slate.log('[SLATE] -------------- Finished Loading Config --------------');
