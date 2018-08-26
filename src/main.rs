extern crate clap;
extern crate users;

use std::env;
use clap::{Arg, App, SubCommand};
use std::process::{Command};
use std::os::unix::process::CommandExt;
use users::{get_current_uid, get_current_gid};

fn main() {
    let matches = App::new("docker-habitat")
        .version("1.0")
        .author("Danil Guskov <guskovd86@mail.ru>")
        .about("docker-habitat")
        .arg(Arg::with_name("v")
             .short("v")
             .multiple(true)
             .help("Sets the level of verbosity"))
        .subcommand(SubCommand::with_name("shell")
                    .about("")
                    .arg(Arg::with_name("args")
                         .help("Sets the input file to use")
                         .required(false)
                         .index(1))
        )
        .subcommand(SubCommand::with_name("binlink")
                    .about("controls udpate features")
        )
        .get_matches();

    if let Some(_) = matches.subcommand_matches("shell") {
        let pwd = format!("{}", env::current_dir().unwrap().display());
        let home = format!("{}", env::home_dir().unwrap().display());
        format!("{}:{}", get_current_uid(), get_current_gid());

        Command::new("docker").args(&[
            "run", "-ti",
            "-w", &pwd,
            "-v", &format!("{}:{}", &home, &home),
            "-v", "/hab:/hab",
            "-v", "/etc/group:/etc/group:ro",
            "-v", "/etc/passwd:/etc/passwd:ro",
            "-u", &format!("{}:{}", get_current_uid(), get_current_gid()),
            "docker-habitat:local"
        ]).exec();
    }

    if let Some(_) = matches.subcommand_matches("binlink") {
        println!("Binlink ...");

    }
}

