# Bazel build rules for [libuv](https://github.com/libuv/libuv)

Follows a "repos/deps" pattern (in order to help with recursive dependencies). To use:

1. Copy `bazel/repos.bzl` into your repository at `3rdparty/bazel-rules-libuv/repos.bzl` and add an empty `BUILD` (or `BUILD.bazel`) to `3rdparty/bazel-rules-libuv` as well.

2. Copy all of the directories from `3rdparty` that you ***don't*** already have in ***your*** repository's `3rdparty` directory.

3. Either ... add the following to your `WORKSPACE` (or `WORKSPACE.bazel`):

```bazel
load("//3rdparty/bazel-rules-libuv:repos.bzl", libuv_repos="repos")
libuv_repos()

load("@com_github_3rdparty_bazel_rules_libuv//bazel:deps.bzl", libuv_deps="deps")
libuv_deps()
```

Or ... to simplify others depending on ***your*** repository, add the following to your `repos.bzl`:

```bazel
load("//3rdparty/bazel-rules-libuv:repos.bzl", libuv="repos")

def repos():
    libuv()
```

And the following to your `deps.bzl`:

```bazel
load("@com_github_3rdparty_bazel_rules_libuv//bazel:deps.bzl", libuv="deps")

def deps():
    libuv()
```

4. You can then use `@com_github_libuv_libuv//:libuv` in your target's `deps`.

5. Repeat the steps starting at (1) at the desired version of this repository that you want to use:

| libuv | Copy `bazel/repos.bzl` from: |
| :---: | :--------------------------: |
| 1.42.0 | [c672b03](https://github.com/3rdparty/bazel-rules-libuv/tree/c672b030143144dbda4cb5d2a83667972a24b79c) |
