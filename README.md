# What is `jobinfo`?
Researchers on a Linux-based computing system submit computing jobs to run and process their research data. Information on these jobs is collated in an output table as they run and provide a record of the resources used by the job. [`jobinfo`](https://github.com/ahama92/jobinfo) extracts useful information from such tables, including,
- Allocation code(s) corresponding to a user.
- Most recently submitter job ID.
- Total CPU usage in core-hours.
- Total memory usage in GB.

# Installation Instructions
### Prerequisites
- Ensure Python 3.6+ is installed.
```console
python --version
```
or
```console
python3 --version
```

- If you don't have Python 3.6+ installed, go to [the official webpage](https://www.python.org/downloads/) and follow the instructions to install the latest version.

- `pip` Should come with Python, but ensure it's up to date.
```console
python -m pip install --upgrade pip
```

### Install the Package (method 1)
- The easiest way is to use `pip` package manager.
```console
pip install --upgrade jobinfo
```

- For a user-specific install (to avoid system-wide install),
```console
pip install --user jobinfo
```

### Install the Package (method 2)
- If installation method 1 fails, you can get the source code and build from scratch.
```console
git clone https://github.com/ahama92/jobinfo.git
cd jobinfo
pip install -e .
```

### Installation Confirmation
- Check if `jobinfo` is installed correctly.
```console
jobinfo --version
```

### Troubleshooting
If you use Windows, I highly recommend installing [the Ubuntu app from Microsoft Store](https://apps.microsoft.com/detail/9PDXGNCFSCZV?hl=en-us&gl=CA&ocid=pdpshare) and using it as your daily driver. This way you can stay in Windows but enjoy most of what Linux has to offers. If you still want to use Windows for some reason and you face issues with running `jobinfo`, here are some possible remedies.
- Check if `jobinfo` was installed.
```console
pip show jobinfo
```
- The output should show the installation location similar to `c:\users\USER\appdata\local\packages\pythonsoftwarefoundation.python.3.9_qbz5n2kfra8p0\localcache\local-packages\python39\site-packages`.
- Go to that path in your file explorer.
- Then go one step up. In my example it would be the `python39\` folder.
- Then go to the `Scripts` folder.
- Copy the path.
- Then type the following command in a Windows PowerShell.
```console
$env:Path += ";C:\Users\USER\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\Scripts"
```
- Don't forget to change the path to that one you just copied, not my example!

# Software Prerequisites
- Python 3.6 or higher.

# Usage Guide
### Basic Usage
```console
jobinfo FILENAME -u USER [-a] [-r] [-c] [-m] [-s] [-v] [-h]
```

### Options
- `-h`, `--help` shows the help message and exits.
- `-u USER`, `--user USER` the username.
- `-a`, `--alloc` show allocation code(s).
- `-r`, `--recent` show most recent job ID.
- `-c`, `--cpu` show total CPU usage in core-hours.
- `-m`, `--mem` show total memory usage in GB.
- `-s`, `--simple` simple output formatting (no table).
- `-v`, `--version` prints version information and exits.

### Examples
Let's try out a few examples with the [`test.csv`](./tests/test.csv). This files contains the following information.
```
|Username|Allocation|JobID |CPUs|JobDuration|Memory|
|--------|----------|------|----|-----------|------|
|user1   |alloc-1   |111111|16  |1800       |180   |
|user2   |alloc-2   |222222|8   |600        |36    |
|user2   |alloc-3   |333333|32  |480        |600   |
```

- Extract the allocation code(s) for user `user1`. 
```console
jobinfo test.csv -u user1 -a
```
![test-1](./docs/test-1.png)

- Extract the total CPU and memory usage for user `user2`. 
```console
jobinfo test.csv -u user2 -a
```
![test-1](./docs/test-2.png)

- Extract allocation code(s), most recent job ID, as well as total CPU and memory usage for user `user2`. Print the output in simple formatting with no table. 
```console
jobinfo test.csv -u user2 -arcms
```
![test-1](./docs/test-3.png)

### Notes
Make sure the input file is in [CSV](https://www.loc.gov/preservation/digital/formats/fdd/fdd000323.shtml) format with exactly the following header,
```
Username,Allocation,JobID,CPUs,JobDuration,Memory
```