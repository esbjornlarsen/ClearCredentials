# ClearCredentials

Simple script to clear out credentials for Visual Studio 2013/2015 TFS and Subversion on a local computer.

## Purpose

Prevent a situation where a developers accidentally checks in code as another user. This can happen when multiple developers access the same machine and the current user does not login as him/her self in either Subversion and/or Visual Studio TFS.

## How
Finds stored logon credentials in local folders and in the Windows registry and deletes/removes them.

## Tests

Only tested with the following installation packages
* TortoiseSVN
* Visual Studio 2013 / Windows 10
* Visual Studio 2013 / Windows Server 2012
* Visual Studio 2015 / Windows 10
* Visual Studio 2015 / Windows Server 2012
