# US Chips New Limit and China Alternative Supplier

On November 19, 2026, a new U.S. export control rule officially took effect to block remote access to advanced AI semiconductors through overseas data centers. Issued by the Department of Commerce's Bureau of Industry and Security (BIS), the rule closes a cloud computing loophole used by restricted entities to bypass physical chip export bans.

## Key Provisions of the New Rule

* **Remote Access Restrictions.** Companies in arms-embargoed countries (Country Group D:5, which includes China, Russia, Iran, North Korea, and Cuba) are restricted from remotely accessing significant volumes of advanced AI chips via connected cloud computing.
* **Third-Country Data Center Oversight.** Overseas data centers serving clients in restricted nations must identify their end users. Licenses are also required to export or reexport advanced AI chips to data center operators in specific transit and hosting countries, including Singapore, Malaysia, Thailand, Indonesia, and Brazil.
* **Chip Foundry Controls.** The rule limits the pathways that front-end chip fabricators and packaging companies can use to bypass presumptions of denial when producing advanced-node logic chips for designers in restricted destinations.
* **Commercial Exemptions.** Standard consumer functions, such as commercial recommender systems used by social media platforms and online retailers, are exempt from the new licensing requirements.
* **Formal Rescission of the Biden-Era Rule.** The regulation formally revokes the never-enforced January 2025 AI Diffusion Rule, eliminating its global country tiers, model weight controls, and Data Center Validated End User (VEU) provisions.

## Context and Recent Developments

* **The Nvidia and Megaspeed Fallout.** The rule was accelerated following scrutiny over Singapore-based data center operator Megaspeed International, which allegedly provided Chinese firms with remote access to U.S. chips housed in Malaysian facilities. The controversy coincided with the recent resignation of Nvidia CEO Jensen Huang amid a federal investigation into an alleged relationship with a former Megaspeed executive.
* **APEC Summit Remarks.** The rule went into effect on the same day President Donald Trump spoke at the APEC summit in Shenzhen, China, where he pushed back against broad international AI safety regulations, arguing that heavy-handed global rules would "stifle" the development of what the administration now officially terms "Super Intelligence" (SI).
* **Public Comment Period.** While the interim final rule is immediately enforceable as of November 19, 2026, BIS is accepting public comments on the revisions through January 19, 2027.

---

To navigate tightening U.S. export restrictions—including recent curbs targeting remote cloud access via third-party data centers—Chinese AI developers are pivoting heavily toward domestic chip designers led by Huawei, Cambricon, and Alibaba's T-Head, alongside domestic fabrication by SMIC.

Because U.S. export rules rely on the Foreign Direct Product Rule (FDPR), major non-U.S. foundries and chipmakers (such as Taiwan's TSMC and South Korea's Samsung) are also restricted from supplying advanced AI processors to China without U.S. licenses. As a result, China's viable compute supply relies almost entirely on its homegrown ecosystem rather than third-country suppliers.

## Top Chinese Domestic AI Chip Suppliers

Domestic vendors have rapidly captured market share, supplying over 40% of local AI server shipments as major models (such as DeepSeek and Qwen) optimize their software stacks to run natively on local silicon.

* **Huawei (HiSilicon).** The undisputed domestic leader, offering the Ascend 910B/910C accelerators and Atlas 950 supernode clusters. Backed by its proprietary CANN software ecosystem, Huawei is the primary choice for large-scale foundational model training.
* **Cambricon.** A publicly traded AI chip pioneer specializing in domain-specific architectures. Its Siyuan 590 and 690 series deliver high-throughput inference and training performance with Day-0 support for major domestic LLMs, and the company is included alongside Huawei on government-approved procurement lists.
* **Alibaba (T-Head / Pingtouge).** Alibaba’s semiconductor division develops high-end custom processors like the Zhenwu M890 PPU. These chips are tightly co-designed with Alibaba Cloud infrastructure to power large-model training and inference.
* **Baidu (Kunlunxin).** Spun off from Baidu’s internal AI chip unit, Kunlunxin produces the Kunlun P800 series, focusing on high architectural independence and broad compatibility for cloud and enterprise AI workloads.
* **Hygon Information Technology.** Leveraging x86 licensing and custom accelerator designs, Hygon builds the Shensuan (DCU) series, which is widely adopted in state-backed supercomputing and enterprise data centers.
* **Moore Threads.** Founded by former Nvidia executives, Moore Threads focuses on full-function general-purpose GPUs (such as the MTT S5000), prioritizing ease of migration and software ecosystem compatibility.
* **Biren Technology & MetaX.** Both firms design high-compute-density GPGPUs—such as Biren's BR100/BR166 series and MetaX's Xiyun C500/C600—tailored for data-center AI training and high-performance computing.
* **Enflame Technology.** Unlike GPGPU rivals, Enflame builds dedicated, non-CUDA-compatible AI accelerators paired with its in-house TopsRider software stack for cloud training and inference.

