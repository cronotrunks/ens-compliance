# Security configuration and system customization to comply with the Spanish National Security Framework (ENS)

This package automates basic security configuration and customization of the graphical environment in Linux systems with graphical interface to comply with the National Security Framework (ENS) standard.

It is designed to be installed in corporate environments where a standardized security and presentation configuration is desired.

## ✅ Features

When installing this package, the following configurations will be applied:

- 🔒 **ClamAV Antivirus**
  The [ClamAV](https://www.clamav.net/) antivirus is installed and properly configured for basic malware protection.

- 🔒 **Login informative notice (popup)**
  A warning or information message is displayed to the user when logging in, through a popup window, advising on the correct use of the system.

- 🚫 **User blocking after multiple failed attempts**
  The system is configured to block a user for **15 minutes** after **5 failed login attempts** (through the `faillock` security module).

- 🖼️ **Corporate wallpaper**
  A corporate image is installed in `/usr/share/backgrounds/` so the user can set it as desktop background.

- 🔐 **Background configuration on login screen (LightDM)**
  **LightDM** is configured to automatically display the corporate background during login.

- 👥 **Hiding the user list on login screen**
  The following session managers are configured to hide the user list and enhance privacy:
  - `lightdm`
  - `sddm`
  - `gdm3`

- 🚫 **Disables the ability to use USB storage devices**
  Udev is properly configured to prevent the recognition of USB storage devices, eliminating the risk of exposure to external agents.

- 💾 **Adds a script that allows secure deletion of any storage device**
  A bash script is added that allows secure deletion of any storage device.
  Thanks to Teo Ruiz for his original contribution: https://gist.github.com/teoruiz/c6a200e4c3c891885acb53e4fb5faa70

- 🚫 **Configurable blacklists for Google Chrome and Mozilla Firefox browsers**
  A couple of example files with prohibited URLs have been generated for the aforementioned browsers.

- 💾 **Adds a script that allows the cleaning of cookies from the user's browsers**
  A bash script is added that allows the cleaning of cookies from the browsers used by the user (supports Firefox, Chrome, Chromium and Brave).

## 🛠️ Debian Package Generation

### 🔧 Requirements to generate the Debian package

- Debian/Ubuntu operating system
- Debian development tools:

```bash
sudo apt-get update
sudo apt-get install build-essential dh-python devscripts debhelper
```

### 📦 Steps to generate the Debian package

1. Clone the repository:
`git clone https://github.com/cronotrunks/ens-compliance.git`

2. Navigate to the project directory:
`cd ens-compliance`

3. Generate the Debian package (this command will generate the .deb package in the parent directory):
`dpkg-buildpackage -us -uc -b`

4. Install the generated package:
`sudo dpkg -i ../ens-compliance_*.deb`

5. Resolve any missing dependencies:
`sudo apt-get install -f`

## 📥 Installation

To install this package, you can use your usual package manager (for example `dpkg -i` or `apt` if it is provided in a repository).

During installation, a **PAM configuration dialog** will appear.
At that moment, select the options related to `faillock` so that the system correctly applies the blocking policies after failed attempts.

## 🔧 Requirements

- Linux distributions based on Debian/Ubuntu
- Supported session managers: `lightdm`, `sddm`, `gdm3`

## 📬 Contributions
Contributions are welcome. Please follow these steps:

- Fork the repository
- Create a branch for your feature (git switch -c feature/new-feature)
- Make your changes and commit them (git commit -m 'Add new feature')
- Push to the branch (git push origin feature/new-feature)
- Open a Pull Request

## 📄 License

This package is distributed under the GPL v2 license. See the `LICENSE` file for more details.
