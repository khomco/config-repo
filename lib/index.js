var Git = require('simple-git');
var mksubdir = require('mksubdir');
var copydir = require('copy-dir');

var github_repo = process.env.HAPROXY_CONFIG_GITHUB_REPO;
if (github_repo == "" || github_repo == "UNKNOWN") {
    console.error("NO REPO WAS PROVIDED");
    console.error("EXITING PROGRAM!");
    process.exit(-1);
}

var stage_dir = "/tmp/stage-config";
mksubdir(stage_dir);
var repo = new Git(stage_dir);

var haproxy_config_dir = process.env.HAPROXY_CONFIG_DIR;
var haproxy_config_polling = process.env.HAPROXY_CONFIG_POLLING;


repo.clone(github_repo, stage_dir, (error, clone) => {
    copydir.sync(stage_dir, haproxy_config_dir);
    setInterval((repo) => {
        repo.pull((error, update) => {
            if (error) {
                console.error(error)
            } else {
                if (update && update.summary.changes) {
                    console.log(update);
                    copydir.sync(stage_dir, haproxy_config_dir);
                }
            }
        }).then(() => {
            console.log("haproxy config pull complete")
        });
    }, haproxy_config_polling, repo);
});
