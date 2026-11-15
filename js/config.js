/* ═══════════════════════════════════════════════════════════════
   SULTAN · config.js
   ---------------------------------------------------------------
   Main personalisation data for the site and visual editor.
   Longer copy, palette, and theme are editable here. Values
   marked SAMPLE are tasteful placeholders — replace them with
   your own before sending the link to your guests.
   ═══════════════════════════════════════════════════════════════ */

window.HEIRLOOM = {
  templateId: "sultan",

  /* ── The couple — SAMPLE content, replace with your names ────── */
  couple: {
    partnerOne: "Layla",                     // SAMPLE
    partnerTwo: "Omar",                      // SAMPLE
    initials:  "L · O",                      // SAMPLE — used on seals & monograms
    namesLine: "Layla & Omar"                // SAMPLE — used across the site
  },

  /* ── The wedding date & time ─────────────────────────────────
     iso : ISO 8601 date-time WITH an explicit UTC offset, so the
           countdown and the calendar files are correct on every
           guest's device, wherever they are in the world.
           Format: "YYYY-MM-DDTHH:MM:SS±HH:MM"                    */
  wedding: {
    iso: "2027-10-09T19:30:00+05:30",                                        // EDIT
    endIso: "2027-10-10T23:30:00+05:30",                                     // EDIT — end of the celebration
    display: "Saturday, 9 October 2027 · the Nikah begins at 7:30 PM, after Isha", // EDIT
    zoneLabel: "IST",                                                        // EDIT — optional note for guests abroad
    words: "Saturday · The Ninth of October · Two Thousand Twenty-Seven",    // EDIT
    numerals: "09 · 10 · 2027",                                              // EDIT
    weekday: "Saturday",                                                     // EDIT — the ornamental date row
    month: "October",                                                        // EDIT
    day: "09",                                                               // EDIT — the large numeral
    year: "2027",                                                            // EDIT
    muhuratLabel: "Nikah",                                                   // EDIT
    muhurat: "half past seven in the evening, after Isha",                   // EDIT
    eventTitle: "Layla & Omar — Nikah"                                       // EDIT (calendar entry)
  },

  /* ── The venue ──────────────────────────────────────────────── */
  venue: {
    name: "The Shahi Divan",                                 // SAMPLE
    address: "22 Imperial Avenue, Charminar Road, Old City, Hyderabad 500065", // SAMPLE
    mapsQuery: "Shahi Divan, Imperial Avenue, Old City, Hyderabad",
    /* A full URL here overrides the map link built above, e.g. an
       exact Google Maps place link or an Apple Maps URL.          */
    mapUrl: ""
  },

  /* ── Copy shown throughout the invitation ────────────────────
     The visual editor can change these values without editing HTML. */
  content: {
    pageTitle: "Layla & Omar · 9 October 2027 — A Nikah Invitation in Onyx & Gold",
    pageDescription: "Layla and Omar request the honour of your presence at The Shahi Divan, Hyderabad — the mayun, the mehndi, and the Nikah at 7:30 on Saturday the ninth of October 2027. Open your invitation.",
    socialTitle: "Layla & Omar — A Nikah Invitation · 09.10.2027",
    socialDescription: "An onyx envelope, a golden tughra seal and a blessed union — you are cordially invited.",
    navStory: "Story",
    navDetails: "Events",
    navVenue: "Venue",
    navRsvp: "RSVP",
    menuInvitation: "The Invitation",
    menuStory: "Our Story",
    menuSaveDate: "Save the Date",
    menuDetails: "The Celebrations",
    menuPalette: "The Palette",
    menuWeddingDay: "The Festivities",
    menuVenue: "Venue & Location",
    menuRsvp: "Kindly Respond",
    menuCountdown: "The Countdown",
    menuClosing: "A Closing Dua",
    openingEyebrow: "With the blessings of Allah Almighty, you are invited to the wedding of",
    openingHint: "Touch the seal to break it",
    openButton: "Enter the Court",
    skipButton: "Skip straight to the invitation",
    envelopeAddress: "their honoured guests",
    bismillah: "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ",
    invitationEyebrow: "With the blessings of our families",
    invitationLead: "We joyfully invite you to celebrate the Nikah of",
    invitationAnd: "and",
    invitationClosing: "Your presence is our greatest blessing",
    heroVenueLabel: "Venue",
    sceneSignboard: "Written in gold upon the night",
    invitationVenueSuffix: "· Hyderabad",
    storyKicker: "The Chronicle",
    storyTitle: "Two hearts,",
    storyTitleScript: "one dua answered",
    storyParagraphOne: "Every imperial story begins quietly, and ours began with a dua whispered on a winter night, over cups of saffron chai and a book of poetry neither of us returned on time. One conversation that outlasted the Isha prayer, one shared shawl against the December cold — and somehow, that evening decided the rest of our lives.",
    storyParagraphTwo: "Six years and three cities later, our families gathered beneath one roof to give their blessing, and the date was written with dates and water — the sunnah way. Nothing would mean more than to have you standing beside us as we say Qubool Hai, and begin a home built on sakinah, mawaddah and mercy.",
    storyQuote: "Lovers don't finally meet somewhere. They're in each other all along.",
    storyQuoteLabel: "— Rumi — the line we read to each other that first evening",
    storyNote: "chapter one, and every chapter after",
    storyNoteCredit: "— pencilled on the back of a wedding date card",
    storyCaptionOne: "the evening of saffron chai",
    storyCaptionTwo: "one shawl against the winter",
    storyCaptionFour: "the Qubool Hai",
    storyAside: "and they lived",
    ayatKicker: "The Blessed Verse",
    ayatArabic: "وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُم مِّنْ أَنفُسِكُمْ أَزْوَاجًا لِّتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُم مَّوَدَّةً وَرَحْمَةً ۚ إِنَّ فِي ذَٰلِكَ لَآيَاتٍ لِّقَوْمٍ يَتَفَكَّرُونَ",
    ayatTranslation: "And one of His signs is that He created for you spouses from among yourselves so that you may find comfort in them. And He has placed between you compassion and mercy. Surely in this are signs for people who reflect.",
    ayatReference: "Surah Ar-Rūm · 30:21",
    saveDateTitle: "Save the Date",
    saveDateCrossing: "the mayun, the mehndi, the Nikah & the Walima",
    saveDateNote: "Add the date to your calendar and keep these particulars close.",
    calendarDownloadLabel: "Add to Calendar",
    calendarGoogleLabel: "Google Calendar",
    detailsKicker: "The Celebrations",
    detailsTitleFirst: "Wedding",
    detailsTitleSecond: "Events",
    detailsIntro: "Four blessed days with our families — at a glance.",
    eventOneLabel: "The Mayun",
    eventOneTime: "Thursday, 7 October 2027 · eleven in the morning",
    eventOneNote: "The bride is showered in flowers and yellow silk — the first day of blessings at the family home.",
    eventTwoLabel: "The Mehndi",
    eventTwoTime: "Friday, 8 October 2027 · four in the afternoon",
    eventTwoNote: "Henna vines, dholki songs and rose sherbet in the courtyard — wear onyx and gold.",
    eventThreeLabel: "The Nikah",
    eventThreeTime: "Saturday, 9 October 2027 · 7:30 PM, after Isha",
    eventThreeNote: "The Nikah ceremony and the Qubool Hai, led by the Imam, followed by dinner in the grand hall.",
    eventFourLabel: "The Rukhsati",
    eventFourTime: "Saturday, 9 October 2027 · ten in the evening",
    eventFourNote: "The bride's farewell — dua, tears of joy, and the send-off under a canopy of lanterns.",
    eventFiveLabel: "The Walima",
    eventFiveTime: "Sunday, 10 October 2027 · half past eight in the evening",
    eventFiveNote: "The groom's family hosts the imperial banquet — a feast of celebration and welcome.",
    kindlyReplyLabel: "Kindly Reply",
    kindlyReplyNote: "Kindly send your response using the reply card further below.",
    particularsEyebrow: "The Particulars",
    particularsDateLabel: "The Date",
    particularsPlaceLabel: "The Place",
    particularsAttireLabel: "The Attire",
    particularsAttire: "Onyx, gold & ivory",
    particularsAttireNote: "Sherwanis, shalwar kameez and formal wear are most welcome — dress as though the court could blush.",
    particularsCarriagesLabel: "Kindly Reply",
    particularsCarriagesTime: "the ninth of September, 2027",
    particularsCarriagesNote: "So the banquet count is right and every seat is saved.",
    paletteKicker: "The Colours of the Court",
    paletteTitleFirst: "The onyx",
    paletteTitleSecond: "court",
    paletteIntro: "Polished onyx and antique gold, ivory paper and warm bronze — the colours of the imperial court, worn by our favourite people.",
    dressCodeLabel: "Attire · Onyx & Gold",
    dressCodeTitle: "Colours of the court",
    dressCodeNote: "Onyx silks, gold brocade and ivory paper are most welcome — dress as splendidly as you feel.",
    weddingDayKicker: "The Celebrations",
    weddingDayTitleFirst: "The wedding",
    weddingDayTitleSecond: "festivities",
    venueKicker: "The Place",
    venueDescription: "An imperial divan of candlelit halls and gilded muqarnas — fanous lanterns at dusk, the sweet Adhan of gratitude, and roses on every table.",
    venueCeremonyLabel: "Nikah",
    venueCeremonyText: "in the grand hall, after Isha, led by the Imam",
    venueReceptionLabel: "Walima",
    venueReceptionText: "a candlelit banquet in the onyx courtyard",
    mapButton: "View Location",
    rsvpKicker: "Your Reply",
    rsvpTitle: "Kindly Respond",
    rsvpLead: "Kindly reply by",
    rsvpNameLabel: "Your name",
    rsvpNamePlaceholder: "e.g. Fatima Khan",
    rsvpNameError: "May we have your name? Two letters or more will do.",
    rsvpAttendanceLabel: "Will you be joining us?",
    rsvpAcceptLabel: "Joyfully accepts",
    rsvpDeclineLabel: "Regretfully declines",
    rsvpAttendanceError: "Please let us know whether you can come.",
    rsvpGuestsLabel: "Seats in your party",
    rsvpGuestsError: "May we have a seat count between one and the party size allowed?",
    rsvpGuestSingular: "guest",
    rsvpGuestPlural: "guests",
    rsvpDietaryLabel: "Dietary requirements",
    rsvpDietaryPlaceholder: "Halal, vegetarian, allergies…",
    rsvpMessageLabel: "A note for the couple",
    rsvpMessagePlaceholder: "Duas, memories, blessings…",
    rsvpSubmitLabel: "Send Response",
    rsvpAmendLabel: "Amend the reply",
    countdownDaysLabel: "Days",
    countdownHoursLabel: "Hours",
    countdownMinutesLabel: "Minutes",
    countdownSecondsLabel: "Seconds",
    countdownKicker: "The Grand Countdown",
    countdownTitle: "counting the hours until",
    countdownPromise: "the Nikah begins",
    closingScript: "with all our love",
    closingMessage: "Thank you, from the depths of our hearts, for being part of our story. May our home be filled with sakinah, mawaddah and rahmah — tranquillity, love and mercy — and may every guest who walks through our door leave with a blessing. Your presence completes our celebration.",
    closingDua: "بَارَكَ اللهُ لَكُمَا وَبَارَكَ عَلَيْكُمَا وَجَمَعَ بَيْنَكُمَا فِي خَيْرٍ",
    closingDuaTranslation: "May Allah bless you both, and shower His blessings upon you, and unite you both in goodness.",
    footerTagline: "Onyx & gold — written upon the night."
  },

  palette: [
    { name: "Polished Onyx",  color: "#0E0B08" },
    { name: "Antique Gold",   color: "#C8A45D" },
    { name: "Ivory Paper",    color: "#F5EFE3" },
    { name: "Warm Bronze",    color: "#8A6A2E" },
    { name: "Deep Gold Ink",  color: "#6E5622" },
    { name: "Champagne Blush",color: "#E4CBA5" }
  ],
  theme: "sultan",
  themeColors: {},
  fonts: {
    editorial: "cormorant",
    display: "bodoni",
    script: "greatVibes",
    hand: "laBelle",
    body: "ebGaramond"
  },

  /* ── Wedding festivities — SAMPLE words for the string of lights.
     Use one short phrase per entry; an empty list hides the section. */
  moments: ["The Mayun", "The Mehndi", "The Nikah", "The Rukhsati", "The Walima", "The Duas"],

  /* ── RSVP ─────────────────────────────────────────────────────
     endpoint : leave "" for the honest demonstration mode — the
                form validates and shows a preview of the reply and
                states clearly that nothing is sent or stored.
                Cloudflare's publishing service supplies the invitation-
                specific RSVP endpoint to public invitation pages.
     maxGuests: the number allowed by the invitation.
     deadline  : shown above the form.                                  */
  rsvp: {
    endpoint: "",
    maxGuests: 4,
    deadline: "the ninth of September, 2027"      // SAMPLE
  },

  /* ── Countdown wording (invalid or passed dates) ─────────────── */
  countdown: {
    invalidMessage: "The Nikah is still being finalised — see the celebrations below.",
    pastMessage: "The celebration has begun — thank you for being part of our story."
  },

  /* ── Optional ambient music ───────────────────────────────────
     Drop a small looping file at assets/audio/theme.mp3 and set
     src to enable the volume toggle in the navigation. Never
     autoplays; stays silent if the file is missing.                  */
  audio: {
    src: ""             // e.g. "assets/audio/theme.mp3"
  }
};