## Key Manufacturing & Non-U.S. Alternatives

* **Domestic Foundry (SMIC).** Because TSMC and Samsung are bound by U.S. licensing rules on advanced nodes, Semiconductor Manufacturing International Corporation (SMIC) is the critical bottleneck and enabler for China's AI chips, manufacturing domestic designs on its N+2 (~7nm-class) process.
* **Non-U.S. Global Alternatives.** Outside of China, viable non-Nvidia hardware options are largely U.S.-headquartered (such as AMD's Instinct MI300/325 series, Intel's Gaudi 3, Google TPUs, AWS Trainium, Cerebras, and SambaNova) or fabbed in Taiwan/South Korea. One notable non-U.S. challenger is Canada-based Tenstorrent (which designs open-source RISC-V AI processors like Wormhole and Blackhole), though advanced manufacturing still relies on global foundries subject to international export controls.

## Key Trade-Offs & Bottlenecks

| Factor | Current Reality for Chinese Alternatives |
| --- | --- |
| Software Ecosystem | Migrating away from Nvidia's CUDA requires heavy engineering, though frameworks like Huawei's CANN and native PyTorch/DeepSeek integrations have matured rapidly. |
| Power Efficiency | Domestic chips generally consume more power per FLOP than top-tier Nvidia Blackwell/Rubin hardware, prompting local governments to offer up to 50% electricity subsidies for data centers using domestic silicon. |
| Supply Capacity | SMIC's advanced fabrication lines run near maximum utilization (~93–96%), creating supply bottlenecks and long lead times for domestic chip designers. |

---

Semiconductor Manufacturing International Corporation (SMIC) is mainland China’s largest and most advanced pure-play semiconductor foundry, manufacturing integrated circuits for global and domestic chip designers.

## Company Overview

* **Core business.** Operates as a contract manufacturer (foundry) producing wafers and integrated circuits across process nodes ranging from 0.35 micron (350 nm) down to 7 nm, alongside design support, photomask manufacturing, and testing services.
* **Founding & headquarters.** Founded on April 3, 2000, by Zhang Rujing (Richard Chang). It is headquartered in Shanghai's Pudong New Area and legally incorporated in the Cayman Islands.
* **Leadership & ownership.** Led by Chairman Liu Xunfeng and Co-CEOs Zhao Haijun and Liang Mong Song. SMIC is partially state-owned, with major backing from China's state semiconductor fund (the "Big Fund") and Datang Telecom Group.
* **Stock listings.** Dual-listed on the Hong Kong Stock Exchange (SEHK: 0981) and the Shanghai Stock Exchange STAR Market (SSE: 688981).

## Operations & Financials

* **Manufacturing footprint.** Operates 200mm and 300mm wafer fabrication facilities across Shanghai, Beijing, Tianjin, and Shenzhen, supported by international customer service offices in the U.S., Europe, Japan, Taiwan, and Hong Kong.
* **Recent financial performance.** Driven by AI-related chip demand and higher wafer pricing, SMIC reported a 34% year-over-year surge in third-quarter revenue to a record $3.19 billion in November 2026, while more than doubling its quarterly net profit to $428.4 million.

## Strategic Position & Geopolitics

* **Role in China's tech sector.** Serves as the cornerstone of Beijing's semiconductor self-reliance strategy, supplying domestic firms like Huawei while also serving international customers such as Qualcomm, Broadcom, and Texas Instruments.
* **Sanctions & technology limits.** Placed on the U.S. Commerce Department's Entity List in 2020, SMIC is restricted from acquiring advanced American chipmaking tools and extreme ultraviolet (EUV) lithography machines. Despite these export controls—and while still trailing industry leaders like TSMC and Samsung—SMIC has successfully utilized older deep ultraviolet (DUV) equipment to produce 7 nm chips.

---

Several other major manufacturers produce chips for China, though none currently match SMIC’s advanced 7nm logic capabilities. Instead, they specialize in mature-node logic, memory chips, or power semiconductors.

### 1. Domestic Contract Foundries (Logic & Specialty Chips)

Like SMIC, these companies manufacture chips designed by other firms:

* **Hua Hong Semiconductor (Huahong Group).** Mainland China’s second-largest pure-play foundry. It focuses on mature and specialty processes (such as 28nm, 55nm, and 90nm) used in power management, automotive electronics, and smart cards rather than cutting-edge smartphone or AI processors.
* **Nexchip Semiconductor.** Based in Hefei, Nexchip is China’s third-largest foundry. It specializes in display driver ICs (DDIC), CMOS image sensors, and microcontrollers on mature nodes (55nm to 150nm).
* **CanSemi & SMEC (Xinlian Integrated).** Growing domestic foundries focusing on analog, mixed-signal, and power chips for automotive and industrial markets.

