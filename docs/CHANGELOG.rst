
Changelog
=========

`0.18.2 <https://github.com/saltstack-formulas/postfix-formula/compare/v0.18.1...v0.18.2>`_ (2020-05-12)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* make necessary modifications to get working on ``salt-ssh`` (\ `34a112f <https://github.com/saltstack-formulas/postfix-formula/commit/34a112faabba46d95b102afa3add5b797dda2ce1>`_\ ), closes `/freenode.logbot.info/saltstack-formulas/20200507#c3819526-c3819581 <https://github.com//freenode.logbot.info/saltstack-formulas/20200507/issues/c3819526-c3819581>`_ `/freenode.logbot.info/saltstack-formulas/20200508#c3826763-c3826995 <https://github.com//freenode.logbot.info/saltstack-formulas/20200508/issues/c3826763-c3826995>`_
* **release.config.js:** use full commit hash in commit link [skip ci] (\ `ffbe5aa <https://github.com/saltstack-formulas/postfix-formula/commit/ffbe5aad13e73a4e3aa1c6dbd24488ebd73436ee>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile:** restrict ``train`` gem version until upstream fix [skip ci] (\ `80cdd9d <https://github.com/saltstack-formulas/postfix-formula/commit/80cdd9d202b6dbbc43aa02025bb7d9738aad8ee7>`_\ )
* **gemfile.lock:** add to repo with updated ``Gemfile`` [skip ci] (\ `497221d <https://github.com/saltstack-formulas/postfix-formula/commit/497221d1de7356cb031f78597781fa05897ca0a9>`_\ )
* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `708b0a5 <https://github.com/saltstack-formulas/postfix-formula/commit/708b0a51d9378ef44c0df125f532deea44f07044>`_\ )
* **kitchen:** use ``debian-10-master-py3`` instead of ``develop`` [skip ci] (\ `90098c0 <https://github.com/saltstack-formulas/postfix-formula/commit/90098c0cdfa856f9e3ca7772e8fb52e014d70d55>`_\ )
* **kitchen:** use ``develop`` image until ``master`` is ready (\ ``amazonlinux``\ ) [skip ci] (\ `df76c72 <https://github.com/saltstack-formulas/postfix-formula/commit/df76c72dcee4ff87f104b13880ddc32b163e2db6>`_\ )
* **kitchen+travis:** remove ``master-py2-arch-base-latest`` [skip ci] (\ `46d0f3d <https://github.com/saltstack-formulas/postfix-formula/commit/46d0f3d1d8b9b7373068c9182a593c8ed96e1bcd>`_\ )
* **kitchen+travis:** upgrade matrix after ``2019.2.2`` release [skip ci] (\ `70fc491 <https://github.com/saltstack-formulas/postfix-formula/commit/70fc49122ed6213a4e93fc5280bf5744af969f86>`_\ )
* **travis:** apply changes from build config validation [skip ci] (\ `f25db2d <https://github.com/saltstack-formulas/postfix-formula/commit/f25db2d5f3c2394e29f36cf33d2166c5af73fa40>`_\ )
* **travis:** opt-in to ``dpl v2`` to complete build config validation [skip ci] (\ `8f4db70 <https://github.com/saltstack-formulas/postfix-formula/commit/8f4db70ece851dea547550cfabb4b770eaf0796b>`_\ )
* **travis:** quote pathspecs used with ``git ls-files`` [skip ci] (\ `6d18d1d <https://github.com/saltstack-formulas/postfix-formula/commit/6d18d1dc93c92c4ba85f340c541d3a69f557d74e>`_\ )
* **travis:** run ``shellcheck`` during lint job [skip ci] (\ `29efb81 <https://github.com/saltstack-formulas/postfix-formula/commit/29efb819fc9d4bf273b57c15d01dfb390642b3d5>`_\ )
* **travis:** update ``salt-lint`` config for ``v0.0.10`` [skip ci] (\ `b23168e <https://github.com/saltstack-formulas/postfix-formula/commit/b23168e69ec8823ad9382b6c9c3be8f743d3b8e3>`_\ )
* **travis:** use ``major.minor`` for ``semantic-release`` version [skip ci] (\ `964e3ef <https://github.com/saltstack-formulas/postfix-formula/commit/964e3ef0fa6613380c56b1b2044e6f37dd797c6c>`_\ )
* **travis:** use build config validation (beta) [skip ci] (\ `1ab8692 <https://github.com/saltstack-formulas/postfix-formula/commit/1ab8692f31bdfcf5a24d7049c254d1b71d090e21>`_\ )
* **workflows/commitlint:** add to repo [skip ci] (\ `43a7353 <https://github.com/saltstack-formulas/postfix-formula/commit/43a7353caec2908e1d6aabab11c198c1806412f5>`_\ )

