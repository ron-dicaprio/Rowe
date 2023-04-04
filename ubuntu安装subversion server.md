# Ubuntu 20.04.5 LTS 安装SVN
## 1、安装subversion环境
```sh
$ sudo apt update
$ sudo apt install subversion
$ cd ~
$ mkdir -p svn/repository
$ svnadmin create /home/ubuntu/svn/repository
```

## 2、编辑配置文件
### vim authz
```sh
### This file is an example authorization file for svnserve.
### Its format is identical to that of mod_authz_svn authorization
### files.
### As shown below each section defines authorizations for the path and
### (optional) repository specified by the section name.
### The authorizations follow. An authorization line can refer to:
###  - a single user,
###  - a group of users defined in a special [groups] section,
###  - an alias defined in a special [aliases] section,
###  - all authenticated users, using the '$authenticated' token,
###  - only anonymous users, using the '$anonymous' token,
###  - anyone, using the '*' wildcard.
###
### A match can be inverted by prefixing the rule with '~'. Rules can
### grant read ('r') access, read-write ('rw') access, or no access
### ('').

[aliases]
# joe = /C=XZ/ST=Dessert/L=Snake City/O=Snake Oil, Ltd./OU=Research Institute/CN=Joe Average

[groups]
# harry_and_sally = harry,sally
# harry_sally_and_joe = harry,sally,&joe

# [/foo/bar]
# harry = rw
# &joe = r
# * =

# [repository:/baz/fuz]
# @harry_and_sally = rw
# * = r
admin = svnadmin
[/]
@admin = rw
* = r
```

### vim passwd
```sh
### This file is an example password file for svnserve.
### Its format is similar to that of svnserve.conf. As shown in the
### example below it contains one section labelled [users].
### The name and password for each user follow, one account per line.

[users]
# harry = harryssecret
# sally = sallyssecretadmins
svnadmin = svnadmin
```

### vim svnserve.conf
```sh
### This file controls the configuration of the svnserve daemon, if you
### use it to allow access to this repository.  (If you only allow
### access through http: and/or file: URLs, then this file is
### irrelevant.)

### Visit http://subversion.apache.org/ for more information.

[general]
### The anon-access and auth-access options control access to the
### repository for unauthenticated (a.k.a. anonymous) users and
### authenticated users, respectively.
### Valid values are "write", "read", and "none".
### Setting the value to "none" prohibits both reading and writing;
### "read" allows read-only access, and "write" allows complete 
### read/write access to the repository.
### The sample settings below are the defaults and specify that anonymous
### users have read-only access to the repository, while authenticated
### users have read and write access to the repository.
anon-access = read
auth-access = write
### The password-db option controls the location of the password
### database file.  Unless you specify a path starting with a /,
### the file's location is relative to the directory containing
### this configuration file.
### If SASL is enabled (see below), this file will NOT be used.
### Uncomment the line below to use the default password file.
password-db = passwd
### The authz-db option controls the location of the authorization
### rules for path-based access control.  Unless you specify a path
### starting with a /, the file's location is relative to the
### directory containing this file.  The specified path may be a
### repository relative URL (^/) or an absolute file:// URL to a text
### file in a Subversion repository.  If you don't specify an authz-db,
### no path-based access control is done.
### Uncomment the line below to use the default authorization file.
authz-db = authz
### The groups-db option controls the location of the file with the
### group definitions and allows maintaining groups separately from the
### authorization rules.  The groups-db file is of the same format as the
### authz-db file and should contain a single [groups] section with the
### group definitions.  If the option is enabled, the authz-db file cannot
### contain a [groups] section.  Unless you specify a path starting with
### a /, the file's location is relative to the directory containing this
### file.  The specified path may be a repository relative URL (^/) or an
### absolute file:// URL to a text file in a Subversion repository.
### This option is not being used by default.
# groups-db = groups
### This option specifies the authentication realm of the repository.
### If two repositories have the same authentication realm, they should
### have the same password database, and vice versa.  The default realm
### is repository's uuid.
realm = /home/ubuntu/svn/repository/
### The force-username-case option causes svnserve to case-normalize
### usernames before comparing them against the authorization rules in the
### authz-db file configured above.  Valid values are "upper" (to upper-
### case the usernames), "lower" (to lowercase the usernames), and
### "none" (to compare usernames as-is without case conversion, which
### is the default behavior).
# force-username-case = none
### The hooks-env options specifies a path to the hook script environment 
### configuration file. This option overrides the per-repository default
### and can be used to configure the hook script environment for multiple 
### repositories in a single file, if an absolute path is specified.
### Unless you specify an absolute path, the file's location is relative
### to the directory containing this file.
# hooks-env = hooks-env

[sasl]
### This option specifies whether you want to use the Cyrus SASL
### library for authentication. Default is false.
### Enabling this option requires svnserve to have been built with Cyrus
### SASL support; to check, run 'svnserve --version' and look for a line
### reading 'Cyrus SASL authentication is available.'
# use-sasl = true
### These options specify the desired strength of the security layer
### that you want SASL to provide. 0 means no encryption, 1 means
### integrity-checking only, values larger than 1 are correlated
### to the effective key length for encryption (e.g. 128 means 128-bit
### encryption). The values below are the defaults.
# min-encryption = 0
# max-encryption = 256

```

## 3、启动应用
```sh
# check authz
$ svnauthz-validate /home/ubuntu/svn/repository/conf/authz
$ svnadmin create /home/ubuntu/svn/repository
$ svnserve -d -r /home/ubuntu/svn
$ curl svn://localhost/repository
```
