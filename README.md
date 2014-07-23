w3c_validator is a Puppet module that builds a working markup validator, preferably on Centos 6+.

Note this module is dependant on meltwater/cpan puppet module - so do a "puppet module install meltwater-cpan" before you 
start. 

The so called "experimental" back end servlet found these days at http://validator.nu, without which http://validator.w3.org/ cannot validate HTML5 can be built like so:

### Validator.nu HTML5 validation

1. Build Validator.nu:

        mkdir -p ~/build/validator-nu
        cd ~/build/validator-nu
        hg clone https://bitbucket.org/validator/build build
        export JAVA_HOME=/usr/lib/jvm/java-6-openjdk    ### note you may need the Oracle java, or maybe not these days
        python build/build.py all

    *Note*, if you encounter a Java exception, run the build script again:

        python build/build.py all

    Validator.nu should now be running on port 8888:

        INFO::Started SocketConnector@0.0.0.0:8888

    Confirm by killing the server (CTRL+C) and re-starting it with:

        python build/build.py run

4. Configure Validator to use the Validator.nu engine by adding the following
   line in `/etc/w3c/validator.conf`:

        <External>
        HTML5 = http://localhost:8888/
        </External>

#### Running Validator.nu at system start up

1. Create an unprivileged user account:

        sudo groupadd validator-nu
        sudo useradd -r -c "Validator.nu daemon" -g validator-nu \
          -d /usr/local/validator-nu -s /bin/false validator-nu

2. Install Validator.nu system-wide:

        sudo mv ~/build/validator-nu /usr/local/
        sudo chown -R validator-nu:validator-nu /usr/local/validator-nu

3. Create a launch script:

        cat << EOF | sudo tee /usr/local/bin/validator-nu
        #!/bin/sh
        cd /usr/local/validator-nu
        su -s '/bin/sh' -c 'python build/build.py run >logs/validator-nu.log 2>&1' validator-nu
        EOF
        sudo chmod +x /usr/local/bin/validator-nu

4. Edit `/etc/rc.local` and add the following line before `exit 0`:

        /usr/local/bin/validator-nu

After rebooting, Validator.nu should be running. Confirm by running:

    sudo ps aux | grep validator-nu

Validator should now be set up and ready to go. Browse to
[http://localhost/w3c-validator][localhost] (or
[http://localhost:8080/w3c-validator][localhost8080] if running in Vagrant) to
see it running.

Big thanks to https://github.com/tlvince/w3c-validator-guide for the above validator.nu servlet section. Research is presently underway to get this back end servlet auto-built in the w3c_validator module. 

Finally ... this summer, w3c_validator is also coming to a Puppet Forge near you.
