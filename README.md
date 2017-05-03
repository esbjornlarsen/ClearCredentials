# ClearCredentialsForSVNTFS
Simple script to clear out credentials for Visual Studio 2013/2015 TFS and Subversion on a local computer.

## Purpose
Prevents situations where developers accidentally checks in code as another user. This can happen when multiple developers access the same machine and the current user does not login as him/her self in either Subversion and/or Visual Studio TFS. Running this script will force the developer to login to TFS and Subversion.

## What
Finds stored logon credentials in local folders and in the Windows registry and deletes/removes them.

## How to use
Running this script e.g. during startup of VMs or before opening Visual Studio on a machine will clear out credentials. This will force the user to login to TFS and Subversion the next time the user attempts an action against the service.

## Test
Tested only with the following installation packages
* TortoiseSVN
* Visual Studio 2013 / Windows 10
* Visual Studio 2013 / Windows Server 2012
* Visual Studio 2015 / Windows 10
* Visual Studio 2015 / Windows Server 2012
