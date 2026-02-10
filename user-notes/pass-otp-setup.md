# Setting up pass + pass-otp for terminal-first TOTP

## Install
```bash
sudo pacman -S pass pass-otp
```

## Prerequisites
You need a GPG key. If you don't have one:
```bash
gpg --full-gen-key   # RSA 4096, no expiry is fine for local use
```

## Init the password store
```bash
pass init <your-gpg-key-id>   # gpg --list-keys to find it
pass git init                  # optional: version-control the store
```

## Storing passwords
```bash
pass insert web/github         # type password interactively
pass generate web/gitlab 20   # generate a random 20-char password
pass -c web/github             # copy to clipboard for 45s
```

## Adding TOTP secrets
When a site shows you a QR code for "Google Authenticator", it encodes a URI like:
`otpauth://totp/Service:user@email?secret=JBSWY3DPEHPK3PXP&issuer=Service`

You can extract it by scanning the QR or copying the "manual setup key."

```bash
# From a URI
pass otp insert web/github-otp
# paste the otpauth:// URI

# Or from just the secret
pass otp append -s -i Github -a user@email web/github
# paste the secret key
```

## Getting a code
```bash
pass otp web/github-otp        # prints the 6-digit code
pass otp -c web/github-otp     # copies to clipboard
```

## dmenu integration
`pass` ships with `passmenu` which fuzzy-searches entries via dmenu.
For OTP, a small script like this works:

```bash
#!/bin/sh
entry=$(find ~/.password-store -name '*.gpg' | sed 's|.*password-store/||;s|\.gpg$||' | dmenu -p "otp:")
[ -n "$entry" ] && pass otp -c "$entry"
```

Bind that to a key in dwm and you get TOTP codes in two keystrokes.
