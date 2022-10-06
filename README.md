# db-mysql-cp-lookup
Scripts to setup a MySQL/MariaDB database and load the Ofcom Numbering Data into it.

The original service, getCP, was all MariaDB backed, so I'm sharing the scripts that I used to load that data every week so that you can maintain your own database for this should you feel the desire.

None of the Ofcom data that this database needs is included in this repo, it is downloaded when you run the build scripts, please check their license terms before running the script to make sure you accept them, they're a Government body, so the data should be under the Open Government License or Crown Copyright, but, check. #NotALawyer.

**This script assumes that you have installed MySQL/MariaDB and it's all setup and ready, and that you have access to a user account that can CREATE DATABASEs and TABLES, etc.
