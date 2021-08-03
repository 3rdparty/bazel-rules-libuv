"""Adds repostories/archives."""

########################################################################
# DO NOT EDIT THIS FILE unless you are inside the
# https://github.com/3rdparty/bazel-rules-libuv repository. If you
# encounter it anywhere else it is because it has been copied there in
# order to simplify adding transitive dependencies. If you want a
# different version of bazel-rules-libuv follow the Bazel build
# instructions at https://github.com/3rdparty/bazel-rules-libuv.
########################################################################

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repos(external = True, repo_mapping = {}):
    if "rules_foreign_cc" not in native.existing_rules():
        http_archive(
            name = "rules_foreign_cc",
            url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.5.1.tar.gz",
            sha256 = "33a5690733c5cc2ede39cb62ebf89e751f2448e27f20c8b2fbbc7d136b166804",
            strip_prefix = "rules_foreign_cc-0.5.1",
            repo_mapping = repo_mapping,
        )

    if external and "com_github_3rdparty_bazel_rules_libuv" not in native.existing_rules():
        http_archive(
            name = "com_github_3rdparty_bazel_rules_libuv",
            url = "https://github.com/3rdparty/bazel-rules-libuv/archive/libuv-1.42.0.tar.gz",
            sha256 = "6367f35a64c997d4c6ec869acc7c768e2cffd7bd3ae87a8c7d9eec2a9eec4d77",
            strip_prefix = "bazel-rules-libuv-libuv-1.42.0",
            repo_mapping = repo_mapping,
        )
