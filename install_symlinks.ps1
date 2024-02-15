# symlink creation requires admin privileges; you might want to use install_symlinks_as_admin.ps1 to escalate to admin;
# this script makes symlinks at some path that point back to the bat files in the current dir
foreach ($file in Get-ChildItem -Path "*" -Include "*.bat") {
    New-Item -Force -ItemType SymbolicLink -Path "C:\SomeFolder\$($file.Name)" -Target "$file"
}
