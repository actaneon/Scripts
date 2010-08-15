set nowrap;

show users;
show tables;
show databases;

use mysql;
create user 'jking'@'localhost' identified by 'zaza';
grant all privileges on *.* to 'jking'@'localhost' with grant option;
create user 'admin'@'localhost';
grant reload,process on *.* to 'admin'@'localhost';

