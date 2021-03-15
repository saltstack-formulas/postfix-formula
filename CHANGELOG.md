# Changelog

# [2.0.0](https://github.com/saltstack-formulas/postfix-formula/compare/v1.2.2...v2.0.0) (2021-03-15)


### Bug Fixes

* **resources:** make resources' IDs unique ([03ad48b](https://github.com/saltstack-formulas/postfix-formula/commit/03ad48b8a4b0b05144d449c9caee998ad6d0628f))


### Continuous Integration

* **commitlint:** ensure `upstream/master` uses main repo URL [skip ci] ([381b150](https://github.com/saltstack-formulas/postfix-formula/commit/381b150b0f1d0ab41e60f0ac95a7a6163633d701))
* **gemfile+lock:** use `ssf` customised `kitchen-docker` repo [skip ci] ([c5851e6](https://github.com/saltstack-formulas/postfix-formula/commit/c5851e67a2125c5367b3ab97b46c6407aa66eaf1))
* **gitlab-ci:** add `rubocop` linter (with `allow_failure`) [skip ci] ([22fa184](https://github.com/saltstack-formulas/postfix-formula/commit/22fa184b14e88a05d4c4284c459a7d887501e404))
* **gitlab-ci:** use GitLab CI as Travis CI replacement ([890f3ae](https://github.com/saltstack-formulas/postfix-formula/commit/890f3aebc63484d07f887c870f2825797ba504e9))
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] ([19617a0](https://github.com/saltstack-formulas/postfix-formula/commit/19617a0ad710914c8f4439044d7bf993e1effcc8))
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] ([d65a7a3](https://github.com/saltstack-formulas/postfix-formula/commit/d65a7a36c28e3881b058e9c5b898a0f39c5e1ca7))
* **pre-commit:** add to formula [skip ci] ([f41392d](https://github.com/saltstack-formulas/postfix-formula/commit/f41392d4504cb60b2fcf2c818cfe97f5487e2844))
* **pre-commit:** enable/disable `rstcheck` as relevant [skip ci] ([fb5be95](https://github.com/saltstack-formulas/postfix-formula/commit/fb5be9504ec18c86bab4f387bf62ba816b3ffa64))
* **pre-commit:** finalise `rstcheck` configuration [skip ci] ([75941ed](https://github.com/saltstack-formulas/postfix-formula/commit/75941ed61443c84c27fea864d0529461564d8969))
* **pre-commit:** update hook for `rubocop` [skip ci] ([c60d58e](https://github.com/saltstack-formulas/postfix-formula/commit/c60d58eb1168c031c12d656c9605f83afebc9fa1))


### BREAKING CHANGES

* **resources:** as all resources' IDs changed, other formulas
depending on this formula's resources will need to be modified
accordingly.

## [1.2.2](https://github.com/saltstack-formulas/postfix-formula/compare/v1.2.1...v1.2.2) (2020-10-02)


### Styles

* prepend modes with 0 ([fdc127c](https://github.com/saltstack-formulas/postfix-formula/commit/fdc127c8db7b19fac9be907ca511b17d5f5c4be0))
* quote modes/numbers ([b9c4fba](https://github.com/saltstack-formulas/postfix-formula/commit/b9c4fbadaf164c1589a27af45fbde7092e6a1d8a))

## [1.2.1](https://github.com/saltstack-formulas/postfix-formula/compare/v1.2.0...v1.2.1) (2020-09-27)


### Styles

* linting for `yamllint` ([780dc9d](https://github.com/saltstack-formulas/postfix-formula/commit/780dc9d372328f0b7ae08425abf1e1f32ed4b49e))

# [1.2.0](https://github.com/saltstack-formulas/postfix-formula/compare/v1.1.0...v1.2.0) (2020-07-20)


### Features

* **maps:** add more map types and tests ([e3970df](https://github.com/saltstack-formulas/postfix-formula/commit/e3970dfc3eac57b7a4f8911ef48d8652f3a26cd7))

# [1.1.0](https://github.com/saltstack-formulas/postfix-formula/compare/v1.0.3...v1.1.0) (2020-07-18)


### Continuous Integration

* **kitchen:** use `saltimages` Docker Hub where available [skip ci] ([2ddd417](https://github.com/saltstack-formulas/postfix-formula/commit/2ddd417039d8cb6f8241036c60ee0e6d534aab00))


### Features

* **config:** run postmap also for regexp maps ([7584fce](https://github.com/saltstack-formulas/postfix-formula/commit/7584fce0aff912b3aeaf44e6eed82a4c9c267535))

## [1.0.3](https://github.com/saltstack-formulas/postfix-formula/compare/v1.0.2...v1.0.3) (2020-06-08)


### Bug Fixes

* **deps:** fixes ordering where postmap requires sane main.cf ([a28bd05](https://github.com/saltstack-formulas/postfix-formula/commit/a28bd05b852c309e70aa8ff0491c12271ddd4461))
* **test:** use specific ip to workaround centos bug ([273caf9](https://github.com/saltstack-formulas/postfix-formula/commit/273caf9b6f42a4127025f9d2d862806653b661c2))


### Tests

* **default:** add inspec for base and maps ([2a61498](https://github.com/saltstack-formulas/postfix-formula/commit/2a61498fa440b2eef26849c2b0bc2dadf27b2dee))

## [1.0.2](https://github.com/saltstack-formulas/postfix-formula/compare/v1.0.1...v1.0.2) (2020-06-07)


### Bug Fixes

* **opensuse:** fixes config files generation in opensuse ([067bcf6](https://github.com/saltstack-formulas/postfix-formula/commit/067bcf636face6b3a3cb40418758641354ac2402))

## [1.0.1](https://github.com/saltstack-formulas/postfix-formula/compare/v1.0.0...v1.0.1) (2020-06-07)


### Bug Fixes

* **main:** fix postconf warning when reloading/starting ([04003c6](https://github.com/saltstack-formulas/postfix-formula/commit/04003c6ee33d5699cc392f7e74f81d27547b5f6e))

# [1.0.0](https://github.com/saltstack-formulas/postfix-formula/compare/v0.19.0...v1.0.0) (2020-06-06)


### Code Refactoring

* **maps:** move tls_policy and transport to mapping section ([06276fd](https://github.com/saltstack-formulas/postfix-formula/commit/06276fd7431e1675795be95c0c8ebb01772ea740))


### Continuous Integration

* **kitchen+travis:** use latest pre-salted images ([b364744](https://github.com/saltstack-formulas/postfix-formula/commit/b364744e40b484397fea5c2c1767f77728649de8))


### BREAKING CHANGES

* **maps:** `transport` and `tls_policy` keys in `postfix:config` have been moved to the standard `postfix:mapping`.

# [0.19.0](https://github.com/saltstack-formulas/postfix-formula/compare/v0.18.2...v0.19.0) (2020-05-23)


### Continuous Integration

* **travis:** add notifications => zulip [skip ci] ([c78c421](https://github.com/saltstack-formulas/postfix-formula/commit/c78c4219846f8c384623da7dd74d4e9a5e419b74))


### Features

* **maps:** adds tls_policy map for smtp delivery ([d87da4a](https://github.com/saltstack-formulas/postfix-formula/commit/d87da4adc49d18674f35e40a948ad88fefaf26f6))

## [0.18.2](https://github.com/saltstack-formulas/postfix-formula/compare/v0.18.1...v0.18.2) (2020-05-12)


### Bug Fixes

* make necessary modifications to get working on `salt-ssh` ([34a112f](https://github.com/saltstack-formulas/postfix-formula/commit/34a112faabba46d95b102afa3add5b797dda2ce1)), closes [/freenode.logbot.info/saltstack-formulas/20200507#c3819526-c3819581](https://github.com//freenode.logbot.info/saltstack-formulas/20200507/issues/c3819526-c3819581) [/freenode.logbot.info/saltstack-formulas/20200508#c3826763-c3826995](https://github.com//freenode.logbot.info/saltstack-formulas/20200508/issues/c3826763-c3826995)
* **release.config.js:** use full commit hash in commit link [skip ci] ([ffbe5aa](https://github.com/saltstack-formulas/postfix-formula/commit/ffbe5aad13e73a4e3aa1c6dbd24488ebd73436ee))


### Continuous Integration

* **gemfile:** restrict `train` gem version until upstream fix [skip ci] ([80cdd9d](https://github.com/saltstack-formulas/postfix-formula/commit/80cdd9d202b6dbbc43aa02025bb7d9738aad8ee7))
* **gemfile.lock:** add to repo with updated `Gemfile` [skip ci] ([497221d](https://github.com/saltstack-formulas/postfix-formula/commit/497221d1de7356cb031f78597781fa05897ca0a9))
* **kitchen:** avoid using bootstrap for `master` instances [skip ci] ([708b0a5](https://github.com/saltstack-formulas/postfix-formula/commit/708b0a51d9378ef44c0df125f532deea44f07044))
* **kitchen:** use `debian-10-master-py3` instead of `develop` [skip ci] ([90098c0](https://github.com/saltstack-formulas/postfix-formula/commit/90098c0cdfa856f9e3ca7772e8fb52e014d70d55))
* **kitchen:** use `develop` image until `master` is ready (`amazonlinux`) [skip ci] ([df76c72](https://github.com/saltstack-formulas/postfix-formula/commit/df76c72dcee4ff87f104b13880ddc32b163e2db6))
* **kitchen+travis:** remove `master-py2-arch-base-latest` [skip ci] ([46d0f3d](https://github.com/saltstack-formulas/postfix-formula/commit/46d0f3d1d8b9b7373068c9182a593c8ed96e1bcd))
* **kitchen+travis:** upgrade matrix after `2019.2.2` release [skip ci] ([70fc491](https://github.com/saltstack-formulas/postfix-formula/commit/70fc49122ed6213a4e93fc5280bf5744af969f86))
* **travis:** apply changes from build config validation [skip ci] ([f25db2d](https://github.com/saltstack-formulas/postfix-formula/commit/f25db2d5f3c2394e29f36cf33d2166c5af73fa40))
* **travis:** opt-in to `dpl v2` to complete build config validation [skip ci] ([8f4db70](https://github.com/saltstack-formulas/postfix-formula/commit/8f4db70ece851dea547550cfabb4b770eaf0796b))
* **travis:** quote pathspecs used with `git ls-files` [skip ci] ([6d18d1d](https://github.com/saltstack-formulas/postfix-formula/commit/6d18d1dc93c92c4ba85f340c541d3a69f557d74e))
* **travis:** run `shellcheck` during lint job [skip ci] ([29efb81](https://github.com/saltstack-formulas/postfix-formula/commit/29efb819fc9d4bf273b57c15d01dfb390642b3d5))
* **travis:** update `salt-lint` config for `v0.0.10` [skip ci] ([b23168e](https://github.com/saltstack-formulas/postfix-formula/commit/b23168e69ec8823ad9382b6c9c3be8f743d3b8e3))
* **travis:** use `major.minor` for `semantic-release` version [skip ci] ([964e3ef](https://github.com/saltstack-formulas/postfix-formula/commit/964e3ef0fa6613380c56b1b2044e6f37dd797c6c))
* **travis:** use build config validation (beta) [skip ci] ([1ab8692](https://github.com/saltstack-formulas/postfix-formula/commit/1ab8692f31bdfcf5a24d7049c254d1b71d090e21))
* **workflows/commitlint:** add to repo [skip ci] ([43a7353](https://github.com/saltstack-formulas/postfix-formula/commit/43a7353caec2908e1d6aabab11c198c1806412f5))


### Documentation

* **contributing:** remove to use org-level file instead [skip ci] ([a33757a](https://github.com/saltstack-formulas/postfix-formula/commit/a33757a6ad445fc7e209f32c6ceb5b2309e11d03))
* **readme:** update link to `CONTRIBUTING` [skip ci] ([50b9808](https://github.com/saltstack-formulas/postfix-formula/commit/50b9808a3bd094de30439ff788b6f58ea72051ba))


### Performance Improvements

* **travis:** improve `salt-lint` invocation [skip ci] ([2ece69c](https://github.com/saltstack-formulas/postfix-formula/commit/2ece69c3c12ffd9696a5836bf3ed7992af58e8ab))

## [0.18.1](https://github.com/saltstack-formulas/postfix-formula/compare/v0.18.0...v0.18.1) (2019-10-11)


### Bug Fixes

* **rubocop:** add fixes using `rubocop --safe-auto-correct` ([](https://github.com/saltstack-formulas/postfix-formula/commit/87dd217))


### Continuous Integration

* **kitchen:** change `log_level` to `debug` instead of `info` ([](https://github.com/saltstack-formulas/postfix-formula/commit/17734cb))
* **kitchen:** install required packages to bootstrapped `opensuse` [skip ci] ([](https://github.com/saltstack-formulas/postfix-formula/commit/5127bee))
* **kitchen:** use bootstrapped `opensuse` images until `2019.2.2` [skip ci] ([](https://github.com/saltstack-formulas/postfix-formula/commit/79df4ce))
* **platform:** add `arch-base-latest` ([](https://github.com/saltstack-formulas/postfix-formula/commit/16e6f58))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/postfix-formula/commit/0c0a228))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/postfix-formula/commit/1ec88a4))
* use `dist: bionic` & apply `opensuse-leap-15` SCP error workaround ([](https://github.com/saltstack-formulas/postfix-formula/commit/bbbc260))
* **travis:** merge `rubocop` linter into main `lint` job ([](https://github.com/saltstack-formulas/postfix-formula/commit/508074a))
* **yamllint:** add rule `empty-values` & use new `yaml-files` setting ([](https://github.com/saltstack-formulas/postfix-formula/commit/c9a4fc7))

# [0.18.0](https://github.com/saltstack-formulas/postfix-formula/compare/v0.17.1...v0.18.0) (2019-09-01)


### Continuous Integration

* **kitchen+travis:** replace EOL pre-salted images ([8996d28](https://github.com/saltstack-formulas/postfix-formula/commit/8996d28))


### Features

* **yamllint:** include for this repo and apply rules throughout ([b4fbac2](https://github.com/saltstack-formulas/postfix-formula/commit/b4fbac2))

## [0.17.1](https://github.com/saltstack-formulas/postfix-formula/compare/v0.17.0...v0.17.1) (2019-07-26)


### Bug Fixes

* **service:** restart service on package change ([75358e0](https://github.com/saltstack-formulas/postfix-formula/commit/75358e0))


### Continuous Integration

* **kitchen+travis:** modify matrix to include `develop` platform ([b505a5d](https://github.com/saltstack-formulas/postfix-formula/commit/b505a5d))

# [0.17.0](https://github.com/saltstack-formulas/postfix-formula/compare/v0.16.0...v0.17.0) (2019-06-03)


### Features

* **semantic-release:** implement an automated changelog ([3161504](https://github.com/saltstack-formulas/postfix-formula/commit/3161504))
