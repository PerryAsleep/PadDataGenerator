# PadDataGenerator

`PadDataGenerator` is an application for generating [PadData](https://github.com/PerryAsleep/StepManiaLibrary/blob/main/StepManiaLibrary/docs/PadData.md) files and [StepGraph](https://github.com/PerryAsleep/StepManiaLibrary/blob/main/StepManiaLibrary/docs/StepGraphs.md) files for a [ChartType](https://github.com/PerryAsleep/StepManiaLibrary/blob/main/StepManiaLibrary/docs/ChartType.md) from simple input.

## Usage

Double-click `PadDataGenerator.exe` to generate new files from a built binary.

Alternatively, run `build_pad_data.bat` to build the Release binary, run it, and copy the resulting data to the `StepManiaLibrary` folder.

## Building From Source
Building from source requires Windows 10 or greater and Microsoft Visual Studio Community 2022.

Clone the repository and init submodules.
```
git clone https://github.com/PerryAsleep/PadDataGenerator.git
git submodule update --init --recursive
```

Add an environment variable for `FUMEN_DEVENV` set to the path of your Visual Studio `devenv.exe`, e.g. `C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe`. This is necessary for running `build_pad_data.bat`.

Open `PadDataGenerator.sln` and build through Visual Studio.

## Configuration

`PadDataGenerator` can be configured via the `input.json` file in the application's install directory. The `PadDataInput` object is a dictionary of `ChartType` to Input objects.

### Input Objects

- **Positions**: Array type. The X and Y positions of all the arrows which make up the `PadData`. It is expected this array is ordered matching the order the arrows are displayed during the game.
- **MaxXSeparationBeforeStretch**: Optional. Integer type. Defualt `2`. The maximum separation in X before considering two arrows to result in a stretch position.
- **MaxYSeparationBeforeStretch**: Optional. Integer type. Defualt `2`. The maximum separation in Y before considering two arrows to result in a stretch position.
- **MaxXSeparationCrossoverBeforeStretch**: Optional. Integer type. Defualt `1`. The maximum separation in X before considering two arrows to result in a stretch position when crossed over.
- **MaxYSeparationCrossoverBeforeStretch**: Optional. Integer type. Defualt `2`. The maximum separation in Y before considering two arrows to result in a stretch position when crossed over.
- **MaxXSeparationBracket**: Optional. Integer type. Defualt `1`. The maximum separation in X to consider two arrows to be bracketable together.
- **MaxYSeparationBracket**: Optional. Integer type. Defualt `1`. The maximum separation in Y to consider two arrows to be bracketable together.
- **GenerateStepGraph**: Optional. Boolean type. Defualt `true`. Whether or not to generate a `StepGraph` file for this `ChartType`.

### Example `input.json`

```json
{
	"PadDataInput":
	{
		"dance-single":
		{
			"Positions": [
				{"X": 0, "Y": 1},
				{"X": 1, "Y": 2},
				{"X": 1, "Y": 0},
				{"X": 2, "Y": 1},
			],
		},
		"dance-double":
		{
			"Positions": [
				{"X": 0, "Y": 1},
				{"X": 1, "Y": 2},
				{"X": 1, "Y": 0},
				{"X": 2, "Y": 1},
				{"X": 3, "Y": 1},
				{"X": 4, "Y": 2},
				{"X": 4, "Y": 0},
				{"X": 5, "Y": 1},
			],
		},
		"dance-solo":
		{
			"Positions": [
				{"X": 0, "Y": 1},
				{"X": 0, "Y": 0},
				{"X": 1, "Y": 2},
				{"X": 1, "Y": 0},
				{"X": 2, "Y": 0},
				{"X": 2, "Y": 1},
			],
		},
		"dance-threepanel":
		{
			"Positions": [
				{"X": 0, "Y": 0},
				{"X": 1, "Y": 2},
				{"X": 2, "Y": 0},
			],
		},
		"pump-single":
		{
			"Positions": [
				{"X": 0, "Y": 2},
				{"X": 0, "Y": 0},
				{"X": 1, "Y": 1},
				{"X": 2, "Y": 0},
				{"X": 2, "Y": 2},
			],
		},
		"pump-halfdouble":
		{
			"Positions": [
				{"X": 0, "Y": 1},
				{"X": 1, "Y": 0},
				{"X": 1, "Y": 2},
				{"X": 2, "Y": 2},
				{"X": 2, "Y": 0},
				{"X": 3, "Y": 1},
			],
		},
		"pump-double":
		{
			"Positions": [
				{"X": 0, "Y": 2},
				{"X": 0, "Y": 0},
				{"X": 1, "Y": 1},
				{"X": 2, "Y": 0},
				{"X": 2, "Y": 2},
				{"X": 3, "Y": 2},
				{"X": 3, "Y": 0},
				{"X": 4, "Y": 1},
				{"X": 5, "Y": 0},
				{"X": 5, "Y": 2},
			],
		},
		"smx-beginner":
		{
			"Positions": [
				{"X": 0, "Y": 0},
				{"X": 1, "Y": 0},
				{"X": 2, "Y": 0},
			],
		},
		"smx-single":
		{
			"Positions": [
				{"X": 0, "Y": 1},
				{"X": 1, "Y": 2},
				{"X": 1, "Y": 1},
				{"X": 1, "Y": 0},
				{"X": 2, "Y": 1},
			],
		},
		"smx-dual":
		{
			"Positions": [
				{"X": 0, "Y": 0},
				{"X": 1, "Y": 0},
				{"X": 2, "Y": 0},
				{"X": 3, "Y": 0},
				{"X": 4, "Y": 0},
				{"X": 5, "Y": 0},
			],
		},
		"smx-full":
		{
			"Positions": [
				{"X": 0, "Y": 1},
				{"X": 1, "Y": 2},
				{"X": 1, "Y": 1},
				{"X": 1, "Y": 0},
				{"X": 2, "Y": 1},
				{"X": 3, "Y": 1},
				{"X": 4, "Y": 2},
				{"X": 4, "Y": 1},
				{"X": 4, "Y": 0},
				{"X": 5, "Y": 1},
			],
		},
	}
}
```