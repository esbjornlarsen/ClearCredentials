##
#
#        - Simple script to clear out credentials for TFS in
#          Visual Studio 2013/2015 TFS and Subversion on a 
#          local computer.
#
#        - Used to ensure all developers are logged out of
#          TFS/SVN on a local computer.
#
#        - Ensures that the current developer checks in code
#          as him/her self and not accidentally as another
#          user.
#
#########

##
# CLEAR CREDENTIALS FOR SUBVERSION
#########
$svnPath = $env:appdata + "\subversion\auth\svn.simple\";
$svnCount = (Get-ChildItem -Path $svnPath -ErrorAction SilentlyContinue).Count
IF ($svnCount -gt 0)
{
    Remove-Item $svnPath\* -Force;
}
##
# CLEAR CREDENTIALS FOR TEAM FOUNDATION SERVER
#########

# define visual studio versions
$vshash = @{};
$vshash['VS2013']='12.0';
$vshash['VS2015']='14.0';

foreach ($value in $vshash.Values)
{
    $regUserToken = "HKCU:\Software\Microsoft\VSCommon\{0}\ClientServices\TokenStorage\VisualStudio" -f $value;
    IF ((Get-ChildItem -Path $regUserToken -ErrorAction SilentlyContinue).SubKeyCount -gt 0)
    {
        Remove-Item -Path $regUserToken\* -Recurse -Force;
    }
    
    $regUserCache = "HKCU:\Software\Microsoft\VisualStudio\{0}\ConnectedUser\IdeUser" -f $value;
    IF((Get-ChildItem -Path $regUserCache -ErrorAction SilentlyContinue).Count -gt 0)
    {
        Remove-Item -Path $regUserCache\* -Recurse -Force;
    }

    $regTFSInstances = "HKCU:\Software\Microsoft\VisualStudio\{0}\TeamFoundation\Instances" -f $value;
    IF((Get-ChildItem -Path $regTFSInstances -ErrorAction SilentlyContinue).Count -gt 0)
    {
        Remove-Item -Path $regTFSInstances\* -Recurse -Force;
    }
}

$regUserCacheGeneric = "HKCU:\Software\Microsoft\VSCommon\ConnectedUser";
IF((Get-ChildItem -Path $regUserCacheGeneric -ErrorAction SilentlyContinue).Count -gt 0)
{
    Remove-Item -Path $regUserCacheGeneric\* -Recurse -Force;
}
