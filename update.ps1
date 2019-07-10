Remove-Item mdview-2.5 -Recurse
mkdir mdview-2.5
Copy-Item -Path mdview-latest/* -Recurse -Destination mdview-2.5
(Get-Content .\mdview-2.5\Dockerfile) | %{ $_ -replace "latest","2.5" } | Set-Content .\mdview-2.5\Dockerfile

Remove-Item mdview-3.0 -Recurse
mkdir mdview-3.0
Copy-Item -Path mdview-latest/* -Recurse -Destination mdview-3.0
(Get-Content .\mdview-3.0\Dockerfile) | %{ $_ -replace "latest","3.0" } | Set-Content .\mdview-3.0\Dockerfile

Remove-Item mdview-3.2 -Recurse
mkdir mdview-3.2
Copy-Item -Path mdview-latest/* -Recurse -Destination mdview-3.2
(Get-Content .\mdview-3.2\Dockerfile) | %{ $_ -replace "latest","3.2" } | Set-Content .\mdview-3.2\Dockerfile
