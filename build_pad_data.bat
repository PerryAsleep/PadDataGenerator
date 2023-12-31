@IF "%FUMEN_DEVENV%"=="" (
    echo FUMEN_DEVENV is not defined. Please set FUMEN_DEVENV in your environment variables to the path of your devenv.exe executable.
    exit /b
)

@REM Clean and build the project.
"%FUMEN_DEVENV%" PadDataGenerator.sln /Clean Release /Project PadDataGenerator/PadDataGenerator.csproj
"%FUMEN_DEVENV%" PadDataGenerator.sln /Build Release /Project PadDataGenerator/PadDataGenerator.csproj

@REM Execute the binary to build PadData and StepGraphs
.\PadDataGenerator\bin\Release\net7.0\PadDataGenerator.exe

@REM Copy the results
echo F|xcopy /Y /F /I /exclude:ExcludedPadDataFilesList.txt .\PadDataGenerator\bin\Release\net7.0\*.json .\StepManiaLibrary\StepManiaLibrary
echo F|xcopy /Y /F /I .\PadDataGenerator\bin\Release\net7.0\*.fsg .\StepManiaLibrary\StepManiaLibrary
