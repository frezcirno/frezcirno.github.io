"use strict";
var exec = require('child_process').exec;

function newLeetcode(id) {
    let cmd = ['hexo', 'new', 'post', '-p', `leetcode/${id}`, `"${id}. title"`].join(' ');
    exec(cmd, (error, stdout, stderr) => {
        if (stdout) console.log(stdout);
        if (stderr) console.log(stderr);
        if (error) console.log(error);
    });
}

function newDaily(args) {
    let today = new Date(Date.now())
    let date = today.toISOString().slice(0, 10)
    let cmd = ['hexo', 'new', 'post', '-p', `daily/${date}-${args[0]}`, "title"].join(' ');
    exec(cmd, (error, stdout, stderr) => {
        if (stdout) console.log(stdout);
        if (stderr) console.log(stderr);
        if (error) console.log(error);
    });
}

function newPost(args) {
    let today = new Date(Date.now())
    let date = today.toISOString().slice(0, 10)
    let cmd = ['hexo', 'new', 'post', '-p', `${date}-${args[0]}`, "title"].join(' ');
    exec(cmd, (error, stdout, stderr) => {
        if (stdout) console.log(stdout);
        if (stderr) console.log(stderr);
        if (error) console.log(error);
    });
}

function main() {
    let args = process.argv.slice(2);
    let type = args[0];

    switch (type) {
        case 'leetcode':
        case 'lc':
            let id = args[1];
            newLeetcode(id);
            break;
        case 'daily':
        case 'da':
        case 'd':
            newDaily(args.slice(1));
            break;
        default:
            newPost(args);
            break;
    }

}

main()