### 2. Domestic Memory Chip Makers (IDMs)

These companies both design and manufacture their own memory chips:

* **Yangtze Memory Technologies Corp (YMTC).** China’s leading producer of 3D NAND flash memory (used for data storage in phones, PCs, and servers). It has reached global competitiveness in high-layer 3D NAND despite U.S. export controls.
* **ChangXin Memory Technologies (CXMT).** China’s top manufacturer of DRAM (working memory for smartphones, servers, and AI systems). It has rapidly expanded its global market share and is actively developing High Bandwidth Memory (HBM) for domestic AI chips.

### 3. Domestic Power & Analog Manufacturers (IDMs)

* **China Resources Microelectronics (CR Micro) & Silan Microelectronics.** Both operate their own wafer fabs to produce MOSFETs, IGBTs, and sensors critical for electric vehicles (EVs), solar inverters, and home appliances.
* **Wingtech Technology.** Through its subsidiary Nexperia and its Shanghai-based Wingskysemi wafer fab, it produces massive volumes of automotive and discrete semiconductors.

### 4. Foreign Foundries Operating in or Supplying China

Because U.S. sanctions primarily target advanced AI chips and blacklisted entities (like Huawei), non-Chinese manufacturers still supply the vast majority of China’s standard chips:

* **Taiwanese & U.S. Foundries.** TSMC (which also operates a 16nm/28nm fab in Nanjing), UMC (which operates a fab in Xiamen), and GlobalFoundries manufacture chips for non-sanctioned Chinese design companies.
* **Foreign Fabs in China.** Samsung (in Xi'an) and SK Hynix (in Wuxi and Dalian) operate massive memory fabrication plants inside mainland China.

## Summary Comparison

| Company | Primary Focus | Process Capability | Role in Supply Chain |
| --- | --- | --- | --- |
| SMIC | Advanced & Mature Logic | Down to 7nm | Flagship foundry (AI, smartphones) |
| Hua Hong | Specialty & Power Logic | Mature (28nm+) | #2 foundry (automotive, power, IoT) |
| Nexchip | Display & Image Sensors | Mature (55nm+) | #3 foundry (panels, cameras) |
| YMTC | 3D NAND Flash Memory | Up to ~294 layers | Storage memory IDM |
| CXMT | DRAM & HBM Memory | LPDDR5X / DDR5 | Working memory IDM |

---

Cambricon Technologies (688256.SS) is a Beijing-based semiconductor company specializing in the research, design, and sale of artificial intelligence (AI) processor chips and supporting software. Often referred to as China's domestic rival to Nvidia, it supplies core AI compute hardware for cloud servers, edge devices, and terminal equipment.

## Core Business & Products

* **Cloud AI Chips:** Designs high-performance training and inference processors, notably the Siyuan series (such as the Siyuan 370 and Siyuan 590) used in data centers.
* **Edge & Terminal Processors:** Develops AI acceleration modules (e.g., Siyuan 220) and processor IP (Cambricon-1M/1H) integrated into smart devices and industrial servers.
* **Software Ecosystem:** Maintains proprietary development and inference platforms, including Cambricon NeuWare and MagicMind, to compete with Nvidia's CUDA.
* **Background:** Spun out of the Chinese Academy of Sciences (CAS) in March 2016 by brothers Chen Tianshi and Chen Yunji, the company went public on Shanghai's STAR Market in 2020.

## Stock & Financial Snapshot (Late 2026)

Following years of early R&D losses, Cambricon achieved a major financial turnaround driven by Chinese tech firms shifting toward domestic AI hardware amid U.S. export restrictions.

| Metric | Figure | Context / Period |
| --- | --- | --- |
| Share Price | CN¥934.00 | Close as of Nov 19, 2026 (52-week range: CN¥649.66 – CN¥1,620.00) |
| Market Cap | ~CN¥587.4B (~US$92B) | Mid-November 2026 |
| Q3 2026 Revenue | CN¥3.53 billion | Up 104.5% year-over-year |
| 9M 2026 Net Profit | CN¥3.72 billion | Up 131.5% year-over-year across the first nine months of 2026 |

## Key Market Dynamics & Risks

* **Domestic Demand:** Cambricon sits on China's government-approved AI hardware procurement list and supplies major domestic tech players, including ByteDance, Alibaba, and AI labs like DeepSeek.
* **Supply & Balance Sheet Pressures:** Scaling shipments faces bottlenecks from domestic foundry yields (such as SMIC's 7nm-class capacity) and high-bandwidth memory (HBM) shortages. In Q3 2026, inventory and supplier prepayments surged past nine-month revenue, weighing on operating cash flow and pulling the stock down from its June 2026 peak of CN¥1,620.
* **Customer Concentration:** Revenue remains heavily concentrated among a small group of top state-linked and hyperscale buyers.

---

## Tenstorrent

Tenstorrent is a next-generation computing company that builds computers for AI.

Tenstorrent is a privately held AI computing company led by renowned chip architect Jim Keller. Founded in 2016, the company designs open-source AI processors, high-performance RISC-V CPUs, and modular chiplets to compete with Nvidia in AI training and inference.

## Core Products & Technology

Tenstorrent builds full-stack AI hardware and software designed to be open, customizable, and scalable from single workstations to massive data centers.

* **AI Accelerators & Systems.** Their hardware lineup includes Wormhole and Blackhole AI chips, which power liquid-cooled workstations like the TT-QuietBox 2, compact desktop accelerators built with Razer, and enterprise Tenstorrent Galaxy servers.
* **RISC-V CPUs & Chiplets.** They develop high-performance RISC-V processor IP such as the TT-Ascalon series. Through the Open Chiplet Atlas (OCA) ecosystem, they enable customers to mix and match silicon chiplets across different vendors.
* **Open-Source Software.** Unlike proprietary GPU ecosystems, Tenstorrent relies on an open-source software stack hosted on Tenstorrent GitHub. Their MLIR-based compiler, TT-Forge, pre-maps data movement across independent Tensix cores and supports PyTorch 2.0.

## Funding, Valuation & Recent News

The company has attracted major backing from strategic and institutional investors, including Samsung, Hyundai Motor Group, Bezos Expeditions, Fidelity, and Eclipse Ventures.

* **Series E Funding.** In October 2026, Tenstorrent raised $1.5 billion in a Series E funding round, bringing its valuation to $6.2 billion.
* **Acquisition Interest.** Reports in October 2026 indicated that both Intel and Qualcomm held early talks to potentially acquire Tenstorrent as part of a dual-track financing and sale process.
* **Global Operations.** Headquartered in North America with major hubs in Toronto, Austin, and Santa Clara, the company employs roughly 800 people across offices in Belgrade, Seoul, Tokyo, and Bangalore.

---

It depends on the specific product, performance tier, and licensing method: Tenstorrent is strictly restricted by U.S. export controls from selling high-end AI hardware or proprietary IP to China, though its open-source software remains publicly accessible.

Because Tenstorrent operates major engineering hubs in the U.S. (Santa Clara and Austin) and relies on U.S.-origin semiconductor design tools and technology, its products are subject to the U.S. Department of Commerce’s Bureau of Industry and Security (BIS) Export Administration Regulations (EAR).

### 1. AI Hardware & Systems (Restricted)

* **Direct Sales & Shipments.** Under U.S. export rules covering Country Group D:5 (which includes China and Macau), companies cannot export, reexport, or transfer advanced AI chips and computing systems exceeding specific Total Processing Performance (TPP) thresholds without a special BIS license. High-end Tenstorrent accelerators (such as Blackhole-based systems and Galaxy servers) cannot be freely shipped to Chinese AI companies.
* **Cloud & Remote Access.** As of November 2026, BIS also tightened rules to close cloud-rental loopholes. Overseas data centers—including those in Southeast Asia—are now restricted from providing significant volumes of remote compute power using advanced U.S.-controlled AI chips to companies headquartered in China without a license.
* **Lower-Tier Hardware.** Older or lower-performance workstation cards (such as entry-level Grayskull or Wormhole cards) that fall below BIS performance thresholds may be eligible for export, provided the buyer is not on the U.S. Entity List and the hardware is not intended for restricted military or supercomputing end-uses.

### 2. Commercial IP Licensing (Restricted)

* **Proprietary Core & Chiplet IP.** While the base RISC-V instruction set is an open global standard not controlled by any single country, Tenstorrent’s commercial implementations—such as its TT-Ascalon RISC-V CPU designs and Tensix AI core IP—are proprietary commercial products. Exporting or licensing high-performance commercial chip IP to Chinese firms is subject to U.S. technology transfer restrictions and licensing requirements.

### 3. Open-Source Software (Generally Allowed)

* **Public Repositories.** Under the Export Administration Regulations, publicly available open-source software and code published without restriction (such as Tenstorrent’s TT-Forge compiler and software stack on GitHub) are generally not subject to export controls. Any developer globally can download, inspect, and use the public codebase.
* **Custom Support & Services.** Providing custom engineering services, non-public technical support, or bespoke software optimization to restricted Chinese AI entities would still be prohibited.

---

Europe and Japan are actually global superpowers in the semiconductor industry, though they dominate different parts of the supply chain than contract chipmaking (foundries), while Latin America plays a much smaller, assembly-focused role.

Earlier, the focus was on contract foundries that manufacture digital logic chips (like smartphone and AI processors) for Chinese designers. Because building modern logic fabs costs tens of billions of dollars, global manufacturing of those specific chips has consolidated almost entirely in Taiwan (TSMC), South Korea (Samsung), the U.S. (Intel/GlobalFoundries), and China (SMIC).

Here is where Europe, Japan, and Latin America actually stand in the global chip ecosystem:

### 1. Europe: Dominating Equipment & Automotive Chips

Europe is not weak; it holds critical monopolies and leads in industrial/automotive chips, though it stopped chasing ultra-small (sub-7nm) smartphone processors years ago.

* **The Ultimate Chokepoint (ASML).** The Netherlands' ASML is the only company in the world capable of making Extreme Ultraviolet (EUV) lithography machines. Without European technology, neither TSMC, Samsung, nor Intel could make cutting-edge chips.
* **Automotive & Power Leaders.** Europe is home to three of the world’s top automotive and industrial chipmakers: Infineon (Germany), STMicroelectronics (France/Italy), and NXP Semiconductors (Netherlands). They own massive wafer fabs and supply the global electric vehicle (EV) and industrial markets, including China.
* **Core IP (Arm).** Based in the UK, Arm designs the foundational chip architecture used in virtually every smartphone on Earth.

### 2. Japan: Dominating Materials, Tools, and Sensors

In the 1980s, Japan produced over 50% of the world's chips before losing market share to South Korea and Taiwan. Today, instead of making standard logic chips, Japan controls the essential "picks and shovels" required to manufacture them.

* **Materials Monopoly.** Japanese companies (Shin-Etsu, SUMCO, JSR, Tokyo Ohka Kogyo) control roughly 50% to 90% of the global supply of silicon wafers, photoresists, and specialty chemicals needed to print circuits.
* **Manufacturing Equipment.** Tokyo Electron (TEL), Advantest, and SCREEN are among the world's largest suppliers of chipmaking and testing machines.
* **Specialized Chip Leaders.** Sony dominates the global camera image sensor market (supplying Apple and Chinese phone makers), Kioxia (formerly Toshiba Memory) is a top NAND flash producer, and Renesas is a global leader in automotive microcontrollers.
* **The 2nm Comeback (Rapidus).** Backed by the Japanese government and IBM, a new Japanese consortium called Rapidus is currently building a cutting-edge 2nm foundry in Hokkaido to re-enter advanced chip manufacturing.

### 3. Latin America: Early-Stage & Packaging Focus

Unlike East Asia, Europe, and the U.S., Latin America does not have advanced semiconductor wafer fabrication due to the massive capital investment, ultra-pure water/power infrastructure, and specialized supply chains required.

* **Assembly & Testing (OSAT).** Countries like Mexico, Brazil, and Costa Rica focus on the "back-end" of the supply chain—assembling, packaging, and testing chips that were fabricated in Asia or the U.S. (for example, Intel operates a major assembly and test facility in Costa Rica).
* **Nearshoring Growth.** Because of U.S.–China trade tensions, companies are expanding packaging and printed circuit board (PCB) operations in Mexico to serve North American automotive and electronics factories, though front-end wafer fabs remain absent.

## Global Semiconductor Specialization at a Glance

| Region | Primary Strength | Key Companies |
| --- | --- | --- |
| Taiwan & South Korea | Advanced Logic & Memory Fabs | TSMC, Samsung, SK Hynix |
| United States | Chip Design, Software (EDA), & Tools | Nvidia, Apple, Qualcomm, Intel, Applied Materials |
| Europe | Lithography Machines & Auto/Power Chips | ASML, Infineon, STMicroelectronics, NXP, Arm |
| Japan | Raw Materials, Tools, & Image Sensors | Tokyo Electron, Shin-Etsu, Sony, Renesas, Kioxia |
| China | Mature-Node Fabs, Memory, & Packaging | SMIC, Hua Hong, YMTC, CXMT |
| Latin America | Assembly, Testing, & Packaging (OSAT) | Intel (Costa Rica), Foxconn/Jabil (Mexico) |

---

Southeast Asia (especially Malaysia and Singapore) is a critical global powerhouse in semiconductors, handling roughly 13% to 20% of global chip assembly, testing, and packaging, while Singapore also hosts major wafer fabrication plants.

While Southeast Asia does not yet have a homegrown foundry competing with TSMC or SMIC at the 7nm/3nm level, it is indispensable to the global supply chain and has become the biggest beneficiary of the "China+1" supply chain diversification trend.

### 1. Malaysia: The Global Hub for Chip Packaging & Testing

Malaysia accounts for roughly 13% of global back-end semiconductor assembly, testing, and packaging (OSAT) and supplies about 20% of U.S. semiconductor imports (mostly finished chips packaged there).

* **Major Domestic OSAT Companies.** Malaysia has several publicly traded, globally competitive homegrown packaging and testing champions, including Inari Amertron (a key RF chip packager for Broadcom/Apple), Unisem, and Malaysian Pacific Industries (MPI).
* **Equipment & Automation Champions.** Domestic Malaysian firms like Vitrox, Pentamaster, and Greatech are major suppliers of automated inspection and factory equipment used by global chipmakers.
* **Massive Foreign Presence.** Centered in Penang (often called the "Silicon Valley of the East"), Intel, Infineon, Texas Instruments, Micron, and Bosch operate massive packaging, testing, and power-chip fabrication facilities.

### 2. Singapore: Advanced Mature-Node Wafer Fabs & Equipment

Unlike its neighbors, Singapore has a complete front-end wafer fabrication ecosystem and accounts for roughly 10% of global semiconductor output and 20% of global semiconductor equipment manufacturing.

* **Major Wafer Fabs.** GlobalFoundries, UMC, Micron, and Vanguard International Semiconductor (VIS, backed by TSMC) operate multi-billion-dollar 300mm wafer fabs in Singapore producing logic, memory, and automotive chips.
* **Equipment & Materials Hubs.** Global toolmakers like Applied Materials, Lam Research, and KLA run major R&D and manufacturing centers in Singapore, alongside homegrown precision engineering firms like UMS Integration and AEM Holdings (a critical test-handler supplier for Intel).

### 3. Vietnam, Thailand, and the Philippines: Fast-Growing Manufacturing Hubs

* **Vietnam.** Rapidly emerging as a major back-end hub, hosting Intel’s largest single assembly and test facility globally (near Ho Chi Minh City), alongside major investments from Amkor Technology, Hana Micron, and Nvidia (which partnered with Vietnamese tech giant FPT on AI and cloud infrastructure).
* **Philippines & Thailand.** Both serve as major bases for multinational chip assembly, testing, and automotive power electronics, led by firms like Texas Instruments, Analog Devices, and ROHM, alongside domestic Filipino OSAT player Integrated Micro-Electronics (IMI).

## Southeast Asia Semiconductor Roles at a Glance

| Country | Primary Supply Chain Role | Notable Local & Global Players |
| --- | --- | --- |
| Singapore | Wafer Fabrication (Fabs) & Chip Equipment | GlobalFoundries, UMC, Micron, AEM, UMS |
| Malaysia | Assembly, Testing, Packaging (OSAT) & Automation | Inari Amertron, Unisem, MPI, Vitrox, Intel, Infineon |
| Vietnam | Assembly, Testing & Chip Design Services | Intel, Amkor, Hana Micron, FPT |
| Philippines & Thailand | Assembly, Testing & Automotive Power Chips | IMI, Texas Instruments, ROHM, Analog Devices |

How Chinese chipmakers are setting up packaging operations in Malaysia and Singapore to navigate tariffs. Publicly traded Southeast Asian chip stocks on the Singapore (SGX) or Malaysia (Bursa) exchanges. Advanced packaging (2.5D/3D) and how Penang and Singapore are competing for AI chip packaging.

---

The Middle East is rapidly emerging as a major financial investor and AI infrastructure hub—with Israel as a global chip R&D powerhouse—while Africa remains largely limited to supplying raw minerals and early-stage chip design.

Neither region has domestic advanced wafer foundries competing with TSMC or SMIC, though the Middle East is actively trying to buy or build its way into the supply chain.

### 1. The Middle East: R&D Powerhouse & Sovereign Capital

The Middle East is split into two distinct roles: Israel’s deep engineering ecosystem and the Gulf states’ massive capital investments.

* **Israel (Global R&D & Design Hub).** Israel is one of the world’s most important centers for semiconductor research, chip design, and manufacturing tools, though it is geographically small:
* **Intel’s Operations.** Intel has operated in Israel for decades, running major R&D centers and its Fab 28 wafer plant in Kiryat Gat (which produces advanced logic wafers).
* **Homegrown & Acquired Giants.** Israel produced Mobileye (autonomous driving chips), Mellanox (the high-speed networking technology acquired by Nvidia that now powers AI data centers), and Tower Semiconductor (a major specialty analog foundry). Nearly every U.S. tech giant—including Apple, Nvidia, Qualcomm, and Broadcom—operates major chip design centers in Israel.
* **UAE & Saudi Arabia (Sovereign Wealth & AI Infrastructure).** Flush with oil wealth, Abu Dhabi and Riyadh are aggressively funding global chipmakers and building massive AI data centers to diversify their economies:
* **GlobalFoundries Ownership.** Abu Dhabi’s sovereign wealth fund (Mubadala) is the majority owner of GlobalFoundries, the world’s third-largest contract chip foundry (operating fabs in the U.S., Germany, and Singapore).
* **AI & Chip Ambitions.** The UAE (via G42 and MGX) and Saudi Arabia (via its Public Investment Fund and Alat) have poured tens of billions of dollars into AI chip startups (such as Cerebras and Groq), massive Nvidia GPU clusters, and joint ventures—including discussions with TSMC and Samsung about potentially building future wafer fabs in the Gulf.

### 2. Africa: Raw Materials & Early Design Talent

Africa does not currently have commercial semiconductor wafer fabrication plants or large-scale chip packaging facilities, mainly due to high capital costs, inconsistent power/water infrastructure, and lack of local supply chains.

* **Critical Raw Minerals.** Africa plays an indispensable upstream role by supplying the raw materials needed to make chips and electronics—most notably cobalt and tantalum (Democratic Republic of Congo), platinum group metals and manganese (South Africa), and copper (Zambia and DRC).
* **Emerging Chip Design Hubs.** Rather than building multi-billion-dollar factories, countries like Egypt, South Africa, Morocco, and Kenya are focusing on "fabless" chip design and engineering services, which require talent and software rather than heavy manufacturing:
* Egypt has the largest semiconductor design ecosystem in Africa, hosting local R&D offices for global firms like Siemens EDA (formerly Mentor Graphics), Synopsys, and Valeo.
* Morocco & Tunisia are leveraging their proximity to Europe’s automotive industry to grow electronics assembly and embedded software engineering.

## Middle East & Africa Semiconductor Roles at a Glance

| Region / Country | Primary Supply Chain Role | Key Players & Assets |
| --- | --- | --- |
| Israel | Chip Design R&D, Specialty Fabs, AI Networking | Intel (Fab 28), Nvidia (Mellanox), Mobileye, Tower Semi |
| UAE & Saudi Arabia | Sovereign Capital, Foundry Ownership, AI Clusters | Mubadala (GlobalFoundries), MGX, G42, PIF / Alat |
| Egypt & Morocco | Chip Design (EDA), Auto Electronics Engineering | Siemens EDA, Synopsys, Valeo, STMicroelectronics (packaging in Morocco) |
| Sub-Saharan Africa | Critical Upstream Mining & Raw Materials | DRC (Cobalt/Tantalum), South Africa (Platinum/Manganese) |

---

Russia has a legacy domestic chip industry limited to older, mature-node manufacturing (65nm and above) that is heavily focused on defense and domestic infrastructure, while Central Asia (Middle Asia) has almost no commercial chip manufacturing, acting primarily as a supplier of raw minerals and a trade transit hub.

Neither region is competitive in the global commercial semiconductor market, and both trail far behind East Asia, the U.S., and Europe.

### 1. Russia: Legacy Fabs & Sanction-Driven Self-Reliance

During the Soviet era, Russia (centered in the "science city" of Zelenograd near Moscow) had a self-contained electronics industry, but it fell decades behind the West after the 1990s. Today, heavily cut off from Western tools and foundries (like TSMC) due to sanctions since 2022, Russia relies on legacy equipment and domestic workarounds.

* **Domestic Foundries (Mature Nodes Only).** Russia’s largest chipmakers—Mikron and Angstrem (both based in Zelenograd)—operate wafer fabs capable of mass-producing chips on 65nm to 180nm processes (technology from the mid-2000s). These are sufficient for bank cards, passports, RFID tags, power electronics, and military hardware, but cannot make modern smartphones or AI processors.
* **Domestic Chip Designers (Without Fabs).** Russian firms like MCST (designer of the Elbrus CPUs) and Baikal Electronics (designer of Arm-based Baikal processors) created capable domestic server and PC chips, but they previously relied on TSMC in Taiwan to manufacture them. Following sanctions, they lost access to advanced fabrication and have struggled to find alternative volume production.
* **Niche Equipment & Materials.** Russia retains specialized capabilities in sapphire substrates (used for LEDs and certain RF chips, via Monocrystal) and is attempting to build domestic 350nm–130nm lithography tools to replace blocked Western machinery.

### 2. Central Asia (Middle Asia): Raw Materials & Transit Hub

Central Asian countries—Kazakhstan, Uzbekistan, Kyrgyzstan, Tajikistan, and Turkmenistan—do not have commercial semiconductor wafer fabrication or large-scale packaging plants.

* **Critical Upstream Minerals.** Like Africa, Central Asia’s primary contribution to the global chip supply chain is raw materials. Kazakhstan is a major producer of refined copper, silicon, rare earth elements, and gallium and beryllium—critical metals used in compound semiconductors (like GaN power chips), aerospace, and chipmaking components. Uzbekistan also holds significant reserves of copper, gold, and rare metals essential for electronics manufacturing.
* **Logistics & Parallel Trade Hub.** Since 2022, Central Asian countries (especially Kazakhstan and Kyrgyzstan) have become major trade intermediaries, importing foreign electronics and industrial components and re-exporting them to Russia, though tightening Western secondary sanctions have increasingly restricted semiconductor transit.
* **Early Tech & IT Services.** Countries like Uzbekistan (via IT Park Tashkent) and Kazakhstan (Astana Hub) are investing heavily in software engineering and IT outsourcing, though hardware and chip design remain nascent.

## Russia & Central Asia Semiconductor Roles at a Glance

| Region / Country | Primary Supply Chain Role | Key Players & Capabilities |
| --- | --- | --- |
| Russia | Legacy Wafer Fabs (65nm–180nm) & Domestic CPU Design | Mikron, Angstrem, MCST (Elbrus), Baikal Electronics, Monocrystal |
| Kazakhstan | Critical Upstream Metals (Gallium, Beryllium, Copper) | Kazatomprom, ERG (Eurasian Resources Group) |
| Uzbekistan & Neighbors | Raw Minerals, Electronics Assembly, & Trade Transit | Regional mining firms & IT/software parks |

---

There is currently no mature AI chip manufacturer or leading-edge semiconductor foundry in South Asia. While countries like India are investing billions to build a domestic semiconductor industry, their facilities focus on legacy process nodes (28nm to 90nm) and back-end packaging (OSAT) rather than the sub-7nm fabrication required for data-center AI accelerators.

## India's Current Semiconductor Capabilities

Backed by the India Semiconductor Mission (Semicon 1.0 and 2.0), India has become a major hub for chip design talent—housing R&D centers for global firms like Nvidia, AMD, and Intel—and is rapidly expanding physical manufacturing. However, its physical fabrication plants cannot produce modern AI GPUs:

* **Legacy Wafer Fabrication Only.** India's first major commercial wafer fab, built by Tata Electronics in Dholera, Gujarat (with Taiwan's PSMC), targets mature nodes between 28nm and 110nm, starting production at 90nm and 55nm around mid-2028. These chips are suited for automotive, industrial, and power-management electronics rather than AI training.
* **Focus on Assembly and Packaging (OSAT).** Operational facilities in India—such as Micron's memory packaging plant in Sanand, Tata's OSAT unit in Assam, and CG Semi in Gujarat—handle Outsourced Semiconductor Assembly and Test (OSAT). They cut, package, and test wafers fabricated elsewhere rather than etching advanced logic silicon.
* **Early-Stage Domestic AI Startups.** Indian fabless startups like Aani Labs and P2F Semi are designing custom AI inference and edge processors, but they must still rely on overseas foundries (such as TSMC) to manufacture their chips.

What About Nearby Southeast Asia?

Even broadening the scope to Southeast Asia (Malaysia, Singapore, and Vietnam), no regional manufacturer offers a viable alternative for frontier AI chips:

* **Back-End Packaging Dominance.** Malaysia accounts for roughly 13% of global semiconductor packaging, testing, and assembly (hosting major operations for Intel, Infineon, and local firm Inari), while Vietnam focuses on back-end testing.
* **Mature-Node Foundries.** Singapore hosts major wafer fabs (operated by UMC, GlobalFoundries, and Micron), and Malaysia operates specialty foundry SilTerra, but these focus on mature logic, memory, and analog chips rather than cutting-edge AI processors.
* **U.S. Export Compliance.** Even if a South or Southeast Asian facility produced advanced AI hardware, U.S. export rules (including the Foreign Direct Product Rule) restrict any manufacturer using U.S.-origin chipmaking equipment or software from shipping advanced AI chips to China.

## Regional Comparison for AI Hardware

Region / Country, Primary Semiconductor Strength	Most Advanced Local Node	Viable Alternative for AI GPUs?

## India (South Asia)

Chip R&D/design talent; new OSAT & legacy fabs	28nm–90nm (planned for 2028)	No. Lacks sub-7nm logic fabs and HBM memory production.

## Malaysia & Vietnam

Global leaders in back-end assembly & testing (OSAT)	Mature / specialty nodes (SilTerra)	No. Focuses on packaging and legacy chips, not leading-edge fabs.

## Singapore

Mature-node wafers & memory manufacturing	Mature logic & DRAM/NAND	No. Does not fabricate frontier AI accelerators and complies with U.S. curbs.

## Taiwan & South Korea

Global leaders in frontier logic (TSMC) & HBM (SK Hynix, Samsung)	2nm / 3nm & HBM3E/HBM4	No (for China). Technically capable, but strictly bound by U.S. export controls.
