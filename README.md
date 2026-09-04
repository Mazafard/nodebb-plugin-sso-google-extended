# NodeBB Google SSO Extended

[![NodeBB v4 Ready](https://img.shields.io/badge/NodeBB-%5E4.0.0-blue.svg)](https://nodebb.org)
[![npm version](https://img.shields.io/npm/v/nodebb-plugin-sso-google-extended.svg)](https://www.npmjs.com/package/nodebb-plugin-sso-google-extended)
[![License: BSD-2-Clause](https://img.shields.io/badge/License-BSD_2--Clause-orange.svg)](LICENSE)

An enhanced Google Single Sign-On (OAuth 2.0) plugin for **NodeBB v4**, featuring primary login button placement, official Google Identity styling, and a modern Bootstrap 5.3 admin control panel.

---

## Key Features

- 🌟 **Primary Login Placement**: Position the Google Sign-in button directly **above** the username and password fields as the primary call-to-action, complete with an elegant "or" divider.
- 🔄 **Section Reordering**: Option to place alternative login providers before (or to the left of) the local login form.
- 🎨 **Official Google Identity Design**: Uses authentic Google branding, colors, hover transitions, multi-color SVG icon, and seamless dark-mode support.
- ⚡ **Registration Form Integration**: Option to automatically replicate the primary button placement on the registration page (`/register`).
- 🛡️ **Account Verification & Registration Controls**:
  - Automatically mark Google-verified emails as confirmed (bypassing activation emails).
  - Restrict Google SSO to existing members only (disabling new registrations via SSO).
- 🛠️ **NodeBB v4 & Bootstrap 5.3 Ready**: Built using modern NodeBB v4 hooks and modern ACP card layouts.

---

## Installation

Within your NodeBB installation directory, run:

```bash
npm install nodebb-plugin-sso-google-extended
```

Or install it directly via the NodeBB Admin Control Panel (**Plugins** → **Install Plugins**).

---

## Google API Credentials Setup

1. Go to the [Google Cloud Console / API Manager](https://console.cloud.google.com/apis/credentials).
2. Create a **New Project** (e.g., `NodeBB Community`).
3. Configure the **OAuth consent screen** (User Type: External, fill in your forum's name and support email).
4. Go to **Credentials** → **Create Credentials** → **OAuth Client ID**:
   - **Application Type**: `Web application`
   - **Name**: `NodeBB SSO` (or any label)
   - **Authorised JavaScript origins**: Your forum URL (e.g., `https://forum.example.com`)
   - **Authorised redirect URIs**: `https://forum.example.com/auth/google/callback` *(replace with your forum's exact URL)*
5. Copy the generated **Client ID** and **Client Secret**.

---

## Configuration

You can configure the plugin in two ways:

### 1. Via NodeBB Admin Control Panel (Recommended)
Navigate to **ACP** → **Plugins** → **Google SSO Extended**:
- Enter your **Client ID** and **Client Secret**.
- Choose your **Button Placement**:
  - **Top of Login Form (Primary / Recommended)**: Embedded directly above the login inputs with an elegant divider.
  - **Before Local Login Section**: Displayed first / left column.
  - **After Local Login Section**: Default NodeBB side/bottom placement.
- Select your **Visual Style** (*Official Google Branded* or *Standard*).
- Customize button label text (*Continue with Google* / *Sign in with Google*).
- Click **Save** and restart your NodeBB.

### 2. Via Environment Variables
You can also supply your credentials using environment variables:

```bash
export SSO_GOOGLE_CLIENT_ID="your-client-id.apps.googleusercontent.com"
export SSO_GOOGLE_CLIENT_SECRET="your-client-secret"
```

---

## Upstream Lineage & Attribution

This plugin is an extended fork built upon the foundation of [`nodebb-plugin-sso-google`](https://github.com/NodeBB/nodebb-plugin-sso-google) originally created by **psychobunny** and maintained by **Julian Lam** and the **NodeBB team**.

We extend our gratitude to the original creators and contributors for their work on the NodeBB ecosystem.

- **Original Plugin**: [nodebb-plugin-sso-google](https://github.com/NodeBB/nodebb-plugin-sso-google)
- **Original Authors**: psychobunny (<psycho.bunny@hotmail.com>), Julian Lam, and NodeBB Contributors
- **License**: BSD-2-Clause (retained in [LICENSE](LICENSE))
- **Extended Edition Maintainer**: Mazafard (<https://github.com/Mazafard>)