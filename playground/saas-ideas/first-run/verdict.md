### Prompt:
```md
I'm looking to use my coding skills to engineer something that gets me money passively. Thoroughly analyze the feasability of both ideas in playground/saas-deas. As a means of completing my goal. Analyze which one is more likely to get me to my goal. Then come back with a veredict.

Imporant: Your veredict doesn't matter to me as much as the *WHY* behind it. Why is it feasable? Why not? First go into plan mode so you can ask me some questions / iron any doubts out.
```
### For future you when you read this: (Consider asking the idea generation prompt: first go into plan mode, that is the easiest way to answer questions.)

# Verdict: Certification Tracker vs. ADA/WCAG Compliance Checker

## TL;DR

**Neither idea is great for your specific profile**, but if I had to pick one, the **Certification Tracker** has a marginally better shot — though with serious caveats. Here's why.

---

## Idea 1: ADA/WCAG Compliance Checker — Why It Fails for You

### The case FOR it (what the original doc got right)
- The market is real and growing. 4,000+ ADA website lawsuits in 2024, up 37% YoY in 2025. The European Accessibility Act (June 2025) creates new global demand. The total market is $850M-$1.4B heading to $2-3B by 2030.
- Fear-driven purchases are real — business owners google "is my website ADA compliant" in a panic after getting a demand letter.

### The case AGAINST it (what the original doc missed or glossed over)

**1. You'd be fighting a $50M+ funded gorilla at your exact price point.**
accessiBe has $51-89M annual revenue, 200+ employees, $58.5M in VC funding, and sells at... $49/mo. AudioEye is a *publicly traded company* (NYSE: AEYE). Equally AI already undercuts everyone at $27/mo. The doc said "~4 dedicated competitors in the $29-49 tier" — the truth is there are 5+ well-funded companies with entire sales teams occupying that exact tier.

**2. SEO acquisition is a dead end for you.**
The doc pitched this as an SEO play. But page 1 for every relevant keyword is locked down by W3C (official standards body), WAVE/WebAIM (the gold standard free tool), and funded companies offering free scanners as lead magnets. You have zero domain authority. You'd spend 6-12 months writing content before seeing any organic traffic — that doesn't match your 1-2 month timeline.

**3. The FTC v. accessiBe precedent (Jan 2025) creates real legal liability.**
The FTC fined accessiBe $1 million for claiming its tool makes websites WCAG-compliant. The final order *bars them* from making compliance claims without evidence. If you market your tool with the natural pitch ("make your website ADA compliant"), you're now on FTC notice. If you're honest ("we catch 20-40% of issues"), your marketing is weak.

**4. The accessibility community will actively oppose you.**
Over 1,000 accessibility professionals signed the Overlay Fact Sheet opposing automated solutions. The NFB (National Federation of the Blind) banned accessiBe in 2021. 72% of disabled users rate these tools negatively. In 2024, **1,023 lawsuits specifically targeted websites USING overlays**. Your product could *increase* your customers' legal exposure.

**5. No solo dev has verifiably done this.**
Despite extensive searching, zero confirmed examples of solo devs reaching $2K+/mo in accessibility SaaS. The space is dominated by venture-funded startups and public companies.

**Feasibility score for your profile: 2/10.** The market is real, but you'd be bringing a slingshot to a drone war. Your 1-2 month timeline is completely incompatible with the 6-12 month SEO ramp this idea requires, and you have no alternative distribution channel.

---

## Idea 2: Certification Tracker for Trades — Why It's *Slightly* Better (But Still Hard)

### The case FOR it

**1. The competitive landscape is genuinely thinner.**
The closest direct competitor is ExpirationReminder ($49-$499/mo, founded 2013) — which is generic, not trades-specific. ContractorCompliance.io charges $1,999/yr (way too expensive for a 15-person plumbing company). VAIRKKO is enterprise with custom pricing. Procore/Buildertrend have cert features but they're $300+/mo full-stack construction management platforms. Nobody is specifically building the *simple, cheap, trades-focused* version.

**2. Switching costs are genuinely high.**
Once a company enters 30 employees' certs, 12 insurance policies, and 8 business licenses into your system, they're not moving. This is the kind of data gravity that creates natural retention. This partially mitigates the SMB churn problem (Jason Lemkin says SMB SaaS churn is ~3%/month, but data-heavy tools churn less).

**3. The pain is expensive and quantifiable.**
An expired contractor license = work stoppages, fines (50%+ late fees), inability to bid on jobs. These are $500K-$5M/yr businesses. $49/mo is genuinely a rounding error vs. one compliance failure.

**4. It's a straightforward CRUD app.**
Dashboard + reminders + document upload + user management. No complex algorithms, no AI claims, no legal liability issues. You can build an MVP in 4-6 weeks. The trades vertical has low UI expectations — they want *functional*, not *pretty*.

### The case AGAINST it

**1. Selling to blue-collar SMBs without connections is brutal.**
From Bravado's sales community: *"It can be a tough spot to sell into. Most are going to be blue collar with limited understanding of technology or care for it."* Construction tech products are seen as "nice to haves" that get cut in budget downturns. You have no connections in this world, and you said you prefer inbound over cold outreach. But this market *requires* outbound — these people aren't googling "certification tracking software."

