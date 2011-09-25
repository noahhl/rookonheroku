Getting Rook running on Heroku takes a bit of work:

1) First, you have to build R to run on the Heroku platform. This gets a little
tricky because the version of gcc that's available on the platform doesn't
include gfortran, and none of the needed libraries are available. The full
steps to build from source are in <code>bin/installR.sh</code> of this repo, but in short,
you need to do something like the following, after installing and setting up
your Heroku account:

<pre>
mkdir myproject && cd myproject
mkdir bin
# Need to make Heroku think we're running a rack app so it'll accept our pushes.
# Don't worry, we aren't really going to do anything with this.

echo "puts 'OK'" > config.ru
echo "source 'http://rubygems.org'\n gem 'rack'" > Gemfile
bundle install

# Get things up to Heroku
git init . && git add . && git commit -m "Init"
heroku apps:create myproject --stack=cedar
git push heroku master
# Disable the existing web worker, since we don't really want to run the rack
# application
heroku ps:scale web=0 
# Now, get into a shell on Heroku and build the binary and necessary
# dependencies
heroku run bash
cd bin/
# The install script is annotated with what it does
./installR.sh
</pre>

When that finishes, we'll have a working build of R, with all of the pieces we
don't need stripped out. 

We now need to install Rook as well:
<pre>
R -q -e "install.packages('Rook', repos='http://cran.r-project.org')"
</pre>
If you have any other packages that are required for your app, do so now as well.

Now, just compress the bin directory and scp it to
a server you have -- we need to include our build in our git repository, since
Heroku is a read only file system.

<pre>
tar -cvzf bin.tar.gz bin
scp bin.tar.gz me@myserver.com:~/myproject/bin.tar.gz
tar -xzvf bin.tar.gz
</pre>

Or, you can use the bin directory included in this repository. It should "just
work" on Heroku as of September 2011.

To test, close your existing session on heroku, commit all of your files, push
to Heroku, start a new bash session, and run R. You're committing a lot of
files, so it will take a while for the first push after adding them.

2) Now you should have a copy of R built on the Heroku platform in your bin/
directory. You can now develop your Rook application as you normally would. I'd
actually recommend developing it before you do step 1 so you can be sure all of
your needed packages end up installed appropriately.

For demonstration sake, we'll use a very simple Rook program like the
following (saved in "demo.R"):

<pre>
require('Rook')
rook <- Rhttpd$new()
rook$add(name="TestApp", app=TestApp)
rook$start(listen='0.0.0.0', port=as.numeric(Sys.getenv("PORT")))

while(T) {
  Sys.sleep(10000)
}
</pre>

This will just get us the standard Rook test app. You'll notice I bound the Rook app to the port specified by the environment
variable port. Heroku sets a port for each process you set running, and knows
to send HTTP requests to that port.

3) Now we need to tell Heroku what to do with our app once we push it to it.

In config.ru, add a line like:

<pre>
`/app/bin/R-2.13.1/bin/R -e "source('/app/demo.R')"`
</pre>

Then, create a file called <code>Procfile</code> with a specification like the
following in it:

<pre>
web: bundle exec rackup config.ru 
</pre>

This will execute our server. Heroku doesn't recognize we're running a web
server if we start it directly, and so it won't be able to direct web requests
to it. If we wrap it up in <code>config.ru</code>, Heroku has no problem
starting it up.

4) Now, add your application and Procfile and push to Heroku one more time (this should be a faster push than before). After you push, we need to tell Heroku to spin up one or more web processes.
<pre>
heroku ps:scale web=1
</pre>

If we wanted to, we could spin up more than one web process to increase our
capacity -- we're just using the built in web-server that R offers here, so it
will be somewhat limited (though from testing, it's actually fairly robust).
Heroku should automatically load balance among the multiple processes we spin
up. Do keep in mind Heroku's pricing model -- you basically get one process
running 24x7 for free, but pay for additional ones.

5) Now we can test our app out. It should be running at
http://yourprojectname.herokuapp.com/custom/RookTest

<pre>
$ curl http://rookonheroku.herokuapp.com/custom/RookTest
<HTML><head><style type="text/css">
table { border: 1px solid #8897be; border-spacing: 0px; font-size: 10pt; }td { border-bottom:1px solid #d9d9d9; border-left:1px solid #d9d9d9; border-spacing: 0px; padding: 3px 8px; }td.l { font-weight: bold; width: 10%; }
tr.e { background-color: #eeeeee; border-spacing: 0px; }
tr.o { background-color: #ffffff; border-spacing: 0px; }
</style></head><BODY><img alt="rook logo" src="http://wiki.rapache.net/static/rook.png"><H1>Welcome to Rook</H1>
<form enctype="multipart/form-data" method=POST action="/custom/RookTest/thogeeexgq?called=13.6027460331097">Enter a string: <input type=text name=name value=""><br>
Enter another string: <input type=text name=name2 value=""><br>
Upload a file: <input type=file name=fileUpload><br>
Upload another file: <input type=file name=anotherFile><br>
<input type=submit name=Submit><br><br>Environment:<br><pre>List of 21
 $ HTTP_X_HEROKU_QUEUE_WAIT_TIME: chr "3"
 $ HTTP_X_FORWARDED_PROTO       : chr "http"
 $ HTTP_CONNECTION              : chr "keep-alive"
 $ HTTP_ACCEPT                  : chr "*/*"
 $ QUERY_STRING                 : chr ""
 $ SERVER_NAME                  : chr "rookonheroku.herokuapp.com"
 $ SCRIPT_NAME                  : chr "/custom/RookTest"
 $ SERVER_PORT                  : chr NA
 $ rook.input                   :Formal class 'RhttpdInputStream' [package "Rook"] with 1 slots
  .. ..@ .xData:<environment: 0x2bc02c8> 
 $ PATH_INFO                    : chr ""
 $ rook.version                 : chr "1.0-2"
 $ rook.errors                  :Formal class 'RhttpdErrorStream' [package "Rook"] with 1 slots
  .. ..@ .xData:<environment: 0x32fd670> 
 $ HTTP_X_FORWARDED_FOR         : chr "100.100.0.1"
 $ rook.url_scheme              : chr "http"
 $ HTTP_X_FORWARDED_PORT        : chr "80"
 $ REQUEST_METHOD               : chr "GET"
 $ HTTP_X_HEROKU_DYNOS_IN_USE   : chr "1"
 $ HTTP_USER_AGENT              : chr "curl/7.21.4 (universal-apple-darwin11.0) libcurl/7.21.4 OpenSSL/0.9.8r zlib/1.2.5"
 $ HTTP_HOST                    : chr "rookonheroku.herokuapp.com"
 $ HTTP_X_REQUEST_START         : chr "1316984883377"
 $ HTTP_X_HEROKU_QUEUE_DEPTH    : chr "0"</pre><br>Get:<br><pre> list()</pre><br>Post:<br><pre> NULL</pre><br><br>

</pre>
