"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    if "com_github_libuv_libuv" not in native.existing_rules():
        http_archive(
            name = "com_github_libuv_libuv",
            url = "https://github.com/libuv/libuv/archive/refs/tags/v1.42.0.tar.gz",
            sha256 = "371e5419708f6aaeb8656671f89400b92a9bba6443369af1bb70bcd6e4b3c764",
            strip_prefix = "libuv-1.42.0",
            repo_mapping = repo_mapping,
            build_file = "@com_github_3rdparty_bazel_rules_libuv//:BUILD.bazel",
        )
