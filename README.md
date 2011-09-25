<h2>Getting Rook running on Heroku takes a bit of work:</h2>

<h3>1. Building R on Heroku</h3>
First, you have to build R to run on the Heroku platform. This gets a little
tricky because the version of <code>gcc</code>that's available on the platform doesn't
include <code>gfortran</code>, and none of the needed libraries are available. The full
steps to build from source are in <code>bin/installR.sh</code>.

After installing and setting up
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
don't need stripped out (just to minimize file size).

We now need to install Rook as well:
<pre>
R -q -e "install.packages('Rook', repos='http://cran.r-project.org')"
</pre>
If you have any other packages that are required for your app, install those now as well.

Now, compress the bin directory and scp it to
a server you have. We'll need to include our build in our git repository, since
Heroku is a read only file system -- what we've done so far will be deleted as
soon as  we log out.

<pre>
tar -cvzf bin.tar.gz bin
scp bin.tar.gz me@myserver.com:~/myproject/bin.tar.gz
</pre>

Or, you can use the bin directory included in this repository. It should "just
work" on Heroku as of September 2011.

To test, close your existing session on heroku, uncompress the bin file you
just downloaded into your application's directory, commit all of your files, push
then to Heroku, start a new bash session, and run R. You're committing a lot of
files, so it will take a while for the first push after adding them (you might
need to split it up into multiple push's if you find it fails to push).

<h3>2. Set up your Rook app</h3>
Now you should have a copy of R built on the Heroku platform in your bin/
directory. You can now develop your Rook application as you normally would. I'd
actually recommend developing it before you do step 1 so you can be sure all of
your needed packages end up installed appropriately.

For demonstration, we'll just use the standard RookTest application in our
<code>demo.R</code> app.
<pre>
require('Rook')
rook = Rhttpd$new()
rook$start(listen='0.0.0.0', port=as.numeric(Sys.getenv("PORT")))

while(T) {
  Sys.sleep(10000)
}
</pre>

This will just get us the standard Rook test app. You'll notice I bound the Rook app to the port specified by the environment
variable port. Heroku sets a port for each process you set running, and knows to send HTTP requests to that port.

<h3>3. Configure Heroku</h3>
Now we need to tell Heroku what to do with our app once we push it to it.

config.ru: 
<code>`/app/bin/R-2.13.1/bin/R -e "source('/app/demo.R')"`</code>

Procfile:
<code>web: bundle exec rackup config.ru </code>

This provides the instructions for Heroku to execute when we start a web process -- it'll run the <code>config.ru</code> file, which in turn calls our Rook server. Heroku doesn't recognize we're running a web server if we start it directly from R, and so it won't be able to direct web requests to it. If we wrap it up in <code>config.ru</code>, Heroku has no problem starting it up.

<h3>4. Launch your application</h3>
Now, commit your application and Procfile and push to Heroku one more time (this should be a faster push than before). After you push, we need to tell Heroku to spin up one or more web processes.
<code>heroku ps:scale web=1</code>

If we wanted to, we could spin up more than one web process to increase our
capacity -- we're just using the built in web-server that R offers here, so it
will be somewhat limited (though from testing, it's actually fairly robust).
Heroku should automatically load balance among the multiple processes we spin
up. Do keep in mind Heroku's pricing model -- you basically get one process
running 24x7 for free, but pay for additional ones.

<h3>Test your app and enjoy</h3>
Now we can test our app out. It should be running at
http://yourprojectname.herokuapp.com/custom/RookTest (you can hit http://rookonheroku.herokuapp.com/custom/RookTest for this demo).
