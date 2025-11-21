# Northern Utah Youth Ensembles — Program Notes System  
(HTML + CSS Standards)

This document explains how the HTML and CSS are set up as of 19 Nov 2025. In the future there may be modifications to link to outside videos and use time-limits on links (to prevent playback during concerts).

---

## 1. Overview

The digital program uses **one shared 400px container** to show well on
cellphones, a **section-per-ensemble**
layout, and two different “piece block” systems:

### A. Standard Piece Blocks  
Used by:
- Preparatory Strings (`.prep`)
- Chamber Orchestra (`.chamber`)
- CO-WE Combined Piece (`.co-we`)
- Wind Ensemble (`.winds`)

These use the universal template with:
- `.piece-header`(title in Garamond, composer name in ____)
- `.piece-pronunciation-line` (in Marcellus SC)
- `.piece-separator` (a thin grey line for visual separation)
- `.piece-description` (a short blurb about the composer/piece)
(and they ususally have at least one image in there, as well)

### B. Symphony (NUYS) Blocks  
Used only by:
- Northern Utah Youth Symphony (`.symphony`)

They use a **custom title and composer system** with
**era-based font classes**. So baroque composer names use one font, 
classical composer names get another, etc for renaissance, baroque, classical, romantic, modern, postmodern/contemporary. If there is ever a medieval piece, a new font will have to be added.

---

Here is the idea for setting up the notes: 
** ever-present "Top" button in bottom-left that returns to the top of the program notes (the NUYE fancy logo)
Fadein from black to NUYS Color (deep teal in 2025) that goes under...
Intro with NUYE Logo, Concert Title, Place, and Time
(DRAFT BANNER - set to appear until the author takes it off - see the very last script in the scripts section (at end) - comment it out using // if it's a single line, or /*....*/ works if it's multi-line - to remove the banner when ready)
OVERALL TABLE OF CONTENTS with links to jump to sections
NUYP Section
	has its own section color that might change seasonally
	piece title in Garamond, composer name in Noto Sans, pronunciation in Marcellus SC
	one of the pieces will have a large illustration, or a few/all will have little ones (like ribbon strips)
	it's the same for the other ensembles except for NUYS
NUYCO Section
WE-CO Section, if Chamber & Winds are playing a combined piece
NUYWE Section
NUYS Section (the longest and most involved)
	there may be general commentary about the pieces under the group logo
	NUYS TABLE OF CONTENTS SECTION to link to each piece 
	**once in the NUYS section, a second floating button appears on the bottom right that navigates back to the NUYS TOC
	each piece gets its own section
	each piece section starts off with piece title on left
	composer name large, in special era-specific font, centered
	pronunciation small, in Marcellus SC 
	a timeline customized to the composer's birth & death dates (made in inkscape)
	a brief note about the piece in general
	a black dividing bar
	a block about the composer. Usually would be a long image/text piece created in inkscape, exported as png, and imported as an image in html. The composer-bio blocks use one title font and (usually) one body text font. They may change based on the musical era.
	a custom block or blocks, usually png files created in inkscape, about the play/opera/symphony or the history of a specific piece, or explanation of musical terms, anything that strikes the author's fancy. These custom blocks use a different title font (sometimes matching the musical era somehow) and a different body text font, but they are usually consistent for all of the same type of blocks. Sometimes they use extra fonts for dialogue or quotes. Really this is rather variable and depends on the author's opinion of how it looks. Between each block would be a black divider bar.
	before the next composer/info block/s section, there will be 2 black divider bars
Fadeout to black background
Outro image with a customized request to turn off or mute cell phones, and a "thank you for joining us" 
Final section, special1, in black, with the NUYE gradient logo, then the next concert title, location, and time/date, then the "buy grocery cards" and "donate with zeffy" buttons that link up.

NOTE ABOUT INKSCAPE: block backgrounds are 760 pixels wide to help with sharpness in the final html. It is set to be about double the final html full-width of images, which is 376 pixels, because it's 400 pixels minus a 12-pixel pale border on either side. (it's a 0.75rem border and regular text size is 16px, so that = 12px). If possible, simple images are converted to vectors for ease of rescaling. 

## 2. Standard Piece Block Template (Prep/Chamber/CO-WE/Winds)

```html
<div class="piece-entry">

  <div class="piece-header">
    <span class="piece-title">Title goes here</span>
    <span class="piece-composer">Composer Name</span>
  </div>

  <div class="piece-pronunciation-line">
    <span class="piece-pronunciation-left">(title pron.)</span>
    <span class="piece-pronunciation-right">(composer pron.)</span>
  </div>

  <div class="piece-separator"></div>

  <p class="piece-description">
    Description paragraph. Multiple paragraphs allowed.
  </p>

  <img src="images/example.png" alt="Artwork">
</div>



## 3. NUYS Piece Block Template 
<div class="text-wrap">
  <p class="symphony-piece-title">Egmont Overture</p>

  <div class="symphony-composer-name-base symphony-composer-name-romantic">
    Ludwig van Beethoven
  </div>

  <span class="symphony-pronunciation">(BAY-toh-ven)</span>

  <div class="timeline-rect">
    <img src="images/timeline-beethoven.png">
  </div>

  <div class="overview">
    Description paragraph...
  </div>
</div>

(the timeline image is created in inkscape and saved to /images folder)


(allowed composer eras)
Renaissance	symphony-composer-name-renaissance
Baroque	symphony-composer-name-baroque
Classical	symphony-composer-name-classical
Romantic	symphony-composer-name-romantic
Modern	symphony-composer-name-modern


## 4. Section Naming Rules
Use one <section> per ensemble.

ID and class must match:
<section id="prep" class="prep">
<section id="chamber" class="chamber">
<section id="co-we" class="co-we">
<section id="winds" class="winds">
<section id="symphony" class="symphony">

## 5. Special Components
A. Carousel (for Faust story in Fall 2025)
requires 3 parts:
	.carousel-frame
	.carousel-caption
	.carousel-btn (left/right)
	
B. Donation Buttons (at the very end)
	.donate-buttons
	.donate-square
	
## 6. Editing Guidelines

Do not mix Symphony formatting with other ensembles.
Do not remove pronunciation containers, even if empty.
Do not modify spacing with inline styles; always use CSS.
Do not resize images manually — all images auto-scale to container width.
All sections support multiple paragraphs and multiple images.

## 7. Other

If you're unsure how to format a new piece, check the old program notes, or look at the CSS section notes in the index.html file. 