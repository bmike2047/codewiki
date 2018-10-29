## CodeWiki
CodeWiki it's a simple wiki that supports syntax highlighted code

### Environment requirements
- CentOS 6.9
- ruby 2.5.3
- rails 5.2.1
- postgresql-9.6
- Firefox 45+

### Environment setup
It is not required that you follow this setup, as long as you have all the software versions from above, installed on your own environment.<br/>
You can skip directly to Environment configuration
##### Installing ruby on CentOS 6 using RVM
As root user execute the followng commands
```bash
sudo yum update
sudo yum install curl
curl -L get.rvm.io | bash -s stable
source /usr/local/rvm/rvm.sh
rvm requirements
(install all requirements suggested)
rvm install 2.5.3
rvm use 2.5.3 --default
```
##### Installing rails 
As root user execute the followng commands
```bash
    gem install rails
```
    
##### Installing postgresql
As root user execute the followng commands
```bash
    yum install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-6-x86_64/pgdg-centos96-9.6-3.noarch.rpm
    yum install postgresql96*
    service postgresql-9.6 initdb
    chkconfig postgresql-9.6 on
    service postgresql-9.6 start
```


### Environment configuration
##### Configure postgresql
As root user execute the followng commands
```bash
    su - postgres
    psql
    create role root with createdb login password '12345678';  //we installed the db as root so we add root, you can skip this part if you have other user configured
    
    //Bellow we enable standalone sql clients to connect to our db
    vi /var/lib/pgsql/9.6/data/pg_hba.conf
    replace
    host    all             all             127.0.0.1/32            ident
    with
    host    all             all             127.0.0.1/32            md5
    
    service postgresql-9.6 restart
```

##### Configure wikicode and rails
Download the project from this repository and extract it to a folder named codewiki.<br/>
As root user execute the followng commands

```bash
    cd codewiki
    bundle install
    rails db:create
    rails db:migrate

```
**Note**:Because we installed the db as root and we run rails as root, rails will connect to db as root without asking for any password.<br/>
**Note**:rails db:create should create the following dbs 'codewiki_development' and 'codewiki_test'.


### Application test and startup
As root user execute the followng commands
```bash
cd codewiki
rails test:run TESTOPTS="-v"
rails s
```
**Note**: The application will start in development mode at http://localhost:3000/


## Application notes
- To add syntax highlighted code when creating/editing an article go to body->insert->code sample->use language dropdown
- When using "forgot password" the sent mail will be opened on your browser as we used gem "letter_opener". There is no need for smtp setup. letter_open will mock it for us.
- The search function (top->right nav) will search the input text inside the article title **or** the article language

#### TODO
- TODO: complete refactoring of layout
- TODO: add more test cases
