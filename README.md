# Server Configurations

##### Priveasy's Official "Infrastructure as Code" Repository

This is the [Fetch Apply](https://git.p5.vc/Priveasy/fetch-apply "Fetch Apply") "operations" repository used by Priveasy set up, configure, and maintain all of its servers. This repository is public and open source, enabling maximum transparency and auditability, while spurring collaboration.

------------

### Overview

Because Priveasy's services are frequently (and randomly) being developed, improved upon, and modified (as is the nature of open source projects), and because we strive to always use the latest and greatest open source technologies with the most recent security patches applied, we often find ourselves wiping and re-standing up our servers every few months. In order to make this process less cumbersome for us and easier for our community to reproduce (for testing, auditing, or development purposes), we've automated the entire process for all of our servers.

#### The Server Deployment Process

- The latest LTS release of [Ubuntu Server](https://ubuntu.com/download/server "Ubuntu Server") is installed on the server
- Fetch Apply is installed on the server, following the [installation instructions](https://source.priveasy.org/Priveasy/fetch-apply#installation "installation instructions"), and then answering any prompts that appear
- The Fetch Apply configuration file is edited to prevent execution from halting if any command returns a non-zero exit code
  - Edit command used: `sed -i 's/^fa_var_IGNORE_ERRORS=false$/fa_var_IGNORE_ERRORS=true/' /etc/fetch-apply`
- Fetch Apply is run (via the `fa` command), and any prompts that appear are answered
- The server is rebooted (via the `reboot` command)

#### Take Note

Just as we update our code and packages frequently, so do the maintainers of the many dependencies that our servers rely on. Therefore, it is possible that a package may be updated in a way that breaks a piece of the set up, configuration, or maintenance code included in this repository. If you run into an error reproducing our setup, it is likely for this reason. The best resolution is to manually roll back to a slightly older version of the dependency that's causing the error, or to fork this repository and apply a fix—and then make a pull request :)—before retrying the installation using your patched fork. You are also welcome to wait until we see the error the next time we go to stand up a server, and consequently push the fix to this repository.

It should also be noted that this repository really does contain our actual server configurations. Because of that, some of the commands and files include references to owned resources (such as domain names and IP addresses) that will not work with your instance. If you truly wish to create a fully-operational build, you will need to fork this repository and replace the references to those resources with comparable references to resources that you own.
