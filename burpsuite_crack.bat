@pushd %~dp0
@call openjdk
@start javaw -jar burpsuitloader.jar
@popd
