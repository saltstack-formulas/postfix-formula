postfix-formula
===============

Formulas to set up and configure the Postfix mail transfer agent.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:


``postfix``
-----------

Installs and starts postfix SMTP server

``postfix.config``
------------------

Manages postfix main.cf and optionally the master.cf configuration file

``postfix.policyd-spf``
------------------

Installs and configures policyd-spf

``postfix.postgrey``
------------------

Installs and starts Postgrey service

``postfix.mysql``
------------------

Installs postfix mysql package ( Debian only)

``postfix.pcre``
------------------

Installs postfix pcre package ( Debian only)


``postfix.postsrsd``
------------------

Installs postfix postsrsd package
