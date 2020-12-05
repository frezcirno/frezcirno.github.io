---
title: OracleDB
date: 2020-12-03 12:59:18
---

# Oracle官方文档

- docs.oracle.com/en/database/oracle/oracle-database/index.html

# Schema

- 用户与schema的关系: In Oracle Database, a database schema is a collection of logical data structures, or schema objects. A database user owns a database schema, which has the same name as the user name.

    ![](images/user-schema-tables.png)

# 表空间

    - 逻辑上, 存放数据表的空间

    - Schema和表空间是多对多的关系

    - 物理上, 表空间的存储可能不是连续的

# PL/SQL

- A primary benefit of PL/SQL is the ability to store application logic in the database itself.

# Oracle 体系结构

- Oracle Server = Oracle Instance + Oracle Database

- Oracle实例 (Oracle Instance)

    - Oracle Instance = SGA + Background Process

    - 是一组**OS进程(线程)和一些内存(SGA)**的总称

    - 可以用来mount和open一个数据库

    - 一个实例在其生存期中最多只能装载和打开一个数据库。要想再打开这个（或其他）数据库，必须先丢弃这个实例，并创建一个新的实例。

- Oracle数据库 (Oracle Database)

    - Oracle Database = Controlfile + datafile + logfile + spfile +..

    - 是存储在磁盘上的**一组数据文件**的集合

    - 一般来说, 一个数据库上只有一个实例对其进行操作

        - 但是也有例外: RAC（Real Application Clusters）就允许在集群环境中的多台计算机上操作，这样就可以有多台实例同时装载并打开一个数据库（位于一组共享物理磁盘上）

- *Oracle数据库*和*Oracle实例*的关系

    1. 一个实例能够装载及打开仅仅一个数据库  

    2. 一个数据库能够被多个实例装载并打开(RAC)

# 数据库启动过程

![](images/startup-sequence.png)

# 常用命令

- 查询数据库版本信息

    `SQL> select * from v$version;`
    
- 查看数据库名称

    `SQL> show parameter db_name;`

- 查询全局数据库名称

    `SQL> select * from global_name;`

- 数据库实例

    - 查询当前数据库实例名称

        `SQL> select instance_name from v$instance;`
        
    - 查看数据库实例状态(open/mount等)

        `SQL> select status from v$instance;`

    - 启动数据库实例、加载数据库、打开数据库

        `SQL> startup [nomount | mount | open];`

    - 关闭数据库、卸载数据库、关闭Oracle实例

        `SQL> shutdown [normal | transactional | immediate];`

- 数据库状态

    - 查询数据库打开状态(open/read write)

        `SQL> select open_mode from v$database;`

    - 关闭数据库

        `SQL> alter database close;`

    - 启动数据库

        `SQL> alter database [mount | open];`

- 查看数据库DBF文件位置

    `SQL> select name from v$datafile;`

- 查询数据文件状态

    `SQL> select file#,name,status,enabled,checkpoint_change# from v$datafile;`

- 查询数据文件位置

    `SQL> select name from v$datafile;`

- 查询数据文件（表空间）大小

    `SQL> select sum(bytes)/1024/1024/1024 as GB from v$datafile;`

- 查询有效数据大小

    `SQL> select sum(bytes)/1024/1024/1024 as GB from dba_segments;`

- 查看当前库的所有数据表

    `SQL> select TABLE_NAME from all_tables;`