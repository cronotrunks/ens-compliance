# Security configuration and system customization to comply with the Spanish National Security Framework (ENS)

This package automates basic security configuration and customization of the graphical environment in Linux systems with graphical interface to comply with the National Security Framework (ENS) standard.

It is designed to be installed in corporate environments where a standardized security and presentation configuration is desired.

## ✅ Features

When installing this package, the following configurations will be applied:

- 🦠 **ClamAV Antivirus**.
  The [ClamAV](https://www.clamav.net/) antivirus is installed and properly configured for basic malware protection.

- 📢 **Login informative notice (popup)**.
  A warning or information message is displayed to the user when logging in, through a popup window, advising on the correct use of the system.

- 👥 **User blocking after multiple failed attempts**.
  The system is configured to block a user for **15 minutes** after **5 failed login attempts** (through the `faillock` security module).

- 🖼️ **Corporate wallpaper**.
  A corporate image is installed in `/usr/share/backgrounds/` which is set up as wallpaper.

- 🖼️ **Background configuration on login screen (LightDM)**.
  **LightDM** is configured to automatically display the corporate background during login.

- 👥 **Hiding the user list on login screen**.
  The following session managers are configured to hide the user list and enhance privacy:
  - `lightdm`
  - `sddm`
  - `gdm3`

- 🛠 **Automatic and Secure System Updates**.
  Configures APT to update package lists, download and install critical updates daily, clean cache weekly, and automatically reboot the system at 02:00 if required.

- 🚫 **Disables the ability to use USB storage devices**.
  Udev is properly configured to prevent the recognition of USB storage devices, eliminating the risk of exposure to external agents.

- 💾 **Adds a script that allows secure deletion of any storage device**.
  A bash script is added that allows secure deletion of any storage device.
  Thanks to Teo Ruiz for his original contribution: https://gist.github.com/teoruiz/c6a200e4c3c891885acb53e4fb5faa70

- 🚫 **Configurable blacklists for Google Chrome and Mozilla Firefox browsers**.
  A couple of example files with prohibited URLs have been generated for the aforementioned browsers.

- 🍪 **Adds a script that allows the cleaning of cookies from the user's browsers**.
  A bash script is added that allows the cleaning of cookies from the browsers used by the user (supports Firefox, Chrome, Chromium and Brave).

- 🌍 **Secure Browsing over DNS**.
  Configures the system and major browsers (Firefox and Chrome) to use DNS over TLS and DNSSEC. Cloudflare's DNS servers are set as the system defaults to ensure a secure DNS resolution setup.

- 🛠 **Custom Configuration for Google Chrome and Mozilla Firefox**.
  Additional settings have been applied to the browser configuration files to prevent security vulnerabilities and enforce safer defaults.

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

3. Replace the src/bg-crononauta-1920x1080-dark.png file with your company's corporate background

4. Modify the home page of Google Chrome and Mozilla Firefox in the `src/blocklist.json` and `src/policies.json` files, respectively

5. Generate the Debian package (this command will generate the .deb package in the parent directory):
`dpkg-buildpackage -us -uc -b`

6. Install the generated package:
`sudo dpkg -i ../ens-compliance_*.deb`

7. Resolve any missing dependencies:
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
