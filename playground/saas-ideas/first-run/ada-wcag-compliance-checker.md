### Actual prompt used
```md
You are a micro-SaaS market researcher. Your goal is to find ONE promising niche where I (a solo developer) could build a small software product charging $20-100/month and realistically reach $2k+/month in revenue.

Before starting your search, any questions? Anything that is not clear? Anything about me worth knowing that will make your research more productive / more worthwhile?

### next prompt:
1. Due to AI my abilities are varied I can use AI to build all sorts or products, but my forte is: Python, C (low-level), and Webdev (Typescript, react, and python backend)
2. I don't. Or at least I can't think of anything at the moment.
3. full time.
4. No preference, whatever is most likely to succeed in a couple of weeks / months for my 2k/month goal.
5. Nope.
6. I don't.
7. Nope
8. Willing to drop a couple of hundred but lower initial cost is better.
```

### Theoretical single-shot Prompt
```md
You are a micro-SaaS market researcher. Your goal is to find ONE promising niche where I (a solo developer) could build a small software product charging $20-100/month and realistically reach $2k+/month in revenue.

# Some information about me:
1. Due to AI my programming abilities are varied I can use AI to build all sorts or products, but my forte is: Python, C (low-level), and Webdev (Typescript, react, and python backend)

2. I don't have any domain expertise outside of sofware or can't think of any right now.

3. I'm willing to work on this full time.

4. I don't have a preference between B2B or B2C, you can pick whatever is most likely to succeed in a couple of weeks / months for my 2k/months goal.

5. I don't have any distribution channels like youtube, twitter, blog etc...

6. I don't have any hard no's on the ideas.

7. I'm willing to drop a couple of hundred dollars as initial cost but lower is better

# How to do your research
Do some real market research across multiple angles simultaneously through agnets. Launch 3 subagents with different taks and have them run in parallel
```


# Final Recommendation

I cross-referenced ~40 ideas across three research angles (trending micro-SaaS, painful workflows, and API/dev tools). Here's what rose to the top after filtering for your profile (Python/TS, no audience, low budget, $2k/mo target).

## My #1 Pick: ADA/WCAG Accessibility Compliance Checker

**The pitch:** A simplified web accessibility scanner for small businesses at $29-49/mo — the sweet spot between "free but confusing" tools (WAVE, axe DevTools) and enterprise solutions ($199+/mo).

**Why this one stands out across all research:**

| Factor | Signal |
|--------|--------|
| **Purchase motivation** | Fear-driven — ADA lawsuits against websites are surging. Business owners Google "is my website ADA compliant" in a panic. That's a buyer, not a browser. |
| **SEO opportunity** | 8,000+ monthly searches for "ADA compliance tool" alone, plus massive long-tail ("WCAG checker," "website accessibility audit," "ADA compliant website checker"). You have no audience — SEO is your channel, and this niche has clear buying-intent keywords. |
| **Competition gap** | Free tools exist but output confusing technical reports. Enterprise tools ($199+/mo) are overkill for a local bakery or Shopify store. The $29-49/mo tier has ~4 dedicated competitors — that's low. |
| **Tech fit** | Python crawler + axe-core (open-source accessibility engine) + React dashboard. You're not reinventing the wheel — axe-core does the heavy lifting, you build the UX and reporting layer. |
| **Customers needed** | Only 40-70 at $29-49/mo = $2k/mo. That's realistic for SEO-driven acquisition. |
| **Retention** | Compliance is never "done." Websites change, standards update, new pages get added. This is genuinely recurring. |
| **Time to MVP** | 4-6 weeks. Crawl pages → run axe-core → generate plain-English report with prioritized fixes → email when issues found. |
| **Infrastructure cost** | Near zero. A single VPS can crawl thousands of sites. No expensive APIs needed. |

**What the MVP looks like:**
1. User enters their URL
2. Your crawler hits every page (Python + BeautifulSoup/Playwright)
3. axe-core runs accessibility checks against WCAG 2.1 AA
4. Dashboard shows issues ranked by severity with **plain-English fix instructions** (this is the moat — existing free tools dump raw WCAG codes that non-technical business owners can't understand)
5. Weekly/monthly re-scan with email alerts on new issues
6. PDF report they can hand to their developer or use as proof-of-effort if threatened with a lawsuit

---

## Strong Runners-Up (if accessibility doesn't resonate)

**#2 — Platform-Specific Chrome Extension** ($9-29/mo, 100-220 customers)
- Solo devs have built Chrome extensions to $42k-$200k/mo (Closet Tools, GMass)
- Built-in distribution via Chrome Web Store
- The pattern that works: automate a tedious repetitive action on ONE platform (LinkedIn, GitHub, Notion, a marketplace)
- Risk: you'd need to identify the right platform/workflow — this is the broadest category

**#3 — Niche API Service** ($29-99/mo, 30-70 customers)
- OG image generation, link preview extraction, or PDF invoice generation API
- ScreenshotOne hit $21k/mo as a solo dev with a similar model
- Extremely sticky once developers integrate it (nobody rips out working API calls)
- Risk: SEO-dependent distribution takes 3-6 months to kick in

---

## What NOT to Build

The research also surfaced clear anti-patterns:
- **Generic AI wrappers** — 90-95% failure rate. Only hyper-specific vertical tools survive.
- **"Cheaper Slack/Notion/CRM"** — commodity markets with network effects. You'll spend 2 years building and still be invisible.
- **Anything requiring an audience to launch** — you don't have one. Stick to SEO-driven or marketplace-driven distribution.

---

## Suggested Next Step

Don't build for 6 weeks blind. Validate first in ~1 week:

1. **Landing page** with a "Check your site now" free single-page scan (limited results, full report requires signup)
2. **Post it** in r/smallbusiness, r/webdev, r/accessibility, and relevant Facebook groups
3. **Track signups** — if you get 50+ emails in a week, build the full product. If not, test runner-up #2 or #3.
