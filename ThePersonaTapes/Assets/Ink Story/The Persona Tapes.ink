VAR tapesFound = 5

VAR gravyBabyTubesEaten = 0

VAR ramenEaten = 0

VAR currentRadioStation = "none"

VAR isConnectedToNewWeb = 1

VAR neuralInterfaced = 0

->PowerOn

===PowerOn
#colour: Blank
#scene:Blank
#sfx:power
WELCOME, USER!
YOU HAVE PERMISSION TO LOAD ONE (1) PROGRAM
*[LOAD PROGRAM PTRI.PNA]PROGRAM LOADED, PRESS CONTINUE TO BEGIN... #sfx:Loaded
    **[CONTINUE]->Intro

=== PaletteTest
<>Choose your palette colour:
+[MyData]#colour: MyData 
+[Kiera]#colour: Kiera
+[Winfred]#colour: Winfred
+[Jamie]#colour: Jamie
+[Estelle]#colour: Estelle
+[Torelin]#colour: Torelin
-->PaletteTest

=== Intro
TODO Add MyData Spacejunk in intro images
#music: TheNewDarkAge
#scene:EarthFar
#colour: MyData
 "On October 28th, 2066 a small cafe in Melbourne’s business district was involved in a massive data heist, later known as the 'Breach'."
"The cafe was in the lobby of the powerful <b>MyData</b> corporation, a company that prides itself on the safe storage of personal user data, but no one - <i>not even <b>MyData</b></i>- could have prevented what came next." #scene:Earth
*["The heist of the century..."]
*[Skip Intro]->PartOneTheApartment
-"The bank was infiltrated using underhanded tactics. In a swift and inhuman act an Exabyte of information (1 billion gigabytes) of data began to leak from the data vaults."
#scene:EarthClose
"Later it was found that the data access point, safely nestled hundreds of floors below, was somehow accessed through a gap in the cafe break room less than a centimetre wide."
#scene:Australia
"By the time <b>MyData</b> discovered the leak it was too late, the information had fallen into the hands of the populace and was beginning to circulate on the <b>Web</b>. <b>MyData</b> quickly released a statement- doing their best to prevent the world falling into chaos."
**["But they failed..."]
 #scene:Peninsula
--"Alas, the people did not acknowledge the statement and follow <b>MyData</b>'s guidance. Lives were lost, businesses were left open to plunder and the darkest secrets of the world’s superpowers became accessible through a simple <b>Web</b> search."
 #scene:Melbourne
"Unable to control the rabble <b>MyData</b> had no choice but to cut access to the <b>Web</b>, sending the world into the <b>New Dark Age</b>." 
"Slowly but surely, <b>MyData</b> began to rebuild the <b>Web</b>, and the world, from the ground up."
#scene:ApartmentCloseCity
"Thanks to the hard work of <b>MyData</b>, the people started to leave that horrible event in the past, and began to look to the future."
***["Then we see the light..."]

--- "But eventually, rumours began to spread. Illegal and primitive 'Pirate Radio' stations and indie-news agencies began to discuss the possible existence of so-called <i>evidence</i> from the <b>"Breach"</b>." 
"As the babbling went on, ex-<b>MyData</b> employees came forward with further misinformation. They <i>claimed</i> there were physical copies of data gathered from the witnesses- and so began the search for the <b>'Persona Tapes'</b>." 
<i>The TV presenter continued, scoffing and rolling his eyes.</i> #scene:TVPresenterIntro
****["The tapes..."]
 ----"Instead of hunting for imaginary evidence why not log into your MyData+ account and join us on the New Web forums. Where we discuss the future, and say goodbye to the past!"
*****["Enough of that garbage." (Turn off the TV)] You punch the off button on the remote and the phony grin of the presenter is wiped away. The TV screen crackles and fades to black, leaving you alone in your untidy apartment with only the distant sound of the Melbourne city streets below to keep you company.#scene:ApartmentMessy #music: ApartmentBlues
-> PartOneTheApartment

