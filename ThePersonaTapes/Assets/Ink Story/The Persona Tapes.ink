VAR tapesFound = 5

VAR gravyBabyTubesEaten = 0

VAR ramenEaten = 0

VAR currentRadioStation = "none"

VAR isConnectedToNewWeb = 1

VAR neuralInterfaced = 0

VAR creditCount = 0

VAR doomScrolling = 0

VAR rageMeter = 0

->Beginning

===Beginning
#autosave  #colour: MyData #colour: Blank
->PowerOn

===PowerOn
#colour: Blank
#scene:Earth
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
 ----"Instead of hunting for imaginary evidence why not log into your MyData+ account and join us on the New Web forums. Where we discuss the future, and say goodbye to the past! Be quick, the first 500 upvotes on our latest post receive a free credit!"
*****["Enough of that garbage." (Turn off the TV)] You punch the off button on the remote and the phony grin of the presenter is wiped away. The TV screen crackles and fades to black, leaving you alone in your untidy apartment with only the distant sound of the Melbourne city streets below to keep you company.#scene:ApartmentMessy #music: ApartmentBlues
-> PartOneTheApartment

=== PartOneTheApartment

{TURNS_SINCE(-> Intro) > 10:->MailArrives}#music: ApartmentBlues
{not Cleanup: {~You sigh deeply|You stretch your limbs|You stifle a yawn} as you {~look around your dump of an apartment and wonder what to do.|think of what to do next.|ponder your options.}{& Life as an out of work Private Investigator is starting to get stale, and your apartment has the smell to go with it.|With the crime rate at an all time high you'd think a Private Investigator would have something better to do than wander around a trashy apartment. | Absentmindedly kicking a piece of trash you begin to ponder existence...|No one has the money or the guts to seek justice anymore, so what's the point of being a P.I.?}->MessyRoom->}
{Cleanup:{~You rub your hands together|You take a deep breath|You feel a small sense of accomplishment} as you {~appreciate your newly cleaned apartment.|think of what to do next.|ponder your options.} {~At least now you're not tripping over empty CuppaRamen cups.|The ChoombaRoomba hums gently along, content to be cleaning. | What to do... what to do...|You silently wish someone would just come up to your door and offer you a crime to solve...}->CleanRoom->}

* #sfx:VenderKitJingle[Grab a bite to eat] With frunk-all creds to your name you decide to eat in. Hopefully you'll have enough to pay it off come rent day. You head to the <b>VenderKit</b> and as the display lights up you look over the options.->VenderKit 

+ {VenderKit} #sfx:VenderKitJingle[Another trip to the <b>VenderKit</b> couldn't hurt...] {&Salt is good for you, right?|Nothing else fun to do but eat!|...and I don't even have to wash the dishes after!} You poke the <b>VenderKit</b> screen to wake it up and survey your options...->VenderKit 

+ {currentRadioStation == "none"} [Flick on the radio] ->RadioApartment

+ {currentRadioStation != "none"} [Change the radio station] Time for something a little different...
->RadioApartment

+ {not Cleanup}[Clean up your apartment] ->CleanApartment

+ [Go for a walk]{Stuck in your apartment you feel like a goldfish in a bowl... this goldfish is going for a walk!|You take a deep breath and reconsider, maybe a walk would do you good?}
You walk up to the door and it beeps as it recognises your neural identifier. The door sweeps open and the cold winter air rushes past you and in to your stuffy apartment. It's night, but that doesn't mean much in a city these days.
->Walk->MailArrives


+ [Visit the New Web forums]Welp, let's see what's on the New Web...
->VisitNewWeb->PartOneTheApartment
    
    + [Go to sleep...] Maybe if I sleep I'll dream of some new cases to solve? Besides, bed is good.
    ++ [Yeah, nap time...]{Cleanup: You pull up your freshly made sheets and lie in for a rest...}{not Cleanup:You tuck yourself in to an unmade bed...and prepare to sleep...}
    ->MailArrives
    ++ [I've got some more things to do!]You give your bed the sideye... but decide to stay up for now.
    ->PartOneTheApartment 



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
'Man, that was <i>so</i> worth it.' #secret:deathbyburrito #sfx:RevealedSecret
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
    
    + [How about a little <i>'ambience'</i>(no station)] Time for some radio silence.
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
     *** [Keep at it!] As the amount of junk diminishes you see whole swathes of the apartment that you haven't seen in some time. For the final flourish you switch on the ChoombaRoomba to suck up any sneaky crumbs.#scene:ApartmentClean #secret:sparkingjoy #sfx:RevealedSecret
     ->PartOneTheApartment
* [This trash is going to wish it was never born] You draw on some kind of primal strength within you. 
Let's DO this!
With adrenaline {PartOneTheApartment.ChooseBurrito:and burrito grease} flowing through your veins you tense up your muscles and go to town on the trash heap.
    **[Clean that mother-frunker UP!] You crush the ramen cups, scrunch the chip packets and sweep the crumbs, stuffing them into bag after bag and throwing them into the trash compactor- where trash goes to die.
        ***[There will be no survivors.] With one final sweep of the apartment you stuff the last, half empty bag into the compactor and switch on the ChoombaRoomba to suck up any sneaky crumbs.#scene:ApartmentClean #secret:sparkingjoy #sfx:RevealedSecret
        ->PartOneTheApartment
        
===Walk
->WalkBegin
=WalkBegin
 #music: WorrisomeWinfred #scene: BalcElevator
You duck inside for a moment to get a coat and gloves, rug up and head out to hit the streets... hopefully they won't hit you back...
+[Head to the elevator]->WalkElevator
+[{The outside world is a cold and dangerous place, stay home|You were right the first time, stay home}]You take a moment to let the stale air out of your apartment, then hurry back inside before you are attacked by anything more than the cold winter air.
->PartOneTheApartment
   =WalkElevator
   You arrive at the elevator and call it, you can hear the cables lurch from inside as if rudely awoken from a deep sleep. You can't imagine this elevator gets much use.
   As you wait for the apathetic elevator to make it's way to the 30th floor you take a look around...
   *[Look out towards the city]In the distance you can see the city proper, glowing like a blister with the MyData building standing tall in it's centre. Standing just shy of the MyData building is EurekaTek Tower... a little worse for wear...but still active.
   *[Observe the apartment complex]Your neighbour's apartments seem lifeless, the only sign of anyone actually living inside is occasional rumble of the MediaStation speakers coming from within. Hardly anyone goes outside anymore... 
   *[Check your coat pockets]->CoatRevolver
   - ->WalkElevatorArrive


=CoatRevolver
Hm, there's something heavy in your coat pocket... you put your hand inside to feel cold steel- it's your old service MyRevolver!
   You pull it out of your pocket and give it a look over- ah...
   Of course, you're out of MyBullets...
    - ->WalkElevatorArrive

=WalkElevatorArrive
#sfx:elevatording #scene: BalcElevatorOpen
<i>Dee-Doooo!</i>- a cheery bell warbles out from a derelict speaker. Your lift is here. The doors jutter open to reveal a dirty, rusted chamber covered in uninspired and downright rotten graffiti. You catch a waft of urine from inside...
        **[Brave the elevator]You hold your breath and step inside. The elevator shudders as you step aboard. You carefully make your way in, prodding the ground floor button as you do. The doors grind closed, whining with effort. #scene:ElevatorInside #music: ElevatorMusic
        ->WalkElevatorTravel
        **[Head back home]With the barest glimpse of the elevator you decide to turn back. Better to die at your own place slowly, than suddenly in an oversized coffin that smells of urine.
        You step back inside your apartment and slip off your coat and gloves. As the door closes behind you your anxiety of being outside starts to fade, and the comfort of your tiny apartment takes it's place.
            ->->

=WalkElevatorTravel
{The elevator shakes a little as you hop on board. A cheery ditty starts to warble through the elevator speakers.|The 'muzak' of the elevator is interrupted by the occasional <i>twang</i> or <i>CLUNK</i> of the elevator cables as it makes it's way down.|The elevator starts grinding to a halt, it looks like you've reached the ground floor in one piece.->WalkApartmentLobby}
+[Wait]->WalkElevatorTravel
->WalkApartmentLobby

=WalkApartmentLobby
#music: WorrisomeWinfred
The doors of the elevator crank themselves open and you are greeted by an odd sight...
The entire floor of the lobby is full to the brim with people in sleeping bags. A few tired faces peer at you from the darkness, lit up like ghosts from the light of their own personal CompuDeck. Many more remain asleep. 
The doors to the apartment complex seem to be boarded shut, and a couple of people with makeshift weapons are sitting by the entrance on guard duty.
None of the people seem concerned that you have shown up in the middle of the night. In fact, a couple of kids seem to be playing a game, tip-toeing around sleeping bags and chasing one another.
*[Make your way outside]You look past the multitudes of people and peer at the exit doors. It seems like everything is boarded up except the door, which is held closed with a barricade. A couple of elderly men seem to be sitting by the door on guard duty, having a chat. Each of them holds a homemade machete on their laps.
->WalkGoOutside
*[Get back in the elevator]Ok, this is too weird.
->WalkEscapeElevator

=WalkGoOutside
{!You tiptoe through the maze of sleeping bags, being careful not to wake anyone on your way toward the exit. Eventually you draw the attention of the guards, who stop chatting and place their hands on their weapons.}
    {!The guards stand up as you approach. One of them, a man with a glorious moustache and the other a small bespectacled man.}
    {!The bespectacled man speaks up in a croaky voice as you approach, "Door's closed for the night. I'm sorry, we can't let you through."}
        **["I really need to go outside"]"Surely you can let me out, I mean... I live here."
        The moustachioed man speaks plainly "Trust me mate, you might live here... but you'd die out there."
        The bespectacled man continues, "Besides, we open this door and some punk is going to come in and..." the man shudders.
        ->WalkGoOutside
    *[Greet them]"Oh, don't worry. I just wanted to say hi."
        The men slowly begin to sit back down, but keep their weapons handy.
        The moustachioed man politely chuckles, "Well, feel free to stay, but just so you know- George here will talk your <i>ears</i> off." The man in glasses gives the moustachioed man a feigned glare and retorts, "Talk your ears off, why don't you poke my eyes out so I don't have to look at that ridiculous moustache."
        At this the two of them begin joking with one another again, completely ignoring you.
        ->WalkGoOutside
    *[Push past them]You ignore the two of them and stride up to the barricade. Both of the men step toward you and hold their weapons tightly, but more protectively than agressively.
        "L-look! We can't let you do this!" the bespectacled man shouts. The rest of the people seem to be stirring as the voice echoes through the lobby. "You'll be killed!"
            **[Pull open the barricade]You stoop down and grab a hold of the barricade that holds the door shut- pulling it up you manage to release the door. The two guards gasp as you pull the door open... #music: Tension 
            ->TheStreet
    *[Head back to the elevator]It seems like they're serious... "Ok," you say "catch you later then..."
    You tiptoe back to the elevator and head inside, before you realise that the elevator is already occupied- a tall and broad figure with shaggy hair greets you, as they drop a sack of parcels down by their feet.
    "Good timing." they say "These pieces of junk take a while to get going."
        **[Keep to yourself]As you resolve yourself to go through the trip in silence the stranger speaks up-"So, what do you do then?"
         ->WalkElevatorConversation
        **[Chat with them]Before you can say anything the stranger speaks up- "So, what do you do then?"
        ->WalkElevatorConversation

=TheStreet
TODO add city street scene
#colour: ERROR #scene:Blank
{!...and step outside onto the city streets. The lights of the street are blinding compared to the darkness of the boarded up lobby. As you blink your eyes and adjust to the brightness you hear a sudden <b>SLAM</b> from behind you. It seems the guards have boarded up the door again.}
{!Suddenly a high pitched voice squeals "Hey you gonks! Looks like some sucker is out for a little midnight walk!"}
{You turn to see at least a dozen heavily armed punks making their way over to you, their expressions a mix of hatred, madness and unrelenting, vicious glee... maybe you made a mistake coming out here...|Before you realise it you find yourself backed into a corner, the punks slow down, relishing the moment as they move forward.}
*[Run.]You waste no time. Before you can get surrounded you bolt away down the city streets. You hear the whoops and jeering of the gang as they give chase.
You pass street after street looking for an escape- but all you manage to do is collect more and more punks.
Their voices echo in the streets "We got a runner!", "Look at 'em go!" your adrenaline is the only thing driving you to go on... there doesn't seem to be any way out of this.
->TheStreet
*{CoatRevolver}[Pull out your very empty revolver]Your hand rips into your coat pocket and you pull out your revolver, aiming it at the closest punk. This seems to have caught their attention.
The punks slow down, looking for any chance to dive on you, but wary of your weapon. A voice from the back hisses, "Hey, is that a MyRevolver? Those things are ancient."
"Yeah!" another voice cackles "-and they have a little red light that blinks... when you're out of bullets..."
Your blood turns ice cold, these punks are smarter than they look. 
->TheStreet
*[Join them]You hold up your hands- "Look guys, we can all come out of this better off!"
The punks all chuckle, seems like they were waiting for you to start bargaining.
A thin punk with LCD tattoos walks over and slings a cricket bat over their shoulder "Oh yeah? You better start talkin' then- 'efore we get bored."
    **[Promise to sneak them in to the apartment building]
    **[Buy some time]
    --"Look, I live in that place..." You point over at the apartment building, leering overhead- "you know how many people there are in there? How much stuff there is to take?"
    The punks slow down a little more, you continue...
        ***[Become a punk]"I've had enough of living in that shirthole, it's time I started living for myself! Tomorrow morning I'll head over and get them to open the door... you just need to be ready to get the frunk in there and make the most of it."
        The punks stop in their tracks. As your heart races one of the meaner looking punks steps forward, a tall and broad woman with a killer mane of hair.
        "Alright, you get us in there and you got yourself a deal." she steps closer, and closer until you can see the veins in her bloodshot eyes.
        "-and if you try and frunk with us... I'll pull of your skin."
        You gulp, if anyone could pull of someone's skin- it would be this person.
        "I don't frunk around." you say, without even trembling. The apparent leader of the punks gives you a nod. "Tomorrow morning, and after that... you're one of us."
        Suddenly, you feel a strange tearing pain in your head. You let out a scream, but no one reacts. In fact, it seems like everyone is frozen in place.
        The tearing pain continues, getting stronger and stronger. You clasp your head in your hands, trying to pull out your own brain just to bring an end to the pain.
        Your vision turns to red, and the pain ceases as quickly as it began... #secret:streetpunk #sfx:RevealedSecret
        VOID SCENARIO DETECTED - PROGRAM TERMINATED
        REINITIATE?
        ****REINITIATE PROGRAM #RESTART
        ->END
        ***[Die with dignity]"-and you won't get a <i>frunking piece</i> of it. In a flash you send a haymaker at the nearest punk, knocking them down in one punch. A nanosecond later the whole street of punks is on you, pounding you into paste, but not before you can take a few down with you.
        At least you died with dignity.
        FATAL ERROR - PROGRAM TERMINATED
        REINITIATE?
        ****REINITIATE PROGRAM #RESTART
->END

=WalkEscapeElevator
You step back into the elevator and mash the 30th floor button, hoping that the door closes before anyone can get to you.
The doors eventually begin to shut...
Suddenly a gloved hand slams on to the closing door, and the elevator is pried back open. A huge figure with long shaggy hair, dressed in a dark trenchcoat and holding a huge sack of packages stands before you, with their hand holding the doors open. They make their way inside and the doors close behind them.
*[Introduce yourself calmly]"Hey bud, nice night so far?" you say cooly as the figure steps inside.
They reply, in a husky but not unfriendly voice- "Well, I'm still alive... how about you, Plus?" they say as they press the button for their floor. You breathe a mental sigh of relief, they seem friendly enough.
    **["Still kicking too"]You reply with a little smirk, "Yeah not bad, still living too- if you can call it that." the stranger chuckles in reply "You got that right..."
    The rest of the elevator trip goes by with a little bit of friendly banter, the stranger seems kind enough but a little wary of you. 
    Eventually the elevator stops at floor 23 and the stranger heads out. They hoist up their bag of packages and start to head out. They give you a curt nod as they do so- "You're not bad for a plus, have a good night."
    As the doors begin to close you notice one of the packages was left behind.
        ***["Hey, you forgot this!"] You hold the door open and call out to the stranger- "Hey mate, you dropped something!"
        The stranger turns back and gives you a small smile. "Well, why don't you keep it- probably just some MyData merch. Makes for good toilet paper." they give you a wink before heading back on their way.
        With a glowing, happy feeling inside you pick up the package. It's quite heavy...
       As the lift arrives at your floor you head home with the package secured under your arm. You head inside and close the door. Ok! Let's get this package open!#secret:secretsanta #sfx:RevealedSecret
       ->MailArrives.OpenParcel
        ***[Keep it for yourself] You peer out and make sure that the stranger has left before snapping up the package. It's heavy... could be some good stuff.
        As the lift arrives at your floor you hurry back home with the package and head inside. This is the most exciting thing to happen for some time... let's open this baby up!#secret:secretsanta #sfx:RevealedSecret
        ->MailArrives.OpenParcel
    **["Things are rough"]"Hm, not great... haven't had any work in months." you reply.
    The stranger raises an eyebrow, "Oh you had a job? What do you do?".
    ->WalkElevatorConversation
      **[Ask them what 'Plus' means]"What do you mean by 'Plus' exactly?" you ask.
    The stranger gives a little chuckle, "It's what us bottom feeders call you lot- the ones living in the apartments on your <i>MyData Plus</i> memberships." they give you a little smirk, "No offense, 'course. Just a different way of livin'".
    Huh, so you're a 'Plus'? Who knew. "I didn't really know there was another way to live." you say.
    The stranger gives you a pitiful look "There's no way to live, really. But we get by without doing what MyData wants, and that means a lot to folks like us."
    The elevator slows to a halt and the stranger hoists up their sack of parcels, "Well, this is my stop... here take this." they pull out a parcel and hand it to you. "Kindness of strangers and all that..."
    Before you can reply the stranger leaves the elevator and you are on your own with a hefty parcel the size of a shoebox.
    "Uh, thanks?" you say to the elevator doors.
    Eventually the elevator arrives at your floor. You take the parcel and head back home, stripping off your coat and gloves. Well, let's see what the kindness of strangers gets you... #secret:secretsanta #sfx:RevealedSecret
    ->MailArrives.OpenParcel
    *{CoatRevolver}[Pull out your MyRevolver (and pretend it's loaded)]You slip your hand into your pocket and quickly pull out your revolver. "Stay back! I'm armed!" you yell.
The stranger looks at you blankly, before grinning and raising their arms up- "So am I. I've got two... and you're out of bullets."
Dammit, this guy's good. You put your gun down. "Well, I don't want any funny business." you say, sheepishly.
"Aw." they sigh as they lean up against the elevator wall- "I like funny business."
An awkward silence follows as the elevator lurches upwards.
The stranger speaks up, "So, what do you do for a living, besides threatening folks with an empty gun?"
->WalkElevatorConversation
    
    =WalkElevatorConversation
        *["I'm a private investigator"]"I'm a Private Investigator" you reply. "But no one wants to stir the pot these days. Too dangerous."
        *["Nothing much these days"]"Well, I just kind of wander around my apartment these days... not much else to do."
            -The stranger nods solemnly, "I'm a courier myself. One of the best jobs out there. Half the time people forget they even ordered this stuff... so it's all good if I take a package or two on the sly." they give you a cheeky wink.
            "Matter o'fact, here..." they take out a hefty pack the size of a shoebox and hand it over to you. "This one's for the other side of the city, and I can't be arsed carrying it all that way."
            You take the package and are immediately surprised by how heavy it is.
                **[Thank the courier]"Huh, thanks!" you say politely, the courier smiles in reply. "No trouble at all, you're saving me the effort."
                The elevator lurches to a halt, and before you know it the courier has said their goodbyes and are on their way. As the elevator continues on it's way you hold the package in your hands and muse over it's contents... what could it be?
                The elevator arrives at your floor and you excitedly make your way back to your apartment, rush inside and throw off your coat and gloves. Time to crack this thing open! #secret:secretsanta
                ->MailArrives.OpenParcel
                **[Don't accept the parcel]"Oh no... that's ok you should take it." you say as you offer the parcel back.
                The stranger gives you a look, making no move to take the parcel "It's probably just some MyData merch, it's ok, they won't miss it."
                Before you know it the courier heads out of the elevator, giving you a small wave as they do so.
                Well, the parcel's yours now, you may as well enjoy it. The elevator arrives at your floor and you make your way back to your apartment and step inside, throwing off your coat and gloves. You give the package a tentative shake. Well, let's see what fate has provided you...#secret:secretsanta #sfx:RevealedSecret
        ->MailArrives.OpenParcel

 
->->

===VisitNewWeb
TODO Show how horrible MyDatas new web is
#scene:CompuDeck
{!WELCOME TO THE NEW WEB, USER!<br>HERE'S OUR TOP POST FOR THE DAY!}
{!<b>MyDataOfficial:<b><br>Persona Tapes discovered- to be fake!}
{!MyData researchers managed to disprove yet another claim that the mythical 'Persona Tapes' had been found. The toothless vagrant that had provided the data tapes (while smelling strongly of gin!) swore that the provided tapes were legitimate.} 
{!Of course, the tapes were immediately found to contain only pre-Breach video content. The tapes and the vagrant have since been incinerated.}
{!Let us know how glad you are of the subsequent incineration of waste in the comments below!}
->NewWebScrolling
=NewWebScrolling
    *[Read the comments]<i>Top Comments:<br>vIkkILuv<3+:Eugh, I hate Tape Hunters...</i>
    <i>roland+: Yikes, won't these people get a job?!</i>
   <i>weData22: So that's what that smell was this morning X^D</i>
   ...woah, I should <i>not</i> read the comments...
   ->NewWebScrolling
    *[Upvote the post]Congrats! You are the 467th upvoter! Enjoy your free credit!
    ~ creditCount = creditCount +1
    YOUR CURRENT CREDIT BALANCE IS: {creditCount} CREDIT(S)
    ->NewWebScrolling
    +[{Check out another post|Keep scrolling through posts}]{~MyDataOfficial|MyData+Promotional|MyData4Girls|OurData|JustMyThoughts}:<br>{Bored? Try our new word- MyWord! A new word every week, this week's word is Fleg!|Not enough credits? Try harder! A quick upvote can earn you a whole 'cred'! Woah, gnarly!|Been outside lately? No of course you haven't! <i>You're still alive.<i> ;^P|Would you like to make a post of your own? Sign up at our next MyHire event and see if YOU can become a MyData MyMod!|{~Sign up for news about|Take a bite of|Let's learn more about} {~the strange creature known as the <i>'fish'!</i>|the brand new MyKebab, a flash frozen food from the fierce food scientists at MyMeal!}}
    ~doomScrolling = doomScrolling +1 
    {doomScrolling > 5:->DoomScrolling->}->NewWebScrolling
    +[That's enough New Web for today...]
    ->->
 
 =DoomScrolling
 Woah, how long have you been scrolling for? #secret:doomscrolling #sfx:RevealedSecret ->->
 
 

===CleanRoom
#scene: ApartmentClean
->->

===MessyRoom
#scene: ApartmentMessy
->->

===CleanRoomTapes
#scene: TapesApartment
->->

===MessyRoomTapes
#scene: TapesApartmentMessy
->->

===MailArrives
Autosaved! #autosave #sfx:Loaded
->Begin
=Begin
#scene:MediaStationBuzz
#music: GotMail
#sfx:Buzz
Suddenly the {currentRadioStation == "HowlRadio": scream of the radio is}{currentRadioStation == "CBA Classic": dulcet tones of the radio are}{currentRadioStation == "PirateRadio": retro beats of the radio are}{currentRadioStation == "none": relative silence of the apartment is} interrupted by the drone of an incoming call from the Media Station.
 An audio message bursts through and a mellow, uncaring voice says...
"Apartment 30-14, you got some snail-mail. Sendin' it up."
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
                ->OpenParcel
                
=OpenParcel
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
{not PartOneTheApartment.Cleanup:->MessyRoomTapes->}{PartOneTheApartment.Cleanup:->CleanRoomTapes->}
{You begin to pace around the apartment, the Persona Tapes resting in the centre of your bed. The very evidence <b>MyData</b> said didn't exist.|}
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
{You know that the Persona Tapes hold valuable information about the 'Breach', that fateful day where the <b>MyData</b> vaults were infiltrated. There must be some information in here that <b>MyData</b> wanted to keep secret.| } You poise your fingers over the keys of the CompuDeck...#music: ThePersonaTapes
+[Punch in the data tapes!]
->UploadTapes

+[Let's go over the info we have] {A good investigator always takes stock of a situation, you create a new readme to gather your thoughts.|You return to your readme file to investigate what you know so far...}
->CaseLog->PartTwoThePersonaTapes.InvestigationCompuDeck

+ [{&Disconnect from the New Web, just in case|Try disconnect from the New Web again}]
{&You realise that your CompuDeck is connected to the New Web, and if the tapes were to send out your location... Best to turn it off...|There must be some way to disconnect from this damn thing?|<b>Graaaagh!</b> Ok... one more time...}
->NewWebDisconnect->InvestigationCompuDeck

=NewWebDisconnect
{You click on the Network settings of your CompuDeck...|You return to the Network settings of your CompuDeck...}
WELCOME, USER!<br>WHICH SETTINGS WOULD YOU LIKE TO CHANGE?
    +[<b>SIGN UP TO MYDATA+ PREMIUM</b>]MYDATA+ PREMIUM IS FOR MYDATA EMPLOYEES ONLY.<br>ENTER YOUR SIX (6) DIGIT EMPLOYEE CODE TO CONTINUE.
        ++[{&Back out, you don't have a code|Enter a random number|Type in your birthday|Random code time!}]
        {&THAT'S TOO BAD.<br>CONSIDER APPLYING DURING OUR NEXT 'MYHIRE' EVENT!|CODE NOT FOUND.<br>PLEASE REFRAIN FROM ENTERING RANDOM CODES.|You can't remember your birthday, you haven't celebrated it since you were...another age you can't remember.<br>REQUEST TIMED OUT, SENDING YOU BACK.|CODE NOT FOUND.<br>PLEASE REFRAIN FROM ENTERING RANDOM CODES}
    {&Eugh... Well I guess I'm going to have to stick with my plain old MyData+ package... the one that gives me this shirthole of an apartment to live in.|What even is a MyData+ Premium membership anyway? Gold plated NeatoBurritos from your VenderKit?|It's probably terrible anyway... who needs a stupid premium account...|Worth a shot...}
    ->NewWebDisconnect
    TODO Employee code component
        ++ {Winfred.FindEmployeeCode} [Enter Winfred's Employee Code] 
        ->END
    +[I HAVE A COMPLAINT]WHY MAKE A COMPLAINT WHEN YOU CAN BE <I>COMPLIANT</i>?<br>PLEASE CHOOSE FROM THE LIST OF FREQUENT COMPLAINTS:
        ++[SLOW DATA SPEEDS]IN THE CASE OF SLOW DATA SPEEDS, SIGN UP TO OUR NEW <i>MYDATA+ CHEETAH PLAN</i>- BROWSE THE NEW WEB TO THE SPEED OF THE MYTHICAL CHEETAH!<br>WOULD YOU LIKE TO SIGN UP NOW?
            +++[Hell no.]
            +++[Frunk off.]
            +++[Get glorped, MyData]
            ---PLEASE REFRAIN FROM USING PROFANITY ON MYDATA DEVICES
            ->NewWebDisconnect
        ++[POOR CONTENT OPTIONS]MYDATA CONTENT IS THE BEST AND ONLY CONTENT AVAILABLE.<br>USER DISSATISFACTION IS DISCOURAGED.
        ->NewWebDisconnect
        ++[ISSUES WITH A NEW WEB FORUM MEMBER]MYDATA IS SORRY TO LEARN OF YOUR ANIMOSITY ON THE NEW WEB FORUMS<br>PLEASE STATE YOUR GRIEVANCE AND MYDATA WILL DETERMINE WHETHER YOU AND/OR THE OTHER PARTY SHOULD BE TERMINATED.
            +++[{Woah, uh... cancel?|Type in a made up problem}]MYDATA UNDERSTANDS YOUR CONCERNS AND THANKS YOU FOR YOUR VIGILANCE. PLEASE CONTINUE TO REPORT ANY UNSEEMLY BEHAVIOUR.<br>TOGETHER, WE MAKE THE NEW WEB A SAFER PLACE. :^)
            ->NewWebDisconnect
    +[TURN OFF NETWORK CONNECTION]YOUR CONNECTION TO THE NEW WEB COMES WITH A VARIETY OF GREAT MYDATA FEATURES AND PRIVELEGES, ARE YOU SURE YOU WISH TO DISCONNECT?
        ++[Yeah, disconnect]MYDATA IS SORRY TO HEAR THAT OUR SERVICES ARE NOT TO YOUR SATISFACTION.<br>PLEASE BE ADVISED THAT DISCONNECTING FROM THE NEW WEB WILL RESULT IN IMMEDIATE TERMINATION OF YOUR MYDATA+ PLAN, IS THIS OK?
            +++[Yes, disconnect...]YOUR MYDATA+ PLAN CONTAINS MANY FEATURES, INCLUDING BUT NOT LIMITED TO ACCESS TO MEDICATION, VENDERKIT SERVICE, SANISTATION SERVICES, MEDIASTATION SERVICES, VISTA-WINDOW BLIND CONTROL, MYFIRE PRIORITY FIRE REMOVAL SERVICE...
            ...AS WELL AS ACCESS TO YOUR CURRENT LIVING QUARTERS IN ROOM 30-14 OF OUR MYDATA+ BRUNSWICK BUILDING 21C.<br>ARE YOU SURE YOU WISH TO DISCONNECT?
                ++++[Um, yes?]MYDATA IS DISAPPOINTED IN YOUR DECISION. :^(<br>MYDATA IS NOW IN THE PROCESS OF SENDING YOU A MYDATA+ PLAN 'MYMISTAKE' CANCELLATION FORM. UPON IT'S ARRIVAL PLEASE FILL IN THE FORM AND MAIL IT TO YOUR LOCAL MYDATA CENTRE, WHERE IT WILL BE PROCESSED OVER THE COURSE OF THE NEXT 365 DAYS.
                IN THE MEANTIME, PLEASE ENJOY THE REMAINDER OF YOUR MYDATA+ SERVICE PERIOD. ;^)
                Wow, they don't make it easy do they? I doubt they'll even send the form...
                ->NewWebDisconnect
                ++++[On second thoughts... keep it connected]MYDATA IS GLAD YOU ARE CONTINUING TO STAY WITH US :^D<br>TO HELP YOU MAKE BETTER DECISIONS IN THE FUTURE, PLEASE TAKE PART IN OUR MYDATA FORUM DISCUSSIONS ON 'WHY MYDATA+ IS MYCHOICE'.
                ->NewWebDisconnect
        ++[Nah, go back]
        ->NewWebDisconnect
    +[Exit the Network Settings]You close the window and head back to your CompuDeck desktop.
    ->->

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
        ++[The New Dark Age]\ {You add a new entry to the case log...| } \ { |You read the entry...}
The New Dark Age/Event
    After the Breach the world's data was up for grabs, and a world that runs on data, dies by the data.
    Once the general population had received the press release it was too late. <b>MyData</b> had revealed that <i>every single person's</i> most private information was now publicly available. By this time the world was already falling apart. 
    Without any data security the digital currencies that the world had begun to rely on ceased to hold any value. 
    In the panic that followed a sudden reliance on material goods sent the world into a frenzy. Stores were torn apart for their valuables, homes were robbed and humanity was lost.
    In order to try and retain control, <b>MyData</b> developed a privatised Web that they named 'The New Web' along with it they released MyData+, a plan that provided people with safe homes and all the necessities to live... as well as a budget of 'credits' to use on <b>MyData</b> services and products.
    With little choice the vast majority of people signed up for MyData+, while those who refused to were left to fend for themselves.
    The New Dark Age continues to this day, and some believe it will never end.
    ...
->CaseLog

+[Items]Let's see, what info do we have in the item section...
    ++[The Persona Tapes]\ {You add a new entry to the case log...| } \ { |You read the entry...}
The Persona Tapes/Item
Most folks wouldn't even give you the time of day if you went up to them on the street these days- a few of them would even give you a sock in the jaw just for looking at them. But mention the Persona Tapes and they're all ears.
The Persona Tapes have gained a level of mystery that matches the artifacts of the old stories. Some old folks liken it to <i>'Pandora's Box'</i> but <i>'maybe with somethin' good inside'</i>. Whatever that is, the people agree... they want it.
Pinning your hopes on some random object might seem silly to anyone who isn't living life one day at a time, but to most folks the Persona Tapes hold one thing worth searching for...
Hope.
...
->CaseLog

+[People]So, who's involved in this case?
    ++[The Investigator]{You add a new entry to the case log...| } \ { |You read the entry...}
    The Investigator/People
    Growing up in one of the world's most frunked up cities has it's merits. For one, you have a good reason not to go outside, and for two there are plenty o' jobs out there- if you just so happen to be a seasoned private eye.
    The Investigator is one such lucky individual. In their prime the Investigator would have a dozen or so jobs on the go. Folks would line up just to have a chance of finding justice in an unjust world. But that all changed after the Breach...
    Once the world went into the New Dark Age the Investigator had no choice but to start doin' justice for free, but in a world where eatin' and livin' costs a pretty penny... well you end up in a dump like this with barely enough get-go to go out.
    ...maybe I took the 'grisled detective' trope a little far with that one...
    ->CaseLog
 
  {neuralInterfaced == 1:++[The Witnesses] {You add a new entry to the case log...| } \ { |You read the entry...}}
TODO  The Witnesses case log entry
Blah blah tapes
...
->CaseLog

+[Misc]Anything else that might be pertinent to the investigation?
{neuralInterfaced == 1:++[Recollective Investigation]{You add a new entry to the case log...| } \ { |You read the entry...}}
TODO  Recollective Investigation case log entry
Blah blah recollective investigation
...
->CaseLog

+[Close the Case Log] Ctrl+S, Alt+F4...
->->

- ->->

===UploadTapes
#scene:PersonaTapesCase
 {PartTwoThePersonaTapes.NewWebDisconnect}{!Despite being unable to disconnect from the New Web, you've <i>got</i> to get a good look at these tapes.}
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
+ #scene:CompuDeckTapes #sfx:Tape1['Estelle']You take the tape from the case and slot into the data port on your CompuDeck.
->PersonaCompuDeck.EstelleCompuDeck
+#scene:CompuDeckTapes #sfx:Tape1['Torelin' <i>Not Available Yet!</i>]The tape comes out of it's casing smoothly, and you plug it in to the data port on your CompuDeck. 
WORK IN PROGRESS, SECTION UNAVAILABLE
->UploadTapes
+[Head back to your CompuDeck]->PartTwoThePersonaTapes.InvestigationCompuDeck

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
+[{Read the 'Case File' first|Read the 'Case File' again}]>READ CASEFILE<br>Subject: Estelle Regan<br>Occupation: EurekaTek Representative and Marketing Director<br>Personality Traits: Ingenious, Illustrious, Prone to bouts of Frustration
Estelle is the embodiment of corporate success and unrelenting ambition. Her agressive drive had led her to a position of high-standing in the EurekaTek corporation.
The MyData corporation is loathed by the people, yet the EurekaTek corporation is beloved. This isn't due to EurekaTek being a particularly <i>ethical</i> company- it's all down to good marketing on Estelle's part.
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
Autosaved! #autosave #sfx:Loaded 
->KieraArcade
    
=== KieraArcade
#colour: Kiera #music: Kiera #scene:DragonsLair 
With a flash I was through the door... finally I had made it into the dragon's lair! With sword in hand I allowed my eyes to adjust to the golden glow of the chamber. What lay before me was more incredible than I had ever imagined possible...
    +[...vast treasure, for the taking!]->TakeTreasure
    +[...the sleeping dragon, for the slaying...]->SlayDragon
    +[...the exit, freedom at last!]->Freedom
    
=TakeTreasure
The mountains of gold and jewels stolen from my kingdom gleamed in the torchlight- I began to stuff my satchel and pockets.
As the heavy metal coins filled my packs I began to feel uneasy...I felt a warm breeze...
I turned to see the face of the terrible dragon staring down at me, eyes burning like a furnace. #scene:dragonhead #sfx:ChuckleDragon1
<b>"YOU DARE TAKE WHAT BELONGS TO ME?!"</b> it bellowed, filled with indignant rage and burning ire.
    *"These riches belong to my people!"[] you retort, with a rage of your own.
    The dragon sneered in reply-<b>"It is not <i>my</i> fault your people are too weak to protect their riches."</b>
    ->DragonArgue
    *"This gold is <b>mine</b> cretin!"[]you snap back, greedily.
     The dragon cackled in reply-<b>"Please. You are an insect. You are not even worth my time."</b> #sfx:ChuckleDragon1
     With one sudden and terrible swipe of it's tail the dragon swats you down. Killing you instantly.
    ->GameOver
    *[Throw the satchel of gold at the dragon]"You want it? Take it!" you pelt the heavy satchel right at the dragon's eye, catching it off guard!
    <b>"Raaargh!"</b><br>As the dragon bellows you have a few seconds to react, what do you do? #sfx:UpsetDragon
        **[Fight the dragon] 
        ->TreasureFightDragon
        **[Escape with the few riches you have!]
        ->TreasureEscape

->END

=DragonArgue
    <b>"Just as the bee produces honey, do you not take their golden riches for your own? Do not speak to me as if you are better. The more powerful take from the weak. All live to serve themselves. It is the way of the world."</b> spoke the dragon, with a burning air of arrogance. #sfx:ChuckleDragon1
        *"This is different!"[] you reply- "My people are kind, goodhearted and intelligent. What you do causes them suffering!"
        *"You are vile."[] you hiss at the dragon "You are a stain on the world, causing only suffering in a vain attempt to bring your life meaning."
       -The dragon scoffs, sending out a puff of putrid black smoke from their nostrils. <b>"As the bees are mindless drones to you, so is mankind to me. I care not what you think."</b> the dragon stretches, towering to it's full height, 10 times that of your own. #sfx:ChuckleDragon2
        <b>"Now, you will burn like paper. Just as all of those who came here before you..."</b> the dragon's maw begins to glow with the light of a thousand torches...
            **[Quick! Strike with your sword!]But it's too late. As you leap forward the wall of flame rushes into you, killing you instantly. As your form is reduced to ashes the dragon curls back up for a nap...
            ->GameOver

=GameOver
#sfx:GameOver #scene: ArcadeGameover
<b>GAME OVER!<b><br><i>MyData thanks you for playing!<br>Scan your debit chip to play again.</i>
->KieraCafeIntro

=TreasureEscape
With your pockets filled with gold you sprint towards the cave exit. Behind you the dragon shakes itself out of it's daze and begins to turn in your direction!
#sfx:UpsetDragon
It bellows in rage- <b>"You measly worm! I will turn you to ash!"</b>. You hear the dragon draw in a deep breath...
*[Keep running!]If you're quick enough you might just make it! You keep running...
You feel a heat rising behind you as the dragon lets out a torrent of flame. There is a moment of unbearable agony, then you are naught but ashes...
->GameOver
*[Duck for cover!]You duck behind a wall of coins, barely dodging a burst of roaring flames. You can see the exit just a few metres ahead!
->Freedom

->END

=TreasureFightDragon
TODO Include a konami code easter egg
The dragon draws in a deep breath and prepares to unleash burning fire at your feet...
*[Jump twice, duck twice.]You double jump, barely dodging the flames underfoot. Then quickly duck down as two swipes of the dragon's claws soar overhead. 
You notice the dragon's tail raise, ready to swipe across!->FightRoundTwo
*[Dodge to the left, then the right.]You quickly dive away, but the dragon's flames spread too wide! You are ignited and swiftly turned to ashes... #sfx:ChuckleDragon2
->GameOver
*[Block with your sword then strike!]You raise your sword to block the incoming attack, but the force is enough to knock you to the ground. 
    As you begin to get to your feet another swift swipe flies toward you and sends you flying. With a sickening crunch you slam into the cave wall... dead. #sfx:ChuckleDragon2
    ->GameOver
    
    
=FightRoundTwo  
*[Again- Jump twice, duck twice!]As you jump into the air the tail flies toward you and swats you out of the sky. With a sickening crunch you slam into the cave wall... dead. #sfx:ChuckleDragon2
    ->GameOver
*[Dodge to the left, then the right.]You slide out of the way of the first tail strike, and through sheer intuition you slide back in the opposite direction- barely avoiding the second.
#sfx:SurpriseDragon
    The dragon growls fiercely- <b>"WHY WON'T YOU DIE!?"</b>. The dragon prepares another tail strike...->FightRoundThree 
*[Block with your sword then strike!]You raise your sword to block the incoming attack, but the force is enough to knock you to the ground. 
    As you begin to get to your feet another swift swipe flies toward you and sends you flying. With a sickening crunch you slam into the cave wall... dead. #sfx:ChuckleDragon2
    ->GameOver
    
=FightRoundThree
*[Jump twice, duck twice!]As you jump into the air the tail flies toward you and swats you out of the sky. With a sickening crunch you slam into the cave wall... dead. #sfx:ChuckleDragon2
    ->GameOver
*[Again- Dodge to the left, then the right!]Just like the last attack you deftly dodge the tail strikes... The dragon is slowing down- it's not used to working this hard for it's kill. Time to end this!->FightFinish
*[Block with your sword then strike!]You raise your sword to block the incoming attack, but the force is enough to knock you to the ground. 
    As you begin to get to your feet another swift swipe flies toward you and sends you flying. With a sickening crunch you slam into the cave wall... dead. #sfx:ChuckleDragon2
    ->GameOver


=FightFinish
*[Jump twice, duck twice!]As the dragon is recovering from it's slew of attacks you jump into the air and crouch to the ground... giving the dragon enough time to recover and send a burst of flame toward you, killing you instantly. #sfx:ChuckleDragon2
->GameOver
*[Dodge to the left, then the right!]As the dragon is recovering from it's slew of attacks you dive away, pre-empting another strike that doesn't come. As you prepare for your next move you look up to see a torrent of flames burn you away. #sfx:ChuckleDragon2
->GameOver
*[Block with your sword then strike!]You raise your sword to block the incoming attack and notice that the dragon is still recovering from it's slew of attacks!
Quickly, you bring up your sword and slice right through the dragon's heart! #sfx:DeathDragon
->Victory

=Victory
TODO defeat the dragon 

#secret:slay #sfx:RevealedSecret
->END

=SlayDragon
The time to strike is now! You slowly approach the sleeping dragon, and ready your blade... as you get closer your blood turns cold... 
#scene:dragonhead #sfx:UpsetDragon
The dragon's eyes are open and staring directly at you! The beast was only pretending to sleep!
A deep, chilling cackle fills the chamber as the dragon rises. <b>"Fuehehehe...you humans are pitiful creatures. Did you truly think you could sneak up on a dragon?"</b>  #sfx:ChuckleDragon2
->TreasureFightDragon

=Freedom
TODO freedom scene
You climb the narrow stairs until you reach the exit. After long last you can leave this place... but what of the dragon? Will you let it continue it's evil reign?
*[Let the dragon live]To kill the dragon would be... well... draconian. You hurry outside.
*[Slay the dragon]This is your only chance! The dragon must die. You turn back... only to see the dragon right behind you! #scene:dragonhead #sfx:ChuckleDragon1
->TreasureFightDragon
- Freedom! At last! #scene:freedom
You fall to your knees and feel the soft grass beneath, the sunlight forming beautiful rays that perfectly frame the form of the massive dragon that stands before you.
Wait- massive dragon?
Frozen by shock you stand there as the dragon unleashes a torrent of flame, killing you instantly. #scene:dragonhead #sfx:ChuckleDragon2
->GameOver


===KieraCafeIntro
You let out an exasperated sigh as you hop down from the arcade cabinet- "Stupid game... that dragon is a <i> major</i> douche.". You give the arcade cabinet a little kick.
As you get your head out of the game your remember where you were. You've headed to one of the few places that still give you free food and drink- the city central MyCafe.
->KieraCafe

=KieraCafe
{&"Stupid dragon... stupid impossible game..."|"Lame cafe... nothing cool here..."|You begin to whistle idly...}
{TURNS_SINCE(-> KieraCafeIntro) > 2:->TorelinEnters->}       
*[<i><u>Check your surroundings.</u></i>]->CheckSurroundings
*[<i><u>You need to eat.</u></i>]The cool hat lady might give you some food... if you can convince her. Or you could just steal some crud...
    **[sneaky sneaky stealy time]
    ->StealAMeal
    **[do the lost mum act]
    ->CrocodileTears
*[do something fuuuun!]
->MessAround
+[{kick the stupid game some more|whack the arcade cabinet|hate on the arcade game some more}]{You kick the cabinet pretty hard this time but that's ok because it deserves it.|Next time you're gonna make that dragon <i>unalive</i>.|You prod the cabinet with a toe...Stupid game.}
->KieraCafe
*{TorelinEnters}[follow the delivery person]->FollowTorelin

->END

=MessAround
TODO Kiera does something to ease her boredom
->END

=StealAMeal
TODO Stealing food
->END

=CrocodileTears
TODO Try to convince Jamie to give you food
->END

=CheckSurroundings
"Ok ok! Look, we're in dumb boring restaurant." you reply, bulging out your eyes and looking around the room in feigned interest.
    *[<i><u>Look closer, Keira</u></i>]You give the room a proper look this time. The MyCafe is an exact copy of every other one you've been to... a blocky room with a bench at the back, a booth at the front, a fancy you-have-to-give-your-organs-to-MyData-to-sit-here booth in the front corner and a stupid dumb arcade cabinet in the back corner.
    There's also a couple of doors, one says 'Employees only' -but signs are for losers.
        **[<i>Who do you see, Keira?</i>]"There's some girl wearing a cool hat making coffee. A scary lady and a small guy with glasses in the 'special' booth."
        ->KieraCafe

=TorelinEnters
 The cafe door slides open and a tall-ass delivery person pushes in a trolley stacked with parcels. "Ooh, and there's some big guy with hella boxes."
You want those boxes.
->->

=FollowTorelin
TODO Following Torelin and stealing a package
->END
=== Winfred
TODO Winfred
This is where you play as Winfred
->END

=FindEmployeeCode
->END

=== Jamie
TODO Jamie
This is where you play as Jamie
->END

=== Estelle
TODO Estelle
#colour: Estelle #music: EurekaTek
This is where you play as Estelle
->DrivingIn

=DrivingIn
TODO
Estelle muses over the meeting she has to go to at the MyCafe. She's going to meet with Winfred and isn't looking forward to it.
->RoadRage

=RoadRage
A car cuts Estelle off and the player can choose to react to it, or control themselves and add 1 to the Rage Metre
*[Let your rage out]->ReactRoad
*[Hold it in]->ControlRoad
- ->Arrive

=ControlRoad
~rageMeter ++
You hold your rage in
->Arrive

=ReactRoad
You let your rage out.
->Arrive

=Arrive
Estelle arrives at the MyCafe, she gets out of her car, a teenager rides by on a hoverboard, almost knocking her over. 
*[Tell the teen off]->ReactTeen
*[Hold it in]->ControlTeen
->MeetWinfred

=ReactTeen
"Touch me again and I'll tear you apart!"
->MeetWinfred

=ControlTeen
~rageMeter ++
You hold in your rage...
->MeetWinfred

=MeetWinfred
Estelle is greeted by Winfred, who is exactly what she expected, save for a manic smile on his face. He holds a briefcase.
He mutters out a welcome- "Estelle, is it? From EurekaTek? I hope the trip was pleasant?"
{ControlTeen||ControlRoad:"Well let's see- would you consider it <i>pleasant</i> {ControlRoad: to be run off the road by a lunatic driver} {ControlRoad && ControlTeen:<i>and then</i> }{ControlTeen: being knocked to the ground by a wayward child}? No? How curious!"}
{ReactRoad && ReactTeen:"Oh yes... quite pleasant." you say, recalling the morning's vengeance.}
{ControlTeen||ControlRoad:Winfred stammers in reply- "Ah, aha... well no." he nervously proffers his hands toward a nearby booth- "Uh. P-please... take a seat."}
Winfred invites Estelle to sit in the MyData Privacy Booth and when they do Winfred turns on the Audio Filter, preventing any sound from getting in or out.
->OrderCoffee

=OrderCoffee
Winfred offers Estelle something to drink.
*[Ask for the usual, it might help you relax]->HasOrderCoffee
*[Get down to business]->NoCoffee

=NoCoffee
Estelle skips the drink
->BusinessConversation

=HasOrderCoffee
Estelle asks for a very complex and expensive drink
->BusinessConversation

=BusinessConversation
Winfred pulls out his briefcase containing the topic of their meeting.
He builds it up, talking about how amazing it is.
*[Hurry him up]"Get on with it, Winfred."
*{rageMeter < 2}[Let him talk]You let him go on, it's actually a little interesting
- ->BusinessReveal

=BusinessReveal
{HasOrderCoffee:->CoffeeArrives->}
Winfred reveals that he has found a legal loophole that allows Estelle's 'parenting device' to be produced and marketed.
Winfred chuckles excitedly- "If we register it as an 'Assistive Technology' then it will be marketable for use on children. All we need is the permission of the parent and- we're in the money!"
Estelle is impressed, which is rare. 
{HasOrderCoffee:She raises a toast to Winfred and to a profitable business partnership. She sips the coffee and realises that it isn't what she ordered, and gets angry.->WrongOrder->}
->BusinessMeetingConundrum

=WrongOrder
It's disgusting- is that <i>arabica beans</i>?! What am I? Part of the pitiful proleteriat?
*[Swallow it down]->ControlCoffee
*[Complain]->ReactCoffee->
->->

=ControlCoffee
~rageMeter ++
You hold in your rage...
->BusinessMeetingConundrum

=ReactCoffee
You flick off the privacy filter and yell across the room- "Where is the waiter?!"
A young woman in a green apron hurries over.
"Good morning miss, what see-"
"This coffee. Is. Wrong. I requested Kopi Luwak and this is clearly arabica. Do they not teach you how to <i>read</i> in coffee slinging school?"
The cafe worker starts to speak, but not before you can cut in-
"Now do your <i>job</i> and bring me the <i>correct order</i>- or do I have to get my personal assistant in here to make a <i>passable</i> cup of <i>Kopi Luwak</i>? <i><b>Hmmmm?</i></b>"
The young woman blinks for a moment, awestruck before hurriedly taking your barely touched coffee.
She stammers- "I-I'm so sorry madam, I won't be a moment." before hurrying away.
->->


=BusinessMeetingConundrum
TODO fix logic
{ReactCoffee:Winfred carefully switches the privacy filter back on, shivering in the presence of your ire. You feel a little better now.} 
Winfred hushes his voice, clearly forgetting he is in a soundproof bubble- "Now that we have a way into the market we can discuss future iterations... and methods of control..."
Estelle's excitement is tempered by a memory. When the 'parenting' device was being trialled she was told that one of the subjects had escaped. Should she mention it?
*[No, it could sour the business deal]->BusinessDeal
*[Yes, cards on the table]->EscapedChild

=BusinessDeal
TODO
You straighten up and get to business- "You're getting ahead of yourself, <i>Winston</i>. Before we even <i>think</i> about marketing to the general populace we need to establish consumer trust."
Winston seems a little taken aback, you love it when that happens- "W-well how do we get them to trust us?" he stammers.
The under 13 market should give us the opportunity to showcase the product- show just how effective it can be in managing <i>unwanted</i> behaviours." You begin to tap your well manicured nails on the table. "But how will we get the rest of the populace to install the device in their <i>own</i> heads, Wilby?"
William starts sweating a little more as he tries to formulate a reply...
->BusinessDecision1

=BusinessDecision1
*[Focus on <i>unwanted</i> behaviours]->GoodBusinessDecision1
*[Install the device in famous sport stars]"We install the device in the mind of a famous sport star- the people will follow suit! Who wouldn't want to emulate their 'heroes'?"
Wigfrid replies, sweating- "Uh, y-yes... but..."
<i>But?</i> What problem could there possibly be with that plan? "Spit it out Wallaby!"
"W-well what if they underperform... or there are complications? We couldn't cover that up..."
->BadBusinessDecision->
*[Use the device yourself!]
"I will undergo surgery, have the device implanted in my <i>own</i> mind. What creator would use a device they didn't trust?"
Wigfrid replies, sweating- "Uh, w-well... okay... but..."
You barely hold in a scream- "<i>Damn it Wayne</i> If you have something to say then <b>say it</b>!"
Welles stammers out his concern- "Well, people don't really trust you... I mean that they don't really know <i>you</i>." he shrugs "They might even say you're faking it?"
->BadBusinessDecision->
- ->BusinessDecision1

->END

=BadBusinessDecision
~rageMeter ++
{Infuriatingly, he's right...|Urgh! How could you miss that!?|Urgh... that's true...}
->->

=GoodBusinessDecision1
"We focus on their unwanted behaviours, Wan'ye! What <i>average</i> person doesn't have some habit they want to <i>kick</i> or some perceived behavioural failing? Our device can make them a <i>better version of themselves</i>. Hm, we should trademark that..."
Whoopie perks up at this thought- "Ha! Genius!" he chuckles excitedly "The consumer finds their own failings, and our device comes to the rescue!"
Hm, this Winfred fellow isn't all that bad. You snap back- "Yes, obviously Winfred. That's what I just said."
Winfred sits forward in his chair- "But how do we hide the fact that we are... manipulating the device?"
A good question... annoyingly. People don't like to be manipulated, generally speaking. How do you make the device more <i>covert</i> in its true purpose?
->BusinessDecision2

=BusinessDecision2
*[Wait until trust is developed]"We allow the world to consume the product without manipulation for some time, only introducing our <i>true</i> purpose once trust is formed." you say, smugly.
Winfred replies- "Well, yes that could work. But what if another company markets their own version? Or if interest drops off?"
Hm, that's true... "Good work, Winfred... the true solution is this..."
->BusinessDecision2
*[Delusion]->GoodBusinessDecision2
*[Manipulation isn't all that bad, what's the problem?]"Once the people realise how much happier they are to be controlled, they'll be lining up to have the device installed!" even as you say it, it sounds a little off.
Winfred replies, with an infuriating confidence- "Oh people do <i>not</i> like to be controlled- trust me- I work for MyData!" he chuckles.
You snap back angrily- "Of course, Wiggins- that was a joke. Stop laughing you look ridiculous."
->BadBusinessDecision->BusinessDecision2



=GoodBusinessDecision2
"We manipulate the minds of the users, subtly." you go on "The power of the human mind to make connections, formulate logical conclusions... to imagine a profitable scenario- it's endless. That's why the device works so well in children, their imaginations are not yet tempered by reality."
Winfred does his little deighted chuckle again- "Oh yes! The people would do anything if they thought it was their idea in the first place!" he continues excitedly "Who would go against their own judgement? Even when it's just <i>our judgement</i> in personalised packaging?"
Oh this is getting fun now! This Winfred fellow would make for a good minion... er... assistant.
You double check the privacy filter is still turned on- now for the true reason you're meeting with this fellow...
->DownWithMyData

=DownWithMyData
"Now Winfred, I take you for a brave soul." you lie- "-and you are of quite a high standing in the MyData corporation." (that one's true).
Winfred's expression changes slightly, he seems concerned.
You continue- "We both know that a device such as this would cause concern among your colleagues. I mean, EurekaTek- having complete control over the people's desires? Your one <i>true</i> rival corporation, and complete control over the market?" you pause to hear Winfred's response.
He shuffles in his seat- "Yes, the thought had occured to me."
He seems to be holding his cards close to his chest... you go on- "Well, surely EurekaTek would have a hard time marketing such a device, while MyData has control over the media?" you get to brass tacks "My suggestion is this... a collaboration."
Winfred's worried brow sudenly eases- "Ah, ha! An excellent suggestion!"
You let out a mental sigh of relief and respond, in a measured and professional manner- "Very good. Of course MyData would be a silent partner, public opinion of MyData is at an all time low, of course."
Winfred nods in response- "Yes, it is unfortunate. The people simply don't like <i> authority</i> these days..."
->EstelleFinish

=EscapedChild
You raise an eyebrow and give Winfred a meaningful look- "Now before we go on, I must mention a small hiccup we faced in the testing process."
Winfred raises an eyebrow in return, you continue- "I received a report that a child had escaped the facility, she took one of our earlier prototypes with her. We have some our best investigators on the hunt for the child- but in the unlikely case that she makes herself known... well it would not be in our best interest."
Winfred slowly nods- "I understand. I will get some of my people to look into it... if you like?"
You raise the other eyebrow- "It won't be necessary... but feel free to send any information my way... if you deem it credible."
Winfred takes a sip from his tea, and continues- "Well- with that out of the way let's get down to how we can use this device for our <i>true</i> purposes!"
->BusinessDeal
->END

=CoffeeArrives
Estelle's coffee arrives
->->


=EstelleFinish
TODO wrap up Estelle's tape and go back to the apartment
As the two continue to discuss their business you get a sudden sensation of being a fly-on-the-wall. You were Estelle just a moment ago... but who are you now?
->LeavePersonaTape

=== Torelin
TODO Torelin
This is where you play as Torelin
->END

=== RecollectiveInvestigation ===
 Autosaved! #autosave #sfx:Loaded
 ->NeuralInterface
 =NeuralInterface
 #colour: White
 #scene:NeuralInterface
 #music: NeuralInterface

 >BEGIN RECOLLECTIVE INVESTIGATION<br>CONNECTING TO NEURAL INTERFACE
{neuralInterfaced == 1: You calm yourself as the tape begins it's connection with your mind...  ->->} 
{neuralInterfaced == 0:Before you realise what's happening the tape hi-jacks your neural interface through the CompuDeck and you get the telltale tickly feeling on your brain. The tape is interfacing with your mind!} 

    +[Relax your mind, let it happen]->->
    +[Fight back!]
        ~ neuralInterfaced = 1
        #secret:memories #sfx:RevealedSecret
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
    
    ***[...when you found your passion...]Night after night while laying in bed you'd listen to the sound of the true crime documentaries playing in your parent's living room. One night you had the courage to sneak out and watch the documentary from the hallway...
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
    You took it upon yourself to control the gang leader yourself and send him into the local museum to steal the world's largest diamond... but he woke up just as you were about to snag the diamond... wait... why would you do that? That's kind of crazy... was that real or..?
    
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
    
    

===WorkInProgress
 #colour: workinprogress 
<b> Note from the author:</b> ...to be continued! I will be continuing to work on this project until 2025- let me know your thoughts and any feedback!
 I hope you had a great time- feel free to restart from the menu and find all of the secrets if you haven't already! Follow me for updates if you want to give the game a try when it's finished.<br>-Chris Niekamp
 *[Play again!] #RESTART
 ->END
 
 ===LeavePersonaTape
 #colour: White
 #scene:NeuralInterface
 #music: NeuralInterface
 You are the space inbetween, the blank page between the lines... and then...
 #colour: MyData #music: ApartmentBlues #scene:CompuDeckTapes
You are you.
->ReturnToTheApartment


 ===ReturnToTheApartment
 TODO Regular apartment choices and random events based on how many tapes have been explored
 You're back!
 ->END
 
 
 
 
 