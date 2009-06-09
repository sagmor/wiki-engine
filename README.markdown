Wiki Engine
===========

Wiki Engine is a Rails Engines powered plugin, that allows you to add a wiki to your Rails App in a breeze.

It is currently an early prototype and an experiment on how to play with Rails Engines and Git, so use it at your own risk.

Requirements
------------

To use Wiki Engine you need the following:

* Rails >= 2.3.2
* Grit
* BlueCloth


Install
-------

Simply run:

    script/plugin install git://github.com/sagmor/wiki-engine.git 
    rake wiki:install

And you should be ready to roll

Simply access

    http://localhost:3000/wiki/en/

And see the welcome page!

TODO
----

* Write Tests (Sorry but i still need to make the habit)
* Add I18N
* Implement Cool Wiki features (Diff, History, Blame, etc)
* Support better integration with arbitrary Rails App 

Licence
-------
Copyright &copy; 2009 Sebastián Gamboa (SagMor)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
