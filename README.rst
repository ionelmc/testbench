=========
testbench
=========

This contains a dockerized setup to test performance of uWSGI_, uvicorn_ and Granian_ with a reverse proxy setup.

This is not necesarily a common setup, an apples-to-apples comparison or even a good setup for Granian_ (as it can run standalone very well, with less proxy overhead) - it's just a setup I use and I want to test.

This is not necesarily as clean as possible - it's mostly made from https://github.com/ionelmc/cookiecutter-django-docker/

This assumes you have a recent Docker installed (with compose plugin). To run tests::

    ./test.sh

You can customize rewrk_ options, example::

    ./test.sh --http2 -c 10 -d 60s

.. _uWSGI: https://github.com/unbit/uwsgi
.. _uvicorn: https://github.com/Kludex/uvicorn
.. _Granian: https://github.com/emmett-framework/granian
.. _rewrk: https://github.com/lnx-search/rewrk
