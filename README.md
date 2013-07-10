[![Code Climate](https://codeclimate.com/github/jurglic/ge-test.png)](https://codeclimate.com/github/jurglic/ge-test)

Simulation of graphical editor over CLI (test task for a client)
==================

Graphical editor is run in interactive CLI as follows:
~~~ sh
$ ruby -Ilib lib/cli.rb
~~~

Specs can be run with rake:
~~~ sh
$ rake
~~~



Requirements
------------
Dependencies:

* **Ruby 2.0.0** or newer

There are no other dependencies for runtime environment.

For development/test environment run bundler:
~~~ sh
$ bundle
# run all specs
$ rspec
~~~