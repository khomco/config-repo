# config-repo
Docker container for dynamically pulling application or infrastructure configuration

### Currently, this is solutioned specific to HAProxy.  That will definitely change. The principle is simple; watch a repo for changes and 
pull them down to host and overwrite the existing configuration.  It would be up to the application using the configuration to detect the
change and reload or restart itself.