Documentation
^^^^^^^^^^^^^


* **contributing:** remove to use org-level file instead [skip ci] (\ `a33757a <https://github.com/saltstack-formulas/postfix-formula/commit/a33757a6ad445fc7e209f32c6ceb5b2309e11d03>`_\ )
* **readme:** update link to ``CONTRIBUTING`` [skip ci] (\ `50b9808 <https://github.com/saltstack-formulas/postfix-formula/commit/50b9808a3bd094de30439ff788b6f58ea72051ba>`_\ )

Performance Improvements
^^^^^^^^^^^^^^^^^^^^^^^^


* **travis:** improve ``salt-lint`` invocation [skip ci] (\ `2ece69c <https://github.com/saltstack-formulas/postfix-formula/commit/2ece69c3c12ffd9696a5836bf3ed7992af58e8ab>`_\ )

`0.18.1 <https://github.com/saltstack-formulas/postfix-formula/compare/v0.18.0...v0.18.1>`_ (2019-10-11)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **rubocop:** add fixes using ``rubocop --safe-auto-correct`` (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/87dd217>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** change ``log_level`` to ``debug`` instead of ``info`` (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/17734cb>`_\ )
* **kitchen:** install required packages to bootstrapped ``opensuse`` [skip ci] (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/5127bee>`_\ )
* **kitchen:** use bootstrapped ``opensuse`` images until ``2019.2.2`` [skip ci] (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/79df4ce>`_\ )
* **platform:** add ``arch-base-latest`` (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/16e6f58>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/0c0a228>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/1ec88a4>`_\ )
* use ``dist: bionic`` & apply ``opensuse-leap-15`` SCP error workaround (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/bbbc260>`_\ )
* **travis:** merge ``rubocop`` linter into main ``lint`` job (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/508074a>`_\ )
* **yamllint:** add rule ``empty-values`` & use new ``yaml-files`` setting (\ ` <https://github.com/saltstack-formulas/postfix-formula/commit/c9a4fc7>`_\ )

`0.18.0 <https://github.com/saltstack-formulas/postfix-formula/compare/v0.17.1...v0.18.0>`_ (2019-09-01)
------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** replace EOL pre-salted images (\ `8996d28 <https://github.com/saltstack-formulas/postfix-formula/commit/8996d28>`_\ )

Features
^^^^^^^^


* **yamllint:** include for this repo and apply rules throughout (\ `b4fbac2 <https://github.com/saltstack-formulas/postfix-formula/commit/b4fbac2>`_\ )

`0.17.1 <https://github.com/saltstack-formulas/postfix-formula/compare/v0.17.0...v0.17.1>`_ (2019-07-26)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **service:** restart service on package change (\ `75358e0 <https://github.com/saltstack-formulas/postfix-formula/commit/75358e0>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** modify matrix to include ``develop`` platform (\ `b505a5d <https://github.com/saltstack-formulas/postfix-formula/commit/b505a5d>`_\ )

`0.17.0 <https://github.com/saltstack-formulas/postfix-formula/compare/v0.16.0...v0.17.0>`_ (2019-06-03)
------------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **semantic-release:** implement an automated changelog (\ `3161504 <https://github.com/saltstack-formulas/postfix-formula/commit/3161504>`_\ )
