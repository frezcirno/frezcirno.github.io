"use strict";
const { exec } = require('child_process');
const { argv, exit } = require('process');

function new_post(_cmd) {
    let cmd = ['hexo', 'new', 'post', '-p', _cmd.section + "/" + _cmd.filename, _cmd.title].join(' ');
    exec(cmd, (error, stdout, stderr) => {
        if (stdout) console.log(stdout);
        if (stderr) console.log(stderr);
        if (error) console.log(error);
    });
}

const OP = {
    NEW: 0,
};

function die(what) {
    console.error(what);
    exit(-1);
}

function usage() {
    console.log(`Usage: ${argv[1]} [-s|--section SECTION] [-n|--name FILENAME] TITLE
Create hexo posts.
`)
}

function main() {
    const argc = argv.length;
    let i = 0;
    let verbose = 0;

    let cmd = {
        op: null,
        section: null,
        filename: null,
        title: null,
    };

    i += 2;
    while (i < argc) {
        if (argv[i] == "new") {
            if (cmd.op)
                die("Duplicated op");
            cmd.op = OP.NEW;
        }
        else if (argv[i] == "-t" || argv[i] == "--title") {
            if (++i >= argc)
                die("Expected args: title");
            if (cmd.title)
                die("Duplicated title");
            cmd.title = argv[i];
        }
        else if (argv[i] == "-s" || argv[i] == "--section") {
            if (++i >= argc)
                die("Expected args: section");
            if (cmd.section)
                die("Duplicated section");
            cmd.section = argv[i];
        }
        else if (argv[i] == "-n" || argv[i] == "--filename") {
            if (++i >= argc)
                die("Expected args: filename");
            if (cmd.filename)
                die("Duplicated filename");
            cmd.filename = argv[i];
        }
        else if (argv[i] == "-h" || argv[i] == "--help") {
            usage();
            exit(0);
        }
        else if (argv[i] == '-v' || argv[i] == '--verbose') {
            verbose = 1;
            console.log(argv);
        }
        else {
            if (cmd.title)
                die("Duplicated title");
            cmd.title = argv[i];
        }

        i++;
        if (verbose)
            console.log(cmd)
    }

    if (!cmd.title)
        die("Expected title");

    if (!cmd.section)
        cmd.section = "."

    if (!cmd.filename)
        cmd.filename = cmd.title

    new_post(cmd);
}

main()