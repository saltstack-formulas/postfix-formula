
Changelog
=========

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