=== PartOneTheApartment
{TURNS_SINCE(-> Intro) > 10:->MailArrives}{not Cleanup:{~You sigh deeply|You stretch your limbs|You stifle a yawn} as you {~look around your dump of an apartment and wonder what to do.|think of what to do next.|ponder your options.} {&Life as an out of work Private Investigator is starting to get stale, and your apartment has the smell to go with it.|With the crime rate at an all time high you'd think a Private Investigator would have something better to do than wander around a trashy apartment. | Absentmindedly kicking a piece of trash you begin to ponder existence...|No one has the money or the guts to seek justice anymore, so what's the point of being a P.I.?}#scene:ApartmentMessy #music: ApartmentBlues}{Cleanup:{~You rub your hands together|You take a deep breath|You feel a small sense of accomplishment} as you {~appreciate your newly cleaned apartment.|think of what to do next.|ponder your options.} {~At least now you're not tripping over empty CuppaRamen cups.|The ChoombaRoomba hums gently along, content to be cleaning. | What to do... what to do...|You silently wish someone would just come up to your door and offer you a crime to solve...}#scene:ApartmentClean #music: ApartmentBlues}
TODO maybe add some clean apartment music?
* #sfx:VenderKitJingle[Grab a bite to eat] With frunk-all creds to your name you decide to eat in. Hopefully you'll have enough to pay it off come rent day. You head to the <b>VenderKit</b> and as the display lights up you look over the options.->VenderKit 

+ {VenderKit} #sfx:VenderKitJingle[Another trip to the <b>VenderKit</b> couldn't hurt...] {&Salt is good for you, right?|Nothing else fun to do but eat!|...and I don't even have to wash the dishes after!} You poke the <b>VenderKit</b> screen to wake it up and survey your options...->VenderKit 

+ {currentRadioStation == "none"} [Flick on the radio] ->RadioApartment

+ {currentRadioStation != "none"} [Change the radio station] Time for something a little different...
->RadioApartment

+ {not Cleanup}[Clean up your apartment] ->CleanApartment

+ [Sleep away your boredom...] No work, nothing interesting to do... no internet worth looking at since the Breach... time for a sleep maybe?
    ++ [Yeah, nap time...]{Cleanup: You pull up your freshly made sheets and lie in for a rest...}{not Cleanup:You tuck yourself in to an unmade bed...and prepare to sleep...}
    ->MailArrives
    ++ [I've got some more things to do!]You give your bed the sideye... but decide to stay up for now.
    ->PartOneTheApartment
    
+ [Head out for a walk]Stuck in your apartment you feel like a goldfish in a bowl... this goldfish is going for a walk!
You walk up to the door and it beeps as it recognises your neural identifier. The door sweeps open and the cold winter air rushes past you and in to your stuffy apartment. It's night, but that doesn't mean much in a city these days.
->Walk->
->PartOneTheApartment

+ [Surf the New Web]Since the Breach MyData has kept total control over any web content- you'd be lucky to find any 'waves' to 'surf' these days... unless you find heavily moderated corpo-worshipping chat rooms interesting.
    ++ [Check it out anyway]->VisitNewWeb->PartOneTheApartment
    ++ [I wonder what the old web was like...]There used to be something called 'content'... maybe that was short for contention? Imagine being allowed to argue on the internet...->PartOneTheApartment

=VenderKit
#scene:VenderKit
    + {not ChooseBurrito} [A Neato Burrito will fill me the hell up- and then some] You tap the 'Neato Burrito' logo on the display. The speaker plays a husky voice straight out of some B-Grade spaghetti-Western flick
    #sfx:NeatoBurrito
    "Hola! Choose your flavour, amigo!"
    
        ++[Mince Mass] You {&prod|poke|tap|press} the 'Mince Mass' option on the display.
       -> ChooseBurrito
       
        ++[Cheese Volcano] Oh boy does this one live up to the name- last time you tried a Cheese Volcano it burned you so bad you had to spend half your creds on EaseABurn cream- worth it though.
        You {&prod|poke|tap|press} the 'Cheese Volcano' option on the display.
        ->ChooseBurrito
        
        ++[Avocado Smash] This one is a little more expensive- I mean, it has real synth-acado! You get what you pay for!
        You {&prod|poke|tap|press} the 'Avocado Smash' option on the display.
        
        ->ChooseBurrito
        
        ++[Hmph, no- not today.] You recall the last time you went for a Neato Burrito. You're pretty sure you don't need a major bowel obstruction right now. ->VenderKit
        
         
    + {ChooseBurrito && not ChooseBurritoAgain} [That brick in my stomach {&could|could really} use some company- more burrito!] Like Pavlov's dog the mere thought of another salty burrito sets you salivating. The raspy voice shouts out again:
    #sfx:NeatoBurrito
        "Hola! Choose your flavour, amigo!"
    What flavour this time?
    
      ++[Mince Mass] With mild trepidation you prod the 'Mince Mass' option on the display.
        ->ChooseBurritoAgain
       
        ++[Cheese Volcano] Another burrito- this time make it extra cheesy!
        You {&prod|poke|tap|press} the 'Cheese Volcano' option on the display.
        ->ChooseBurritoAgain
        
        ++[Avocado Smash] Can't get enough of that fresh Synth-acado!
        You {&prod|poke|tap|press} the 'Avocado Smash' option on the display.
        ->ChooseBurritoAgain
        
        ++[This is a really bad idea.] You tap 'back' on the display. As you cancel the order you feel as if you just dodged a bullet- well the second bullet at least.
        ->VenderKit
        
    * {ChooseBurrito && ChooseBurritoAgain} [What's one more burrito? I probably have to get my stomach pumped anyway.] You begin to reach for the <b>VenderKit</b> screen- then you hesitate... #music: Tension
   These burritos are no joke, there's a risk that you could die here. Out of work, in a garbage dump of an apartment with three massive burritos where your guts should be.
        ++ [It's worth the risk.] I mean, if you aren't letting yourself indulge every once in a while, are you really living?
            +++ [But seriously?] Are you completely sure? You will probably die due to a burrito overdose. 
                ++++ [There is no better way to die] You punch the button, the raspy voice rattles like the bones of the Grim Reaper. 
                    #sfx:NeatoBurrito
        "Hola! Choose your flavour, amigo!"
                    -> DeathByBurrito
                ++++ [No, snap out of it!] You tear yourself away from the <b>VenderKit</b>- your skin wet with sweat. What is in those things?!
                After a brief rest to recover you move on.
                ->PartOneTheApartment
        ++ [There's more to life than burritos... let it go.] You step back from the machine and shake yourself out of it. Why are you doing this? What the hell is in those things?! 
        You take a moment to calm down before moving on.
         ->PartOneTheApartment
        
     
        
    + {not ChooseRamen} [Gotta go with CuppaRamen, my light in times of darkness] You tap the 'CuppaRamen' logo on the display. 
   A chirpy voice blasts out from the in-built speaker...
   "Caaaa-uppa RAMEN! Pick your flavour!" #sfx:CuppaRamen
   
        ++[Chock'a'Blocka Chicken] You recall the one time you had this flavour of CuppaRamen as a child, back then it actually tasted like chicken... at least you imagine it did- you've never had actual chicken before. You {&prod|poke|tap|press} the 'Chock'a'Blocka Chicken' option on the display.
        ->ChooseRamen
        
        ++[Killer Krill] It turns out Krill is easy to manufacture, and so after the <b>Web</b> went down any and all seafood products were replaced with real, bonafide krill. According to the old folks it tastes like 'shellfish'.
        You {&prod|poke|tap|press} the 'Killer Krill' option on the display.
        ->ChooseRamen
        
        ++[Happy Cow Vegan Beef Sirloin] As a child you learned that beef was once one of the most popular meat products in the world. 
        There were whole pastures dedicated to housing and feeding the cows until they fattened up enough, at which point they were killed and made into meals for the people. Plenty of food, clean air and a quick death. 
        Lucky cows.
        Since the 'Breach' there's no more homes for cows... well there's no more cows either.
          You {&prod|poke|tap|press} the 'Happy Cow Vegan Beef Sirloin' option on the display.
          ->ChooseRamen
            
        ++[Nah, I've had enough of CuppaRamen (choose something else)] You glimpse the tower of empty CuppaRamen containers scattered around your apartment- maybe it's time for a little variety... ->VenderKit
        
    + {ChooseRamen} [Back to ol' faithful, one cup is never enough.] As you poke the 'CuppaRamen' option on the display you notice that some of the LEDS in that particular section seem to be dead- perhaps due to being pressed too hard... or too often.
        You take a look at your options... #sfx:CuppaRamen
        
        ++[Chock'a'Blocka Chicken] I feel like chicken tonight!
        ->ChooseRamenAgain
        
        ++[Killer Krill] License to Krill!
        ->ChooseRamenAgain
        
        ++[Happy Cow Vegan Beef Sirloin] Where's the beef?
          ->ChooseRamenAgain
            
        ++[Maybe that's enough ramen...] You decide you can have too much of a good thing. ->VenderKit
        
    + {not ChooseGravyBaby} [Rip into a tube or two of GravyBaby Nutri+] Well sure, this stuff is mainly marketed towards infants, but damn is it tasty. You take a look at the nutrition data for a moment... 5 or so tubes should do the trick for a grown adult. 
    You tap the 'GravyBaby Nutri+' logo on the screen.
    A pleasant lullaby begins to play and a soothing feminine voice emits from the inbuilt speaker-
    'Everything a growing child needs, in one easy-to-use tube.'
        ++[Up the quantity to 5] You tap on the arrow to increase the quantity and the soothing voice returns-
        "Whose a hungry baby?"
        -> ChooseGravyBaby
        ++[{&On second thoughts, maybe something else?|Not really feeling that one...|Ugh, ok not that one.}]->VenderKit
        
    +{ChooseGravyBaby} [Get yourself some more of that delicious GravyBaby sludge] 
    ->ChooseGravyBabyAgain
        
    + [On second thoughts I'm not hungry...] With a glance at the options on your <b>VenderKit</b> you suddenly feel less like eating.
    ->PartOneTheApartment
    
=ChooseBurrito

     The voice rasps "Niiiice choice! Enjoy, muchacho!"
            There's a whir as the <b>VenderKit</b> synthesises the order, then a satisfying 'CLUNK!' as the burrito falls from the vending chute.
            You pick it up, tear open the foil and tuck in. The nondescript filling fills your mouth with salt and fat- you're pretty sure you can feel your pupils dilating from the sheer force of flavour.
            As you scrunch up the empty foil packet and toss it into a corner of the room the burrito resolves itself to become a brick in the pit of your stomach. You might regret it later- but man did it hit the spot.
            ->PartOneTheApartment
    
=ChooseRamen
    ~ ramenEaten = ramenEaten +1
    You hear the familiar sound of the CuppaRamen falling into place, a whir and a pop as the lid is poked open and the cup filled with boiling water. The trickle of the soon-to-be salty broth is music to your ears.
    After a moment the cup falls into place in the vending chute. You grab the attached plastic fork, peel the lid off the cup and breathe in the scent.
    You savour every moment as you twirl the noodles onto the fork and send them to the ramen afterlife. 
    For the briefest of moments you forget just how pointless your life is.
    ->PartOneTheApartment

=ChooseGravyBaby
    ~ gravyBabyTubesEaten = gravyBabyTubesEaten +5
    The <b>VenderKit</b> whirs and you hear the newly synthesised sludge get shot into the tubes, one by one they fall out of the vending chute.
    You feel a small sense of shame as you rip open each tube, but as you down the delicious goo that shame fades away, taking your hunger with it. This is good shirt. Those babies know what they're talking about... 
    Well... babbling about.
    ->PartOneTheApartment

=ChooseBurritoAgain
    Your stomach lurches in complaint as you tear open the foil and dive in to your second, humungous, burrito. The salt hits and you're pretty sure you can feel the grease begin to make its way into your bloodstream.
    It hurts so good.
    ->PartOneTheApartment
    
=ChooseRamenAgain
    ~ ramenEaten = ramenEaten +1
    The cup falls into place, the whir, the pop... that soulful trickle. 
    You can't help but feel a spark of joy in your heart as you wait for the boiling water to work it's magic.
    The cup drops safely from the chute and once again you are comforted by the salty, warm broth of CuppaRamen.
    Screw the haters, you can't possibly have too much ramen.
    ->PartOneTheApartment

=ChooseGravyBabyAgain
    ~ gravyBabyTubesEaten = gravyBabyTubesEaten +5
    Maybe your initial calculations were incorrect? 5 tubes of GravyBaby couldn't possibly be enough for an adult. You're worth at least {gravyBabyTubesEaten} babies, surely?
    The whir of the machine, the spurt of sludge and you are the proud owner of 5 more tubes of GravyBaby Nutri+.
    You down them like shots of ambrosia and before you know it you're out of tubes again.
    ->PartOneTheApartment
    
=DeathByBurrito
#colour: ERROR
#scene:DeathByBurrito
You hold the horrid burrito in your hands, the craving too much to bear. Mouthful after labored mouthful you begin to consume the wretched thing, your manic hunger taking control.
You barely make it through half of the burrito before your gut starts to fight back. A stabbing pain sends you to the floor writhing in burrito induced suffering.
The addictive chemicals that the company had illegally added to their burrito recipe start to work a little too well and as you die your last thought is... 
'Man, that was <i>so</i> worth it.' #secret:deathbyburrito
FATAL ERROR - PROGRAM TERMINATED
REINITIATE?
*REINITIATE PROGRAM #RESTART
->END
    

=RadioApartment
{& You meander over to the Media Station to use it's radio function. Unlike TV there are still a few radio stations out there that don't spout corpo garbage 24/7.| You wander back to the Media Station and consider your options. | You stand by the radio, what else is there to listen to?}{Cleanup:#scene:MediaStationClean}{not Cleanup:#scene:MediaStation}
 
    +  {currentRadioStation != "HowlRadio"}#sfx:HowlRadio [Time for some music- 106.5, Howl Radio!] You crank the dial over to Noise FM and the scream of TechnoPunk fills the room, you catch some of the lyrics...
    "<i>{~Fill my life with|Stuff your digital heart with|Electrify my brain with} {~your dead batteries,|the stink of gasoline,|the glitch of the dead screen,}<br>{~Take my iron hand|Pull away my face|Steal away my steel} {~as you turn away from life|when I meant to say your name|as we fall away from origin point}.</i>"
    You're not sure if it makes sense, but the way they scream it into the mic...epic.
    ~ currentRadioStation = "HowlRadio" 
    ->PartOneTheApartment
    
    +  {currentRadioStation == "HowlRadio"}#sfx:HowlRadio [Keep on a'howlin!] You can't help but nod along to the technopunk. Check out these lyrics!
    "<i>{~Fill my life with|Stuff your digital heart with|Electrify my brain with} {~your dead batteries,|the stink of gasoline,|the glitch of the dead screen,}<br>{~Take my iron hand|Pull away my face|Steal away my steel} {~as you turn away from life|when I meant to say your name|as we fall away from origin point}.</i>"
   That one really hits home.
    ~ currentRadioStation = "HowlRadio" 
    ->PartOneTheApartment
    
    +  {currentRadioStation != "CBA Classic"} #sfx:CBAClassic[How about something with a bit of class? CBA Classic!] You turn the dial over to CBA Classic, Australia's premiere classical radio station.
     "<i>{~...and that was|...coming up we have a brilliant piece by|...I must say, one of my favourite pieces by} {~Bedřich Smetana|Chopin|Debussy|Camille Saint-Saëns}, one of their {~earliest works|most well known works|least renowned yet definitely deserving works}... {~I hope you enjoy it just as much as I do...|But first, a short and delightful tune as performed by the Melbourne Symphony Orchestra...|Would you agree? Send a message through the MyData MyMsg app or direct link through your neural interface...}</i>"
    ~ currentRadioStation = "CBA Classic"
    ->PartOneTheApartment
    
    + {currentRadioStation == "CBA Classic"}[Keep listening to CBA Classic] There's nothing this world needs more right now than to remember it's humanity. #sfx:CBAClassic
    "<i>{~...and that was|...coming up we have a brilliant piece by|...I must say, one of my favourite pieces by} {~Bedřich Smetana|Chopin|Debussy|Camille Saint-Saëns}, one of their {~earliest works|most well known works|least renowned yet definitely deserving works}... {~I hope you enjoy it just as much as I do...|But first, a short and delightful tune as performed by the Melbourne Symphony Orchestra...|Would you agree? Send a message through the MyData MyMsg app or direct link through your neural interface...}</i>"
    ~ currentRadioStation = "CBA Classic"
    ->PartOneTheApartment
    
    +  {currentRadioStation != "PirateRadio"} [The only station with something important to say: Pirate Radio] You twiddle the dial until you find the telltale crackle of the encoded signal and switch on your decoder. It seems like they're on a station break, but the music they play isn't bad-
    A classic tune plays: "<i>{~I feel, a bad-uh moon a-risin'!|...people are strange, when you're a stranger...|It's a god-awful small affair, to the girl with the mousy hair...|...we are the robots...we are the robots...|Awoooo! Werewolves of london...|Wake me up, before you go-go!|...never gonna give you up, never gonna let you down...}</i>"<br> You feel like you've gone back in time listening to this stuff.
    ~ currentRadioStation = "PirateRadio" 
    ->PartOneTheApartment
    
        +  {currentRadioStation == "PirateRadio"} [Arr, Pirate Radio stays!] You keep an ear out for some info from Pirate Radio, but for now it's just the music...
    "<i>{~I feel, a bad-uh moon a-risin'!|...people are strange, when you're a stranger...|It's a god-awful small affair, to the girl with the mousy hair...|...we are the robots...we are the robots...|Awoooo! Werewolves of london...|Wake me up, before you go-go!|...never gonna give you up, never gonna let you down...}</i>"<br> Damn, I wish I had that one on vinyl...
    ~ currentRadioStation = "PirateRadio" 
    ->PartOneTheApartment
    
    + [Let's stick with the ambience of the world's most frunked up city. (no station)] Time for some radio silence.
     ~ currentRadioStation = "none"
     ->PartOneTheApartment
    
=CleanApartment
    {You take a look around your cramped apartment. The studio apartment wasn't exactly big to begin with, then the <b>VenderKit</b> was installed, taking up a good chunk of space. Between that, the Media Station, the Sani Station, the trash and your single bed there's hardly room to move around.|}
    
    {Strewn across the room are a few towers of empty CuppaRamen cups{ChooseBurrito:, a greasy burrito wrapper} {ChooseBurritoAgain:followed by the SECOND greasy burrito wrapper}{ChooseGravyBaby:, {gravyBabyTubesEaten} empty tubes of GravyBaby}, laundry in various states of reuse and the random scraps from assorted snacks you've had to help pass the time|}
    
    {Maybe it's about time you gave this place a clean?|Time to get to work.|You swear you'll feel better once this trash is dealt with.|You consider the task of possibly... maybe... cleaning up.}
    
           
        +[Get cleaning!] You stand up straight, clap your hands together and get to work... 
            ->Cleanup
    
        *[Pace around the room] You try to pace around, just like you used to do when you were pondering a case- but the sheer amount of trash leaves you only enough space to walk in tight circle.
        ->CleanApartment
        
        *[Consider the prospect of NOT cleaning up] Maybe this level of trash is normal though? Maybe it's part of the natural... city-slummer... ecosystem?
            **[Yeah! You can't mess with the ecosystem!] That's right! If you were to remove the trash it could...
                ***[Harm the wildlife?] Well... the roaches wouldn't be happy would they? I mean, think of the vermin for once...
                    ****[It's just basic science.] You glance around the trash heap and as if on cue a small rat crawls out from an empty CuppaRamen cup and peers at you with it's beady eyes.
                        *****[Ok, <i>maybe</i> it <i>might</i> be time to clean up...] You sigh and open the door to toss the rat out, as you pour the rat from the empty CuppaRamen cup the cool night air reminds you how stale and cramped your apartment is.
                        ******[Yeah, it's definitely time to clean up.]->Cleanup
                        ******[The cool air is refreshing, let's go for a walk!]->Walk->MailArrives
                        ******[Find something else to do.]->PartOneTheApartment
            **[What are you even saying right now?] Wow, you're great at procrastinating... but this is ridiculous.  
            ->CleanApartment
     
        
        +[Cleaning can wait, let's do something else] Cleaning has well and truly waited, and it can wait a little longer.
        ->PartOneTheApartment
    


=Cleanup
With a newfound sense of purpose you grab a fresh garbage bag, peel it open and look at the job that lies ahead.

That is a lot of trash...

* [This is going to be cathartic] This trash has smothered you for long enough, let's do this!
    **[There is a lot of trash, though] You stand up straight and gather your willpower. You can do it! 
    As you pick up the pace you start to fill bag after bag, tossing them into the trash compactor chute as you go. This is kind of nice, actually. 
     *** [Keep at it!] As the amount of junk diminishes you see whole swathes of the apartment that you haven't seen in some time. For the final flourish you switch on the ChoombaRoomba to suck up any sneaky crumbs.#scene:ApartmentClean #secret:sparkingjoy
     ->PartOneTheApartment
* [This trash is going to wish it was never born] You draw on some kind of primal strength within you. 
Let's DO this!
With adrenaline {PartOneTheApartment.ChooseBurrito:and burrito grease} flowing through your veins you tense up your muscles and go to town on the trash heap.
    **[Clean that mother-frunker UP!] You crush the ramen cups, scrunch the chip packets and sweep the crumbs, stuffing them into bag after bag and throwing them into the trash compactor- where trash goes to die.
        ***[There will be no survivors.] With one final sweep of the apartment you stuff the last, half empty bag into the compactor and switch on the ChoombaRoomba to suck up any sneaky crumbs.#scene:ApartmentClean #secret:sparkingjoy
        ->PartOneTheApartment

===MailArrives
Autosaved! #autosave #sfx:Loaded
->Begin
=Begin
#scene:MediaStationBuzz
#music: GotMail
#sfx:Buzz
Suddenly the {currentRadioStation == "HowlRadio": scream of the radio is}{currentRadioStation == "CBA Classic": dulcet tones of the radio are}{currentRadioStation == "PirateRadio": retro beats of the radio are}{currentRadioStation == "none": relative silence of the apartment is} interrupted by the drone of an incoming call from the Media Station.
 An audio message bursts through and a mellow, uncaring voice says...
"Apartment 314, you got some snail-mail. Sendin' it up."
Moments later a small pile of junk mail tumbles out of the delivery chute at the back of the room and into a milk crate you've placed underneath. 
You're surprised to find the usual junk mail is followed by the heavy thud of a parcel the size of a shoebox. You've got mail!
        ->ExamineMail

        
=ExamineMail
#scene:PackagesOne
        {You walk over to the crate, hoist it up and pour the contents out over your bed.|The mystery parcel beckons you... what could it be?}
                    *[Look at the letters] You glance over the envelopes- some bullshirt from MyCouncil about parking rates, an ad for the latest Nova-Cult and a takeaway menu for 'La'Lucky Pizzeria'.
            All trash... except maybe that last one.
            -> ExamineMail
            *[Peer at the parcel] You pick up the parcel- surprisingly heavy for it's size.
            Looking over the parcel you find no address, no sign of it being sent through the <i>legitimate</i> mail services. Did a private courier drop this off?
                **[It can happen...] It's not the first time you received an unmarked parcel, maybe it's that CuppaRamen Deluxe you ordered from the black market? 
            You weigh it in your hands.
                ...Some pretty hefty ramen...
                You grab a knife and start cutting into the parcel. With a bit of effort you cut through the tape and manage to get a side open. There seems to be some kind of reinforced case inside, taking up the entire interior of the box...#scene:PackagesTwo
                    ***[Pull out the case] You wedge your fingers into the box and slide out the case. It falls out onto your mattress with a thump.#scene:PackagesThree
                    You give it a look over... wait a sec, that logo on the cover... that's the <b>MyData</b> logo! This isn't good, only <b>MyData</b> employees are allowed to own something like this.
                    ****[What in the....] You let out a hoarse whisper, "What in the actual frunk is going on here?" #music: Tension
                        *****[Open the case] Carefully, you open the latch on the case, half expecting it to immediately explode in your face.
                        It doesn't.
                    ->FindTapes
            
            
=FindTapes
#scene:PersonaTapesCase
#colour: MyData
#music: Tension
{Inside the case are 5 data cartridges, each one nestled gently within a foam lining. All the cartridges seem to have a little, blinking red light. There's also a coloured label on each one.|You start to shake, you think you might know what these are... but it's safer to be sure...|Your blood turns cold as you realise what these are...Holy frunk-cakes! These are the frunking Persona Tapes!}
*[Investigate the lights] As you investigate the blinking lights you notice that each cartridge actually has a strip of 6 LEDs, two red, two yellow and two green. Currently, only one red light is lit up on each of the cartridges.
->FindTapes
*[Read the labels] The 5 cartridges all seem to be exactly the same, save for the labels. On each coloured label is written a different name...
'Kiera' in Bright Yellow #colour: Kiera #scene:KieraTapes
'Winfred' in a Seafoam Blue #colour: Winfred #scene:WinfredTapes
'Jamie' in Forest Green #colour: Jamie #scene:JamieTapes
'Estelle' in Bright Magenta #colour: Estelle #scene:EstelleTapes
'Torelin' in a Rusty Orange #colour: Torelin #scene:TorelinTapes
->FindTapes
*->PartTwoThePersonaTapes

===PartTwoThePersonaTapes
{not PartOneTheApartment.Cleanup:#scene:TapesApartmentMessy}{PartOneTheApartment.Cleanup:#scene:TapesApartment}
{You begin to pace around the apartment, the Persona Tapes resting in the centre of your bed. What does this mean? Who sent you these things?!|}
{ |You continue to pace...}
* #music: ThePersonaTapes[This is a chance to figure out the mystery!] You can finally know what happened that day, the day that led to the destruction of the <b>Web</b> and the dawn of the <b>New Dark Age</b>. You tremble with excitement at the prospect{PartOneTheApartment.ChooseGravyBabyAgain: (and not just because you're full to the brim with {gravyBabyTubesEaten} tubes of nutrient rich goop)}. 
This could become your greatest case yet. Better even than {~the case of the sewer-gator|the case of the sleepwalking gang-boss|that one episode of Law and Order, the one with the monkey}.
With that thought in mind you pull out your CompuDeck from under the bed, brush off the dust and boot it up... #scene:CompuDeck
->TheInvestigationBegins
+[These tapes are dangerous] You start ruminating on what would happen should <b>MyData</b> find out you have the tapes...
    **[Maybe they'd reward you?] Sure, they'd be glad to get their hands on the tapes, but whose to say what happens to you after? They'd probably kill you just for laying eyes on them...->PartTwoThePersonaTapes
    **[They'd kill me] They'd sooner shut you up than have to admit the existence of the tapes...->PartTwoThePersonaTapes
    **[I could tell the world before <b>MyData</b> even found out] Sure, you could try and share the tapes with the world- but <b>MyData</b> control all information on the New Web, they'd just hush it up and kill you on the sly...->PartTwoThePersonaTapes
     ++ ->
     {& "...perhaps if I wrote it in a friendly email..."|"...maybe they'd cut me some slack since my mum used to be on their <b>MyData</b>+ Plan..."|"...no, they wouldn't... would they?"}   ->PartTwoThePersonaTapes
     

=TheInvestigationBegins
Autosaved! #autosave #sfx:Loaded
->InvestigationCompuDeck

=InvestigationCompuDeck
#scene:CompuDeck #music: ThePersonaTapes
{The screen takes a sec to get it's shirt together, but eventually you're greeted with the desktop. You take a moment to gather your thoughts.|}
{You know that the Persona Tapes hold valuable information about the 'Breach', that fateful day where the <b>MyData</b> vaults were infiltrated, but you don't know what kind of information it is.| } You poise your fingers over the keys of the CompuDeck...
+[Punch in the data tapes!]
->UploadTapes
+[Let's go over the info we have] {A good investigator always takes stock of a situation, you create a new readme to gather your thoughts.|You return to your readme file to investigate what you know so far...}
->CaseLog->InvestigationCompuDeck
+ {isConnectedToNewWeb == 1} [Disconnect from the New Web]
~ isConnectedToNewWeb = 0
{&Your heart skips a beat as you realise how easy it would be for <b>MyData</b> to find you, should the tapes connect to the  <b>New Web</b>. Best to turn it off.|No, it's too dangerous. I have to sever the connection.|My data is my data, <b>MyData</b>- not your data!} (you turn off the  <b>New Web</b> link on your CompuDeck)
->InvestigationCompuDeck
+{isConnectedToNewWeb == 0} [Turn the  <b>New Web</b> connection back on, you may need it] 
~ isConnectedToNewWeb = 1
You switch on the connection and the signal returns. (you turn on the  <b>New Web</b> link on your CompuDeck)
->InvestigationCompuDeck





===CaseLog
TODO caselog for current clues related to the case
You peruse the Case Log. What topic would you like to check?

+[Corporations]You scroll down to your section titled 'Corporations'...
    ++[<b>MyData</b>] \ {You add a new entry to the case log...| } \ { |You read the entry...}
<b>MyData</b>/Corporation
<b>MyData</b> is the world's forefront data storage service, and has been since the early 2000's, when they began providing free internet usage to the globe. 
As the human race became more reliant on technology it was <b>MyData</b> who provided the access to these new technologies. Soon enough it was almost impossible to interface with the world without a connection to <b>MyData</b>'s '<b>Web</b>'.
As the corpo became more powerful it became clear that they were not providing a service to the people, but instead attempting to control them. Unfortunately, by the time the world became aware it was too late. The world had come to rely on the <b>Web</b>, to disconnect from the <b>Web</b> would be to disconnect from society.
So the people continued to live under <b>MyData</b>'s rule... that is until the day of the Breach. Now <b>MyData</b> is only a shred of what it once was, and as the corporation attempts to rebuild the <b>Web</b> (see: the  <b>New Web</b>) they slowly attempt to return to power.
...
->CaseLog

+[Events] You check out the events section...
    ++[The Breach]\ {You add a new entry to the case log...| } \ { |You read the entry...}
The Breach/Event
On October 28th, 2066 a small cafe in Melbourne’s business district was involved in a massive data heist, later known as the 'Breach' this event would go down in history as the day <b>MyData</b> fell out of global power. 

According to a press release from <b>MyData</b> the heist was performed without their knowledge, and by the time they discovered evidence that the data leak had begun the culprits had vanished without a trace.

The same press release explained that the 'terrorists' had infiltrated their data vault by creating a gap less than a centimetre wide in the walls of the cafe above, allowing them to somehow reach the access point and begin leaking data.

A week later <b>Web</b> users around the globe began to report their personal information had been shared illegaly, and days after that sensitive information surrounding businesses, governments and corporations began to surface. The sudden influx of data caused a worldwide panic and <b>MyData</b> decided to cut access to the <b>Web</b> in order to prevent further catastrophe.
The world went quiet, almost all technology had relied on the <b>Web</b> to function and now the <b>Web</b> was no more.
The event known as the Breach had far reaching consequences, but other than the meagre amount of information provided by <b>MyData</b>, not much is known about why or how the Breach took place.
...
->CaseLog

+[Items]Let's see, what info do we have in the item section...
    ++[The Persona Tapes]\ {You add a new entry to the case log...| } \ { |You read the entry...}
The Persona Tapes/Item
TODO Persona Tapes Case Log entry
...
->CaseLog

+[People]So, who's involved in this case?
    ++{UploadTapes} [The Witnesses] {You add a new entry to the case log...| } \ { |You read the entry...}
TODO  The Witnesses case log entry
Blah blah tapes
...
->CaseLog

+[Misc]Anything else that might be pertinent to the investigation?
    ++{UploadTapes} [Recollective Investigation] {You add a new entry to the case log...| } \ { |You read the entry...}
TODO  Recollective Investigation case log entry
Blah blah recollective investigation
...
->CaseLog

+[Close the Case Log] Ctrl+S, Alt+F4...
->->

->->

===UploadTapes
#scene:PersonaTapesCase
{Which tape would you like to start with?|Which tape?}
+#scene:CompuDeckTapes #sfx:Tape1['Kiera']You slide the tape out from the case and plug it into your Compudeck, which immediately starts whirring as the data accessed. 
->PersonaCompuDeck.KieraCompuDeck
TODO Update persona options as they are completed
+#scene:CompuDeckTapes #sfx:Tape1['Winfred' <i>Not Available Yet!</i>]You pull the tape from it's foam housing and place it firmly in the CompuDeck data port.
WORK IN PROGRESS, SECTION UNAVAILABLE
->UploadTapes
+ #scene:CompuDeckTapes #sfx:Tape1['Jamie' <i>Not Available Yet!</i>]Sliding the tape out from it's casing, you place it into the data port on your CompuDeck.
WORK IN PROGRESS, SECTION UNAVAILABLE
->UploadTapes
+ #scene:CompuDeckTapes #sfx:Tape1['Estelle' <i>Not Available Yet!</i>]You take the tape from the case and slot into the data port on your CompuDeck.
WORK IN PROGRESS, SECTION UNAVAILABLE
->UploadTapes
+#scene:CompuDeckTapes #sfx:Tape1['Torelin' <i>Not Available Yet!</i>]The tape comes out of its' casing smoothly, and you plug it in to the data port on your CompuDeck. 
WORK IN PROGRESS, SECTION UNAVAILABLE
->UploadTapes
+[Head back to your CompuDeck]->PartTwoThePersonaTapes.TheInvestigationBegins

===PersonaCompuDeck

=KieraCompuDeck
CASEFILE LOADED <br>PERSONA LOADED <br>READ CASEFILE OR BEGIN RECOLLECTIVE INVESTIGATION?
+[{Read the 'Case File' first|Read the 'Case File' again}]>READ CASEFILE<br>Subject: Kiera Welles<br>Occupation: Vagrant<br>Personality Traits: Imaginative, Playful, Resourceful, Delusional
From interviews with witnesses Kiera Welles seemed to be an unexceptional orphan. According to local restaurant and cafe staff Kiera was claiming to be the child of a wealthy EurekaTek business woman. Hospitality staff would provide her with food and drink out of fear of angering her mother. 
After many attempts to find Kiera's family for questioning and incarceration it was found that she had no living relatives. Kiera was last seen at the incident and no trace of her has been found since. 
    ->KieraCompuDeck
+[Begin 'Recollective Investigation']
->RecollectiveInvestigation->
    ->Kiera
+[Try another tape]{&You unplug the tape and place it back in the case.|You pull the tape out from your CompuDeck and place it back in it's housing.|You eject the tape and put it back in the case.} #sfx:Tape2
->UploadTapes

=WinfredCompuDeck
CASEFILE LOADED <br>PERSONA LOADED <br>READ CASEFILE OR BEGIN RECOLLECTIVE INVESTIGATION?
+[{Read the 'Case File' first|Read the 'Case File' again}]>READ CASEFILE<br>Subject: Winfred Oakey<br>Occupation: MyData Researcher<br>Personality Traits: Capable, Intelligent, Subservient
Winfred was hired as a MyData Researcher in the field of Surveillance two years prior to the incident. He was a capable employee, and was one of the first to be fitted with the MyData 'MySmile' personality regulator.
Once the regulator was fitted Winfred excelled in his position, eventually arriving at the role of Head Researcher, a role he maintained until the date of the incident.
    ->WinfredCompuDeck
+[Begin 'Recollective Investigation']
->RecollectiveInvestigation->
    ->Winfred
+[Try another tape]{&You unplug the tape and place it back in the case.|You pull the tape out from your CompuDeck and place it back in it's housing.|You eject the tape and put it back in the case.} #sfx: Tape2
->UploadTapes


=JamieCompuDeck
TODO Jamies case file
CASEFILE LOADED <br>PERSONA LOADED <br>READ CASEFILE OR BEGIN RECOLLECTIVE INVESTIGATION?
+[{Read the 'Case File' first|Read the 'Case File' again}]>READ CASEFILE<br>Subject: Winfred Oakey<br>Occupation: MyData Researcher<br>Personality Traits: Capable, Intelligent, Subservient
TODO Jamie bio
    ->JamieCompuDeck
+[Begin 'Recollective Investigation']
->RecollectiveInvestigation->
    ->Jamie
+[Try another tape]{&You unplug the tape and place it back in the case.|You pull the tape out from your CompuDeck and place it back in it's housing.|You eject the tape and put it back in the case.} #sfx: Tape2
->UploadTapes

=EstelleCompuDeck
TODO Estelles case file
CASEFILE LOADED <br>PERSONA LOADED <br>READ CASEFILE OR BEGIN RECOLLECTIVE INVESTIGATION?
+[{Read the 'Case File' first|Read the 'Case File' again}]>READ CASEFILE<br>Subject: Winfred Oakey<br>Occupation: MyData Researcher<br>Personality Traits: Capable, Intelligent, Subservient
Winfred was hired as a MyData Researcher in the field of Surveillance two years prior to the incident. He was a capable employee, and was one of the first to be fitted with the MyData 'MySmile' personality regulator.
Once the regulator was fitted Winfred excelled in his position, eventually arriving at the role of Head Researcher, a role he maintained until the date of the incident.
    ->EstelleCompuDeck
+[Begin 'Recollective Investigation']
->RecollectiveInvestigation->
    ->Estelle
+[Try another tape]{&You unplug the tape and place it back in the case.|You pull the tape out from your CompuDeck and place it back in it's housing.|You eject the tape and put it back in the case.} #sfx: Tape2
->UploadTapes

->END

=TorelinCompuDeck
TODO Torelins case file
CASEFILE LOADED <br>PERSONA LOADED <br>READ CASEFILE OR BEGIN RECOLLECTIVE INVESTIGATION?
+[{Read the 'Case File' first|Read the 'Case File' again}]>READ CASEFILE<br>Subject: Winfred Oakey<br>Occupation: MyData Researcher<br>Personality Traits: Capable, Intelligent, Subservient
Winfred was hired as a MyData Researcher in the field of Surveillance two years prior to the incident. He was a capable employee, and was one of the first to be fitted with the MyData 'MySmile' personality regulator.
Once the regulator was fitted Winfred excelled in his position, eventually arriving at the role of Head Researcher, a role he maintained until the date of the incident.
    ->TorelinCompuDeck
+[Begin 'Recollective Investigation']
->RecollectiveInvestigation->
    ->Torelin
+[Try another tape]{&You unplug the tape and place it back in the case.|You pull the tape out from your CompuDeck and place it back in it's housing.|You eject the tape and put it back in the case.} #sfx: Tape2
->UploadTapes

=== Kiera
TODO Kiera
This is where you play as Kiera
->END

=== Winfred
TODO Winfred
This is where you play as Winfred
->END

=== Jamie
TODO Jamie
This is where you play as Jamie
->END

=== Estelle
TODO Estelle
This is where you play as Estelle
->END

=== Torelin
TODO Torelin
This is where you play as Torelin
->END

=== RecollectiveInvestigation ===
 Autosaved! #autosave
 ->NeuralInterface
 =NeuralInterface
 #colour: White
 #scene:NeuralInterface
 #music: NeuralInterface

 >BEGIN RECOLLECTIVE INVESTIGATION<br>CONNECTING TO NEURAL INTERFACE
{neuralInterfaced == 1: You calm yourself as the tape begins it's connection with your mind...  ->->} 
{neuralInterfaced == 0:Before you realise what's happening the tape hi-jacks your neural interface through the CompuDeck and you get the telltale tickly feeling on your brain. The tape is interfacing with your mind!} 

    {neuralInterfaced == 1:+[Relax your mind, let it happen]->->}
    +[Fight back!]
        ~ neuralInterfaced = 1
        #secret:memories
        {You attempt to overcome the data flowing into your mind, but much like an unwelcome thought it refuses to retreat.|}
 {The sensation of hundreds of thoughts and memories that are not your own assails the inner sanctum of your mind, and you begin to feel your 'self' slipping away.|}
 Think! Maybe you could retain control if you recall some powerful memory? But what would be strong enough?

 ++[Think of your childhood] You close your eyes tightly, and go back to a simpler time. You try to remember a moment when you felt your true self come into being, you think of...
    ***[...the love of your parents...]As your eyes begin to flow with tears you try to remember the faces of your parents, the love they gave you... but there is nothing there...
    
    ***[...your closest friend...]You recall the times you spent by the old water reservoir with your best friend. The two of you would act out old Law and Order episodes together and fight over who had to be the corpse.
    One day you were reenacting that weird episode, the one with the monkey... or was it the one with the hot air balloon? 
    ...wait I've never been to a water reservoir... did I even have a friend? What did we do?
    
    ***[...the birds in the park...]The park... the last connection to the natural world before it was torn down for more housing. The air was so clean there... it barely even stung when you took a breath... you were being pushed along in your pram when you saw them.
   Soaring through the sky, the birds. Of all the creatures the birds were the last to go... they would fly in flocks forming words in the sky...
    No, wait... that must have been a MyData jet... what is a bird anyway? It must have been something else...
    
    ***[...when you found your passion...]Night after night while laying in bed you'd listen to the sound of the true crime documentaries playing in your parents' living room. One night you had the courage to sneak out and watch the documentary from the hallway...
    Your bed time stories paled in comparison to the intricacies of the cases. Before long your heroes became the investigators on the TV screen and you swore to become just like them...
    You would go around the house wearing an old trench coat that dragged along the ground... smoking a big-ass cigar and waggling your finger as you said '...just one more thing!'... 
    Wait a second... kids don't smoke cigars... it must have been something else... maybe a pipe?
    
    ---****[There must be something!]...nothing... 
        Your childhood seems lost to the ether... as you begin to wonder where your thoughts have gone, 'you' cease to be. 
        ->->

++[Remember your proudest moment]You take a deep breath and hold on to your fondest memories... you recall...
    ***[...the case of the sewer-gator...]Yes! The sewer-gator! The creature had terrorised the people, sneaking into their bathrooms! Nobody could catch it before it slid back into the sewers. That is until you were on the case...
  You caught the creature as it was attempting to... to steal some toothpaste... no... it was dressing up as an old woman and scaring peole in the shower...was that it... or...or...
  
    ***[...the case of the sleepwalking gang boss...]Night after night the head of the most dangerous crime family in town found himself waking up in random places. The family considered it a terrible nuisance and tried to keep it secret. That is until you stumbled across the gang leader sleeping under a bridge.
    Putting your case solving brain to work you found out it wasn't actually sleepwalking, but an experimental mind control device!
    You took it upon yourself to control the gang leader yourself and send him into the local museum to steal the worlds' largest diamond... but he woke up just as you were about to snag the diamond... wait... why would you do that? That's kind of crazy... was that real or..?
    
    ***[...your first case...]It was an excellent case, full of intrigue and mystery. It was surrounded in a dark aura of danger... or was it made of faux-leather? You know it was a nice case.... wait... not that kind of case! 
    Your first crime case... it was... the one with the monkey. Yeah and it was colluding with other monkeys... in some sort of barrel...or...was it...
    
    ---****[Keep it together!]...was that just a pre-Breach crime show? 
    Amidst your confusion the tape completes it's upload, and 'you' no longer remain.
    ->->
    
    
++[Use your willpower to retain control]You steel yourself, if this is to be a battle of the minds so be it...
    ***[Repeat your name as you reaffirm your identity]The most simple and most concrete part of your identity- your name!
    You hold yourself together and begin to repeat your name, thinking of everything that makes you who you are as you do so.
    "My name is..."
    "My name..."
    You freeze... what is your name? You try to bring it to mind, was it Shirley? Columbus? Dick?
    ***[Firmly tell the invading thoughts to leave] You take a stand, envisioning yourself standing before the torrent of data... you scream "My mind is my own, you have no power here!"
    The wave of data continues to roll towards you.
    At the top of your voice you scream defiantly- "You cannot pass!". The tide continues...
    
    ***[Recite your personal mantra]You centre yourself, putting away the anxious feelings and letting your body relax... while your mind prepares for battle.
    Your mantra is one that has served you well, on the hardest of days and the most dangerous of cases you have repeated this one unbeatable phrase...
    "{~Hold me close, most powerful|I am one with the|Take my hand, dear} {~otter|cougar|Shih Tzu}! {~Hear me as I speak of the sea|Feel the rythm of the drums|Take me to your sanctum}!" 
    ... that's not right...
    "{~Hold me <i>tightly</i>, most powerful|I am <i>the</i> one with the|Take my hand, <i>most incredible</i>} {~<i>lobster</i>|<i>jacket-potato</i>|<i>chameleon</i>}! {~Speak of the <i>mountains</i>|Feel the <i>beat</i> of <i>my heart</i>|After that you can take me to that <i>candy shop</i> you like}!"{~... hmm... no... that's not it.|...nope...uhhh...|...that doesn't seem right...}
    ****[Try another one!]"{~Give us a tickle|Take the last train|Stuff this in your gob}, {~sonny-jim|Mr.Walrus|fuzzy-man-pear}! {~Before I'm sick!|Then tell me what you think!|Whenever you like, I don't mind."}{~... hmm... no... that's not it either.|...or was it 'sewer-gator?'...|...that's still not right...}

    ---****[Try harder!]But it's no use... the data flows into your mind, washing away any semblance of self you once had...
    ->->
    
===Walk
->->
TODO Walk sequence that describes the setting a bit
/*
Looking out from the balcony you can see the street lights bathing the city in a cold and unnatural glow. Even among the streets below the multitude of neon signs never stop vying for the attention of passersby. 
In the distance you can see the city proper, glowing like a blister with the MyData building standing tall in it's centre.
*[The city is alight, let's explore]You duck inside for a moment to get a coat and gloves, rug up and hit the streets... hopefully they won't hit you back...
You start heading over to the elevator. It seems most of the other denizens of the city have wisely decided to stay indoors, but you do notice some kids playing street hockey in a parking lot far below.
You notice many of the doorways of your neighbours apartments are filled with litter and dirt that hasn't been disturbed in some time. It's cheaper and safer to stay indoors and live off of synthesised junk food, especially with Flash-Grifters prowling the streets... but your security protected neural interface should be safe from a digital mugging.
You arrive at the elevator, call it and wait for the lift to reach the 30th floor... as you do your mind starts to wander... you look out across the city in the distance... you can hear the distant sounds of cars honking in the streets below and some drunken ramblings on one of the floors above...
    **[It's a challenge...living in the city...]
    **[Check your pockets for your old service revolver...]
        ***[]
            ****[]
            ->->*/
*[The outside world is a cold and dangerous place, stay home]You take a moment to let the stale air out of your apartment, then hurry back inside before you are attacked by anything more than the cold winter air.
->->

===VisitNewWeb
TODO Show how horrible MyDatas new web is
 ->->
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 