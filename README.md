# NodeBB Google SSO Extended

[![NodeBB v4 Ready](https://img.shields.io/badge/NodeBB-%5E4.0.0-blue.svg)](https://nodebb.org)
[![npm version](https://img.shields.io/npm/v/nodebb-plugin-sso-google-extended.svg)](https://www.npmjs.com/package/nodebb-plugin-sso-google-extended)
[![License: BSD-2-Clause](https://img.shields.io/badge/License-BSD_2--Clause-orange.svg)](LICENSE)

An enterprise-grade, enhanced Google Single Sign-On (OAuth 2.0) plugin for **NodeBB v4**. Designed from the ground up for **maximum security**, **frictionless onboarding**, **rich UI/UX customization**, and **effortless administration**.

---

## 🌟 Comprehensive Features

### 🛡️ Enterprise-Grade Security
- **Zero Client Leakage**: Sensitive credentials (`Client Secret`) are strictly kept on the server-side backend. They are never transmitted or exposed to client browser configs.
- **Secure Masking & Visibility Toggle**: Password-masked secret inputs in the Admin Panel with a one-click reveal/hide toggle for safe credential entry without screen peeking.
- **Verified Email Auto-Confirmation**: Optionally skip manual email verification emails when Google has already authenticated and verified the email address owner.
- **Registration Hardening & Access Control**: Restrict Google SSO authentication strictly to existing registered forum members, preventing unwanted account creations when new registrations are closed.
- **Safe Account Association & De-Auth**: Includes user-facing de-authentication flows (`/plugins/sso-google-extended/deauth`) allowing users to unlink their Google credentials safely at any time.

---

### 🚀 Frictionless Administration & Ease of Use
- **One-Click Redirect URI Copy**: Pre-populates your forum's exact Authorised Redirect URI (`{baseUrl}/auth/google/callback`) with a single-click copy button and visual confirmation.
- **Interactive Step-by-Step Setup Guide**: Built-in Google Cloud Console configuration walkthrough directly within the ACP accordion.
- **Real-Time Configuration Status Badge**: Instantly informs administrators whether credentials are `Active & Configured` or if `Credentials Required` before testing logins.
- **Live Interactive Button Preview Widget**: A real-time preview box on the right of the ACP settings dynamically demonstrates exactly how the button, divider, typography, and placement will look to users as you adjust settings.
- **Dynamic Version Indicator**: Displays the active plugin version dynamically fetched from `package.json` for clear troubleshooting.

---

### 🎨 Modern UI/UX & Layout Freedom
- **Primary CTA Placement (Top of Form)**: Positions Google Sign-In prominently **above** the username and password fields as the primary call-to-action, paired with an elegant, responsive "or" divider.
- **Flexible Ordering**:
  - **Top of Form (Primary)**: Embedded above the local login form with divider.
  - **Before Local Form**: Placed before local inputs for prominent visibility.
  - **After Local Form**: Classic side/bottom placement.
- **Official Google Brand Design**: Includes authentic Google white elevation, Google Roboto/Sans typography, subtle hover transitions, and the official Google 4-color SVG identity icon.
- **Theme-Adaptive Standard Style**: Option to switch to the forum theme's standard button styling (`btn-primary`).
- **Clean Desktop Layout**: Automatically cleans up orphaned, redundant "Alternative Logins" headers on desktop displays, perfectly centering the login card.
- **Registration Page Synchronization**: Option to automatically replicate primary button placement on the registration page (`/register`).

---

### 🌍 Native Multi-Language Support (i18n & RTL)
Built using NodeBB's native translation architecture with complete translations across **7 locales**:
- 🇺🇸 **English (US)** – `en-US`
- 🇬🇧 **English (UK)** – `en-GB`
- 🇮🇷 **Persian (Farsi)** – `fa-IR` *(full Right-To-Left / RTL alignment support)*
- 🇩🇪 **German** – `de`
- 🇪🇸 **Spanish** – `es`
- 🇫🇷 **French** – `fr`
- 🇨🇳 **Simplified Chinese** – `zh-CN`

---

## 📦 Installation

Within your NodeBB installation directory, run:

```bash
npm install nodebb-plugin-sso-google-extended
```

Or install it directly via the NodeBB Admin Control Panel (**Plugins** → **Install Plugins**).

Rebuild and restart your NodeBB instance:

```bash
./nodebb build
./nodebb restart
```

---

## ⚙️ Google Cloud Console Setup

1. Open the [Google Cloud Console Credentials Page](https://console.cloud.google.com/apis/credentials).
2. Create or select your project.
3. Configure your **OAuth consent screen** (User Type: External, forum name, and support email).
4. Go to **Credentials** → **Create Credentials** → **OAuth Client ID**:
   - **Application Type**: `Web application`
   - **Name**: `NodeBB Google SSO`
   - **Authorised JavaScript origins**: Your forum URL (e.g., `https://talk.yourdomain.com`)
   - **Authorised redirect URIs**: `https://talk.yourdomain.com/auth/google/callback` *(copy directly from the plugin ACP page)*
5. Copy your **Client ID** and **Client Secret**.

---

## 🔧 Configuration

### 1. Via NodeBB Admin Control Panel (Recommended)
Navigate to **ACP** → **Plugins** → **Google SSO Extended**:
- Enter your **Client ID** and **Client Secret**.
- Select your **Button Placement**:
  - `Top of Form (Primary)`
  - `Before Local Form`
  - `After Local Form`
- Choose your **Visual Style** (*Official Google Brand* or *Standard Button*).
- Select your **Button Label** (*Continue with Google* or *Sign in with Google*).
- Enable/disable registration sync, auto-confirm emails, or alternative logins cleanup.
- Click **Save Changes** and reload NodeBB.

### 2. Via Environment Variables
You can also supply credentials via environment variables:

```bash
export SSO_GOOGLE_CLIENT_ID="your-client-id.apps.googleusercontent.com"
export SSO_GOOGLE_CLIENT_SECRET="your-client-secret"
```

---

## 🏛️ Upstream Lineage & Attribution

This plugin is an extended, modernized fork built upon the foundation of [`nodebb-plugin-sso-google`](https://github.com/NodeBB/nodebb-plugin-sso-google) originally created by **psychobunny** and maintained by **Julian Lam** and the **NodeBB team**.

We extend our deep gratitude to the original creators and contributors for their outstanding work on the NodeBB ecosystem.

- **Original Plugin**: [nodebb-plugin-sso-google](https://github.com/NodeBB/nodebb-plugin-sso-google)
- **Original Authors**: psychobunny (<psycho.bunny@hotmail.com>), Julian Lam, and NodeBB Contributors
- **License**: BSD-2-Clause (retained in [LICENSE](LICENSE))
- **Extended Edition Maintainer**: Mazafard (<https://github.com/Mazafard>)