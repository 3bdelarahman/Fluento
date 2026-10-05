# Fluento Article Sources, Licensing & Redistribution Policy

This document details the licensing terms, redistribution rights, and pedagogical adaptation guidelines for all content sources utilized within Fluento.

> ⚠️ **Important Notice for App Publishing:**
> Before submitting Fluento to public application stores (Google Play Store, Apple App Store), please re-verify all third-party license agreements and API terms of service.

---

## 1. Summary of Integrated Content Sources

| Source | Identifier | Content Type | Redistribution Allowed? | Adaptation / Translation Allowed? | Primary License / Terms |
| :--- | :--- | :--- | :---: | :---: | :--- |
| **VOA Learning English** | `voa_learning_english` | RSS Feed | **YES** | **YES** | **US Public Domain** (Works produced by USAGM / Voice of America employees as part of official duties are in the public domain in the US). |
| **NASA News & Features** | `nasa` | RSS Feed | **YES** | **YES** | **US Public Domain** (NASA content is not protected by copyright unless an explicit copyright notice is indicated). |
| **Wikipedia (The Free Encyclopedia)** | `wikipedia` | REST API | **YES** | **YES (Share-Alike)** | **CC BY-SA 4.0** (Attribution required: author, link to original article, and notice of CC BY-SA license). |
| **Global Voices** | `global_voices` | RSS Feed | **YES** | **YES** | **CC BY 3.0** (Attribution required: author credit and link back to globalvoices.org). |
| **The Conversation** | `the_conversation` | Atom Feed | **CONDITIONAL** | **NO (No Derivatives)** | **CC BY-ND 4.0** (Must remain **completely unmodified**, accompanied by author attribution and link. Never translate or simplify this content). |
| **The Guardian** | `guardian` | REST API | **NO** | **NO** | **The Guardian Open Platform Terms** (Content may only be fetched on-device with a user-supplied API key; must **never** be cached or saved into the public `articles.json` bundle). |
| **Fluento Official CDN** | `remote_json` | JSON Feed | **YES** | **YES** | **Curated & Filtered Bundle** hosted on GitHub Pages (`https://3bdelarahman.github.io/Fluento/articles.json`). |

---

## 2. Source-by-Source Redistribution Rules

### 1. VOA Learning English
- **Redistributable:** `true`
- **Terms:** As a service of the U.S. Agency for Global Media, VOA original text and educational reporting are public domain in the United States.
- **Pedagogical Use:** Fully permissible for CEFR grading, text segmentation, phonetic alignment, and Egyptian Arabic translation.

### 2. NASA News & Features
- **Redistributable:** `true`
- **Terms:** NASA material is generally not protected by copyright unless stated otherwise.
- **Attribution:** "NASA Editorial / Jet Propulsion Laboratory".

### 3. Wikipedia (English & Simple English)
- **Redistributable:** `true`
- **Terms:** Licensed under **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**.
- **Attribution Requirement:** Each Wikipedia article rendered inside Fluento displays:
  - Source Title and Author ("Wikipedia Contributors")
  - Canonical Desktop Article URL
  - Explicit CC BY-SA 4.0 notice with link back to Wikimedia.

### 4. Global Voices
- **Redistributable:** `true`
- **Terms:** Licensed under **Creative Commons Attribution 3.0 (CC BY 3.0)**.
- **Attribution Requirement:** Author name and canonical article link must accompany the excerpt.

### 5. The Conversation
- **Redistributable:** `false` for public republished archives
- **Terms:** Licensed under **Creative Commons Attribution-NoDerivatives 4.0 (CC BY-ND 4.0)**.
- **CRITICAL RESTRICTION:** Content must remain **completely unmodified**. The automated translation pipeline and text simplification models are strictly disabled for articles originating from *The Conversation*.

### 6. The Guardian
- **Redistributable:** `false`
- **Terms:** Governed by The Guardian Open Platform Terms of Service.
- **CRITICAL RESTRICTION:** The terms forbid distributing full article text via third-party repositories. The Guardian source requires an explicit API key passed via `--dart-define=GUARDIAN_API_KEY`. It runs purely on-device and is strictly excluded from `articles.json` generation.

---

## 3. Reader Attribution Display in Fluento

Every article opened in `ArticleReaderScreen` includes:
1. Source attribution badge with the publisher name.
2. Stated license badge (e.g. `CC BY-SA 4.0` or `Public Domain`).
3. Tappable "Read Original Article" link directing to the canonical web publication.