**2. Your 1-2 month timeline is unrealistic for first paying customers.**
Even the original doc says "4-6 weeks to MVP" + "2 weeks to validate." That's already 6-8 weeks before you have even one paying customer. Realistically, add another 4-8 weeks of iterating based on early feedback. You're looking at 3-4 months to first revenue, not 1-2.

**3. The "set it and forget it" churn risk is real.**
A contractor enters all their certs, sets up reminders, and... now what? The tool only sends value when something is about to expire. Between reminder emails, the dashboard sits unused. Some customers will eventually wonder "do I really need to pay $49/mo for what's basically a fancy calendar reminder?" You'd need to continuously justify the value (audit reports, compliance dashboards, new features).

**4. Customer support will be higher than you want.**
Trades business owners are not tech-savvy. Expect phone calls, email hand-holding, "how do I upload a PDF" questions. You said you want to minimize support — this audience will demand more than average.

**5. Remindax exists at $12/mo with a free tier.**
This creates a pricing floor. The original doc suggested $49/mo, but with a free-tier competitor already in the market, your realistic price is more like $15-25/mo. That changes the math: you'd need 80-133 customers instead of 41 to hit $2K MRR.

**6. Platform risk is existential.**
ServiceTitan, Jobber, or Housecall Pro could add a "certifications" tab in a single sprint and instantly reach hundreds of thousands of trades businesses already on their platform. Your entire market could vanish overnight.

**Feasibility score for your profile: 4/10.** Better than the WCAG checker, but the customer acquisition problem is real. Without trades connections or willingness to do heavy cold outreach, you'll struggle to find those first 10 customers.

---

## Head-to-Head Comparison

| Factor | WCAG Checker | Cert Tracker | Why It Matters For You |
|--------|:---:|:---:|---|
| **Competitive intensity** | Brutal (NYSE company + $50M startups) | Moderate (no direct competitor at your price) | You're solo, low budget. Need a gap. |
| **Customer acquisition** | SEO (6-12mo ramp) | Cold outreach (you dislike this) | Neither fits your 1-2mo timeline or preference |
| **Legal/liability risk** | High (FTC precedent) | Low (just a CRUD app) | You don't need regulatory headaches |
| **Technical complexity** | Medium (crawler + axe-core + reporting) | Low (CRUD + reminders + file upload) | Both doable, cert tracker is faster to MVP |
| **Retention/stickiness** | Good (compliance never done) | Good (data gravity) | Roughly equal |
| **Support burden** | Low (tech-aware buyers) | High (trades owners) | You want low support |
| **Time to first $** | 3-6 months (SEO lag) | 3-4 months (outreach lag) | Cert tracker is faster, but neither hits 1-2mo |
| **Solo dev precedent** | None found | None found (but smaller competitors exist) | No proven playbook for either |

---

## The Uncomfortable Truth

Both of these ideas have the same fundamental problem for your profile: **they require a distribution channel you don't have.** The WCAG checker needs SEO you can't compete in. The cert tracker needs cold outreach to trades businesses you have no access to.

The original docs were generated by AI that optimized for "sounds plausible" rather than "matches this specific person's constraints." Both ideas are legitimate businesses that *someone* could build — but "someone" in both cases means a person with either (a) domain connections, (b) an existing audience, or (c) 6+ months of runway and comfort with aggressive outbound sales.

### If you still want to pick one

Go with the **Certification Tracker**, but:
1. Accept the timeline is 3-4 months, not 1-2
2. Budget for 2-3 weeks of "customer discovery" before writing code — find 10 contractors and talk to them
3. If you can't get 3 people to say "I'd pay for that today" in those conversations, pivot fast
4. Consider narrowing even further: not "all trades" but one specific trade (e.g., "OSHA cert tracker for electricians") to make your marketing message razor-sharp

The cert tracker wins not because it's a great fit for you, but because it has fewer *fatal* flaws. The WCAG market has entrenched, well-funded competition and legal landmines that make it nearly impossible for a solo dev to crack. The cert tracker at least has a gap at the right price point — your challenge is just getting in front of the right people.

---

## Additional Data Points (Post-Analysis)

### Cert Tracker — Deeper Churn Math

At $25/mo with 3% monthly churn and $200-350 CAC per customer, you'd be spending half your revenue just on acquisition. To reach $2K MRR you'd need ~100 customers, but accounting for churn you'd have to acquire 130+ total.

### Cert Tracker — The "Pain" is Moderate

The research couldn't find significant Reddit/forum complaints about this problem. Most contractors rely on state-mailed renewal notices + spreadsheets, and for 1-5 person shops, that's genuinely good enough.

### The Core Takeaway

**Distribution is the real product, and code is the easy part.** Neither idea solves the distribution problem for a solo dev with no audience, no domain connections, and a 1-2 month revenue timeline.

---

*Analysis date: 2026-02-14. Based on real market research, competitor pricing, lawsuit data, and industry sources.*
