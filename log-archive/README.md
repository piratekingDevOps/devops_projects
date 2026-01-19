# Log Archive Script

## Project URL

[Log Archive Tool Project](https://roadmap.sh/projects/log-archive-tool)

---

## Overview

This Bash script automates the process of creating a compressed log archive (`.tar.gz`) of a given file or directory.  
It first checks the operating system and ensures that the `tar` utility is installed before creating the archive.

The generated archive is timestamped and stored in `/var/tmp`, with logging of the tar operation.

---

## Features

- Detects the OS type (`Ubuntu` or other RPM-based Linux distributions like CentOS/RHEL).
- Installs `tar` if it is not already available.
- Creates a timestamped `.tar.gz` archive of the specified file or directory.
- Logs the tar operation to `/var/tmp/tar_logs_<timestamp>`.
- Lists the created archive with detailed information.

---

## Prerequisites

- Bash shell
- `sudo` privileges (required if `tar` is not installed)
- Internet access (for installing `tar` if missing)

---

## Usage

```bash
./log-archive.sh <file_or_directory>
