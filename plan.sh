pkg_name=docker-habitat
pkg_origin=guskovd
pkg_version='1.0.9'
pkg_description="docker-habitat"
pkg_maintainer='guskovd'
pkg_upstream_url=""

pkg_hab_shell_interpreter="bash"

pkg_deps=(
    qago/hab-shell
    core/docker
    core/docker-compose
    core/tar
    core/gzip
    core/git
    core/wget
    core/which
    core/rust-nightly
    core/make
    core/gcc
    core/gcc-libs
    core/clang
)

do_shell() {
    . ~/.bashrc
}

do_build() {
    return 0
}

do_install() {
    return 0
}

do_setup_environment() {
    push_runtime_env LD_LIBRARY_PATH "$(pkg_path_for core/gcc-libs)/lib"
}
