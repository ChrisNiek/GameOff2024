VAR tapesFound = 5

VAR gravyBabyTubesEaten = 0

VAR ramenEaten = 0

VAR currentRadioStation = "none"

VAR isConnectedToNewWeb = 1

-> Intro

=== Intro
 #scene:TVPresenterIntro
 "On October 28th, 2066 a small cafe in Melbourne’s business district was involved in a massive data heist, later known as the 'Breach'."

"The cafe was in the lobby of the world famous <b>MyData</b> corporation, a company that prides itself on the safe storage of personal user data, but no one - <i>not even <b>MyData</b></i>- could have prevented what came next."
*["The heist of the century..."]
-"The bank was infiltrated using underhanded tactics. In a swift and inhuman act an Exabyte of information (1 billion gigabytes) of data began to leak from the data vaults."
"Later it was found that the data access point, safely nestled hundreds of floors below, was somehow accessed through a gap in the cafe break room less than a centimetre wide."
"By the time <b>MyData</b> discovered the leak it was too late, the data had fallen into the hands of the populace and had begun to circulate on the <b>Web</b>. <b>MyData</b> quickly released a statement- doing their best to prevent the world falling into chaos."
**["But they failed..."]
--"Alas, the people did not acknowledge the statement and follow <b>MyData</b>'s guidance. Lives were lost, businesses were left open to plunder and the darkest secrets of the world’s superpowers became accessible through a simple <b>Web</b> search."
"Unable to control the rabble <b>MyData</b> had no choice but to cut access to the <b>Web</b>, sending the world into the <b>New Dark Age</b>." 
"Slowly but surely, <b>MyData</b> began to rebuild the <b>Web</b>, and the world, from the ground up."
"Thanks to the hard work of <b>MyData</b>, the people started to leave that horrible event in the past, and began to look to the future."
***["Then we see the light..."]
--- "But eventually, rumours began to spread. Illegal and primitive 'Pirate Radio' stations and indie-news agencies began to discuss the possible existence of so-called <i>evidence</i> from the <b>"Breach"</b>." 
"As the rambling went on, corrupted ex-<b>MyData</b> employees came forward with further misinformation. Before their termination they <i>claimed</i> there were physical copies of data gathered from the witnesses- and so began the laughable search for the <b>'Persona Tapes'</b>." 
<i>The TV presenter continued, scoffing and rolling his eyes.</i>
****["The tapes..."]
"While backwater wannabe hackers search the wide world for these ridiculous 'Persona Tapes' <b>MyData</b> continues to do the REAL work. Working hard to bring this <b>New Dark Age</b> to a <b>Bright New Future</b>!"
"Stop thinking about the past, log into your MyData+ account and join us on the New Web forums. Become part of the <i>FUTURE</i>!" 
*****["Enough of that garbage." (Turn off the TV)] You punch the off button on the remote and the phony grin of the presenter is wiped away. The TV screen crackles and fades to black, leaving you alone in your untidy apartment with only the distant sound of the Melbourne city streets below keeping you company.#scene:ApartmentMessy 
    -> PartOneTheApartment

=== PartOneTheApartment
{&You sigh deeply|You stretch your limbs|You stifle a yawn} as you {&look around your dump of an apartment and wonder what to do.|think of what to do next.|ponder your options.} {&Life as an out of work Private Investigator is starting to get stale, and your apartment has the smell to go with it.|With the crime rate at an all time high you'd think a P.I. would have something better to do than wander around a trashy apartment. | Absentmindedly kicking a piece of trash you begin to ponder existence...|No one has the money or the guts to seek justice anymore, so what's the point of being a P.I.?} #scene:ApartmentMessy 

*[Grab a bite to eat] With frunk-all creds to your name you decide to eat in. Hopefully you'll have enough to pay it off come rent day. You head to the <b>VenderKit</b> and as the display lights up you look over the options. #scene:VenderKit 
->VenderKit 

+ {VenderKit}[Another trip to the <b>VenderKit</b> couldn't hurt...] {&Salt is good for you, right?|Nothing else fun to do but eat!|...and I don't even have to wash the dishes after!} You poke the <b>VenderKit</b> screen to wake it up and survey your options... #scene:VenderKit 
->VenderKit

+ {currentRadioStation == "none"} [Flick on the radio] ->RadioApartment

+ {currentRadioStation != "none"} [Change the radio station] Time for something a little different...#scene:MediaStationOff
->RadioApartment

+[Clean up your apartment] ->CleanApartment

=VenderKit 
    + {not ChooseBurrito} [A Neato Burrito will fill me the hell up- and then some] You tap the 'Neato Burrito' logo on the display. The speaker plays a husky voice straight out of some B-Grade spaghetti-Western flick
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
        
    * {ChooseBurrito && ChooseBurritoAgain} [What's one more burrito? I probably have to get my stomach pumped anyway.] You begin to reach for the <b>VenderKit</b> screen- then you hesitate... 
   These burritos are no joke, there's a risk that I could die here. Out of work, in a garbage dump of an apartment with three massive burritos where my guts should be.
        ++ [It's worth the risk.] I mean, if you aren't letting yourself indulge every once in a while, are you really living?
            +++ [But seriously?] Are you completely sure? You will probably die due to a burrito overdose.
                ++++ [There is no better way to die] You punch the button, the raspy voice rattles like the bones of the Grim Reaper.
            "Hola! Choose your flavour, amigo!"
            Ah yes, amigo...
            My dear friend.
            You are my one and only friend, burrito. Let me embrace you one last time...
        -> DeathByBurrito
                ++++ [No, snap out of it!] You tear yourself away from the <b>VenderKit</b>- your skin wet with sweat. What is in those things?!
                After a brief rest to recover you move on. #scene:ApartmentMessy
                ->PartOneTheApartment
        ++ [There's more to life than burritos... let it go.] You step back from the machine and shake yourself out of it. Why are you doing this? What the hell is in those things?!
        You take a moment to calm down before moving on. #scene:ApartmentMessy
         ->PartOneTheApartment
        
     
        
    + {not ChooseRamen} [Gotta go with CuppaRamen, my light in times of darkness] You tap the 'CuppaRamen' logo on the display. 
   A chirpy voice blasts out from the in-built speaker "Caaaa-uppa RAMEN! Pick your flavour!"
   
        ++[Chock'a'Blocka Chicken] You recall the one time you had this flavour of CuppaRamen as a child, back then it actually tasted like chicken... at least you imagine it did- you've never had actual chicken before. You {&prod|poke|tap|press} the 'Chock'a'Blocka Chicken' option on the display.
        ->ChooseRamen
        
        ++[Killer Krill] It turns out Krill is easy to manufacture, and so after the <b>Web</b> went down any and all seafood products were replaced with real, bonafide krill. According to the old folks it tastes like 'shellfish'.
        You {&prod|poke|tap|press} the 'Killer Krill' option on the display.
        ->ChooseRamen
        
        ++[Happy Cow Vegan Beef Sirloin] As a child you learned that beef was once one of the most popular meat products in the world. There were whole pastures dedicated to housing and feeding the cows until they fattened up enough, at which point they were killed and made into meals for the people. Plenty of food, clean air and a quick death. Lucky frunking cows.
        Now it's all synth-beef, no more homes for cows... no more cows.
          You {&prod|poke|tap|press} the 'Happy Cow Vegan Beef Sirloin' option on the display.
          ->ChooseRamen
            
        ++[Nah, I've had enough of CuppaRamen (choose something else)] You glimpse the tower of empty CuppaRamen containers scattered around your apartment- maybe it's time for a little variety... ->VenderKit
        
    + {ChooseRamen} [Back to ol' faithful, one cup is never enough.] As you poke the 'CuppaRamen' option on the display you notice that some of the LEDS in that particular section seem to be dead- perhaps due to being pressed too hard... or too often.
        You take a look at your options...
        
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
        ++[{&On second thoughts, maybe something else?|Not really feeling that one...|Ugh, ok not that one.}]
        ->VenderKit
        
    +{ChooseGravyBaby} [Get yourself some more of that delicious GravyBaby sludge] 
    ->ChooseGravyBabyAgain
        
    + [On second thoughts I'm not hungry...] With a glance at the options on your <b>VenderKit</b> you suddenly feel less like eating. #scene:ApartmentMessy
    ->PartOneTheApartment
    
=ChooseBurrito

     The voice rasps "Niiiice choice! Enjoy, muchacho!"
            There's a whir as the <b>VenderKit</b> synthesises the order, then a satisfying 'CLUNK!' as the burrito falls from the vending chute.
            You pick it up, tear open the foil and tuck in. The nondescript filling fills your mouth with salt and fat- you're pretty sure you can feel your pupils dilating from the sheer force of flavour.
            As you scrunch up the empty foil packet and toss it into a corner of the room the burrito resolves itself to become a brick in the pit of your stomach. You might regret it later- but man did it hit the spot. #scene:ApartmentMessy
            ->PartOneTheApartment
    
=ChooseRamen
    ~ ramenEaten = ramenEaten +1
    You hear the familiar sound of the CuppaRamen falling into place, a whir and a pop as the lid is poked open and the cup filled with boiling water. The trickle of the soon-to-be salty broth is music to your ears.
    After a moment the cup falls into place in the vending chute. You grab the attached plastic fork, peel the lid off the cup and breathe in the scent.
    You savour every moment as you twirl the noodles onto the fork and send them to the ramen afterlife. 
    For the briefest of moments you forget just how pointless your life is.#scene:ApartmentMessy
    ->PartOneTheApartment

=ChooseGravyBaby
    ~ gravyBabyTubesEaten = gravyBabyTubesEaten +5
    The <b>VenderKit</b> whirs and you hear the newly synthesised sludge get shot into the tubes, one by one they fall out of the vending chute.
    You feel a small sense of shame as you rip open each tube, but as you down the delicious goo that shame fades away, taking your hunger with it. This is good shirt. Those babies know what they're talking about... 
    Well... babbling about.#scene:ApartmentMessy
    ->PartOneTheApartment

=ChooseBurritoAgain
    Your stomach lurches in complaint as you tear open the foil and dive in to your second, humungous, burrito. The salt hits and you're pretty sure you can feel the grease begin to make its way into your bloodstream.
    It hurts so good.#scene:ApartmentMessy
    ->PartOneTheApartment
    
=ChooseRamenAgain
    ~ ramenEaten = ramenEaten +1
    The cup falls into place, the whir, the pop... that soulful trickle. 
    You can't help but feel a spark of joy in your heart as you wait for the boiling water to work it's magic.
    The cup drops safely from the chute and once again you are comforted by the salty, warm broth of CuppaRamen.
    Screw the haters, you can't possibly have too much ramen. #scene:ApartmentMessy
    ->PartOneTheApartment

=ChooseGravyBabyAgain
    ~ gravyBabyTubesEaten = gravyBabyTubesEaten +5
    Maybe your initial calculations were incorrect? 5 tubes of GravyBaby couldn't possibly be enough for an adult. You're worth at least {gravyBabyTubesEaten} babies, surely?
    The whir of the machine, the spurt of sludge and you are the proud owner of 5 more tubes of GravyBaby Nutri+.
    You down them like shots of ambrosia and before you know it you're out of tubes again. #scene:ApartmentMessy
    ->PartOneTheApartment
    
=DeathByBurrito
TODO Death by burrito content
Work in Progress! Come back later to die from a burrito overdose.
->END
    

=RadioApartment
{& You meander over to the Media Station to use it's radio function. Unlike TV there are still a few radio stations out there that don't spout corpo garbage 24/7.| You wander back to the Media Station and consider your options. | You stand by the radio, what else is there to listen to?}
 
    
    +  {currentRadioStation != "NoiseFM"} [Time for some music- 106.5, Noise FM!] You crank the dial over to Noise FM and the scream of TechnoPunk fills the room. #scene:ApartmentMessy
    ~ currentRadioStation = "NoiseFM" 
    ->PartOneTheApartment
    
    +  {currentRadioStation != "CBA Classic"} [How about something with a bit of class? CBA Classic!] You turn the dial over to CBA Classic, Australia's premiere classical radio station. #scene:ApartmentMessy  
    ~ currentRadioStation = "CBA Classic"
    ->PartOneTheApartment
    
    +  {currentRadioStation != "PirateRadio"} [The only station with something important to say: Pirate Radio] You twiddle the dial until you find the telltale crackle of the encoded signal and switch on your decoder. It seems like they're on a station break, but the music they play isn't bad.#scene:ApartmentMessy  
    ~ currentRadioStation = "PirateRadio" 
    ->PartOneTheApartment
    
    + [Let's stick with the ambience of the world's most frunked up city. (no station)] Time for some radio silence.#scene:ApartmentMessy  
     ~ currentRadioStation = "none"
     ->PartOneTheApartment
    
=CleanApartment
    {You take a look around your cramped apartment. The studio apartment wasn't exactly big to begin with, then the <b>VenderKit</b> was installed, taking up a good chunk of space. Between that, the Media Station, the Sani Station, the trash and your single bed there's hardly room to move around.|}
    
    {Strewn across the room are a few towers of empty CuppaRamen cups{ChooseBurrito:, a greasy burrito wrapper} {ChooseBurritoAgain:followed by the SECOND greasy burrito wrapper}{ChooseGravyBaby:, {gravyBabyTubesEaten} empty tubes of GravyBaby} and the random scraps from assorted snacks you've had to help pass the time|}
    
    {Maybe it's about time you gave this place a clean?|Time to get to work.|You swear you'll feel better once this trash is dealt with.|You consider the task of possibly... maybe... cleaning up.}
    
        *[Pace around the room] You try to pace around, just like you used to do when you were pondering a case- but the sheer amount of trash leaves you only enough space to walk in tight circle.
        ->CleanApartment
        
        *[Consider the prospect of NOT cleaning up] Maybe this level of trash is normal though? Maybe it's part of the natural... city-slummer... ecosystem?
            **[Yeah! You can't mess with the ecosystem!] That's right! If you were to remove the trash it could...
                ***[Harm the wildlife?] Well... the roaches wouldn't be happy would they? I mean, think of the vermin for once...
                    ****[It's just basic science.] You glance around the trash heap and as if on cue a small rat crawls out from an empty CuppaRamen cup and peers at you with it's beady eyes.
                        *****[Ok, maybe it's time to clean up...] You sigh, pour the rat out of the cup and into the hallway and begin to clean up... 
                        ->FindingTheTapes
            **[What are you even saying right now?] Wow, you're great at procrastinating... but this is ridiculous.  
            ->CleanApartment
            
        +[Get cleaning!] You stand up straight, clap your hands together and get to work... 
            ->FindingTheTapes
        
        +[Cleaning can wait, let's do something else] Cleaning has well and truly waited, and it can wait a little longer.
        ->PartOneTheApartment
    
    ->END

===FindingTheTapes
->Cleanup

=Cleanup
With a newfound sense of purpose you grab a fresh garbage bag, peel it open and look at the job that lies ahead.

That is a lot of trash...

* [This is going to be cathartic] This trash has smothered you for long enough, let's do this!
    **[There is a lot of trash, though] You stand up straight and gather your willpower. You can do it! 
    As you pick up the pace you start to fill bag after bag, tossing them into the trash compactor chute as you go. This is kind of nice, actually. 
     *** [Keep at it!] As the amount of junk diminishes you see whole swathes of the apartment that you haven't seen in some time. For the final flourish you switch on the ChoombaRoomba to suck up any sneaky crumbs.
     ->NoticeMail
* [This trash is going to wish it was never born] You draw on some kind of primal strength within you. 
Let's DO this!
With adrenaline {PartOneTheApartment.ChooseBurrito: and burrito grease} flowing through your veins you tense up your muscles and go to town on the trash heap.
    **[Clean that mother-frunker UP!] You crush the ramen cups, scrunch the chip packets and sweep the crumbs, stuffing them into bag after bag and throwing them into the trash compactor- where trash goes to die.
        ***[There will be no survivors.] With one final sweep of the apartment you stuff the last, half empty bag into the compactor and switch on the ChoombaRoomba to suck up any sneaky crumbs.
        ->NoticeMail
        
            
            
->NoticeMail

=NoticeMail
You stand proud in the centre of your apartment, surveying the results of your hard work. 
I mean, you can see the floor now!
As the ChoombaRoomba whirs along happily sucking up the crumbs you notice something curious.
Just beside the door, stuffed into a milk crate is a collection of snail-mail- a few aged envelopes and one shoebox-sized cardboard box.#scene:ApartmentClean
    *[Now where did that come from?] You recall some time ago when you were focused on a particularly complex case ({~something about a giraffe being smuggled interstate|some guy was found pickled to death at a pickle factory|a kid lost his cat up a tree- and damn are those things rare}).
    You must have pushed them aside while you worked the case, only to forget they even existed.
        **[Until now...]
        ->ExamineMail

        
=ExamineMail
        {You walk over to the crate, hoist it up and pour the contents out over your bed.|}
                    *[Look at the letters] You glance over the envelopes- some bullshirt from MyCouncil about parking rates, an ad for the latest Nova-Cult and a takeaway menu for 'La'Lucky Pizzeria'.
            All trash... except maybe that last one.
            -> ExamineMail
            *[Peer at the parcel] You pick up the parcel- surprisingly heavy for it's size.
            Looking over the parcel you find no address, how the hell did this get    here? Did a courier drop this off?
                **[It can happen...] It's not the first time you received an unmarked parcel, maybe it's that CuppaRamen Deluxe you ordered from the black market? 
            You weigh it in your hands.
                ...Some pretty hefty ramen...
                You grab a knife and start cutting into the parcel. With a bit of effort you cut through the tape and manage to get a side open. There seems to be some kind of reinforced case inside, taking up the entire interior of the box...
                    ***[Pull out the case] You wedge your fingers into the box and slide out the case. It falls out onto your mattress with a thump.
                    You give it a look over... wait a sec, that logo on the cover... that's the <b>MyData</b> logo! This isn't good, only <b>MyData</b> employees are allowed to own something like this.
                    ****[What in the....] You let out a hoarse whisper, "What in the actual frunk is going on here?"
                        *****[Open the case] Carefully, you open the latch on the case, half expecting it to immediately explode in your face.
                        It doesn't.
                    ->FindTapes
            
            
=FindTapes
{Inside the case are 5 data cartridges, each one nestled gently within a foam lining.|}
{All the cartridges seem to have a little, blinking red light. There's also a coloured label on each one.|}
{|You start to shake, you think you might know what these are... but it's safer to be sure...|}
*[Investigate the lights] As you investigate the blinking lights you notice that each cartridge actually has a strip of 6 LEDs, two red, two yellow and two green. Currently, only one red light is lit up on each of the cartridges.
->FindTapes
*[Read the labels] The 5 cartridges all seem to be exactly the same, save for the labels. On each coloured label is written a different name...
'Kiera' in Bright Yellow
'Winfred' in Powder Blue
'Jamie' in Forest Green
'Estelle' in Rich Purple
'Torelin' in Rust Red
->FindTapes

* -> 
Your blood turns cold as you realise what these are. 
Holy frunk-cakes, these are the frunking Persona Tapes!
-> PartTwoThePersonaTapes

===PartTwoThePersonaTapes
{You begin to pace around the apartment, the Persona Tapes resting in the centre of your bed. What does this mean? What do you do with these things?|}
{ |You continue to pace...}
*[This is a chance to figure out the mystery!] You can finally know what happened that day, the day that led to the destruction of the <b>Web</b> and the dawn of the <b>New Dark Age</b>. You tremble with excitement at the prospect{PartOneTheApartment.ChooseGravyBabyAgain: (and not just because you're full to the brim with {gravyBabyTubesEaten} tubes of nutrient rich goop)}. 
This could become your greatest case yet. Better even than {~the case of the sewer-gator|the case of the sleepwalking gang-boss|that one episode of Law and Order, the one with the monkey}.
With that thought in mind you pull out your CompuDeck from under the bed, brush off the dust and boot it up... #scene:CompuDeck
->TheInvestigationBegins
+[These tapes are dangerous] You start ruminating on what would happen should <b>MyData</b> find out you have the tapes...
    **[Maybe they'd reward you?] Sure, they'd be glad to get their hands on these tapes, but whose to say what happens to you after? They'd probably kill you just for laying eyes on them.
    ->PartTwoThePersonaTapes
    **[They'd kill me] They'd sooner shut you up than have to admit the existence of the tapes.
     ->PartTwoThePersonaTapes
    **[I could tell the world before <b>MyData</b> even found out] Sure, you could- but <b>MyData</b> would probably just hush it up, call it a hoax and kill you off on the sly...
     ->PartTwoThePersonaTapes
     ++ ->
     {& "...perhaps if I wrote it in a friendly email..."|"...maybe they'd cut me some slack since my mum used to be on their <b>MyData</b>+ Plan..."|"...no, they wouldn't... would they?"}   ->PartTwoThePersonaTapes
     


=TheInvestigationBegins
{The screen takes a sec to get it's shirt together, but eventually you're greeted with the desktop. You take a moment to gather your thoughts.|}
{You know that the Persona Tapes hold valuable information about the 'Breach', that fateful day where the <b>MyData</b> vaults were infiltrated, but you don't know what kind of information it is.| }
*[Punch in the data tapes!]
->UploadTapes
*[Let's not be too hasty, I should go over what I know first] A good investigator always takes stock of a situation, you create a new readme to gather your thoughts.
->CaseLog
+ {isConnectedToNewWeb == 1} [Make sure you're not connected to the <b>New Web</b>- <b>MyData</b> could be watching...]
~ isConnectedToNewWeb = 0
{&Your heart skips a beat as you realise how easy it would be for <b>MyData</b> to find you, should the tapes connect to the  <b>New Web</b>. Best to turn it off.|No, it's too dangerous. I have to sever the connection.|My data is my data, <b>MyData</b>- not your data!} (you turn off the  <b>New Web</b> link on your CompuDeck)
->TheInvestigationBegins
+{isConnectedToNewWeb == 0} [Turn the  <b>New Web</b> connection back on, you may need it] 
~ isConnectedToNewWeb = 1
You switch on the connection and the signal returns. (you turn on the  <b>New Web</b> link on your CompuDeck)
->TheInvestigationBegins

=UploadTapes
TODO upload tapes section
->END

=CaseLog
TODO caselog for current clues related to the case
You peruse the Case Log. What topic would you like to check?

+{UploadTapes} [The Witnesses] {You add a new entry to the case log...| } \ { |You read the entry...}
TODO  The Witnesses case log entry
Blah blah tapes
...
->CaseLog

*{UploadTapes} [Recollective Investigation] {You add a new entry to the case log...| } \ { |You read the entry...}
TODO  Recollective Investigation case log entry
Blah blah recollective investigation
...
->CaseLog

+[<b>MyData</b>] \ {You add a new entry to the case log...| } \ { |You read the entry...}
<b>MyData</b>/Corporation
<b>MyData</b> is the world's forefront data storage service, and has been since the early 2000's, when they began providing free internet usage to the globe. 
As the human race became more reliant on technology it was <b>MyData</b> who provided the access to these new technologies. Soon enough it was almost impossible to interface with the world without a connection to <b>MyData</b>'s '<b>Web</b>'.
As the corpo became more powerful it became clear that they were not providing a service to the people, but instead attempting to control them. Unfortunately, by the time the world became aware it was too late. The world had come to rely on the <b>Web</b>, to disconnect from the <b>Web</b> would be to disconnect from society.
So the people continued to live under <b>MyData</b>'s rule... that is until the day of the Breach. Now <b>MyData</b> is only a shred of what it once was, and as the corporation attempts to rebuild the <b>Web</b> (see: the  <b>New Web</b>) they slowly attempt to return to power.
...
->CaseLog

+[The Breach]\ {You add a new entry to the case log...| } \ { |You read the entry...}
The Breach/Event
On October 28th, 2066 a small cafe in Melbourne’s business district was involved in a massive data heist, later known as the 'Breach' this event would go down in history as the day <b>MyData</b> fell out of global power. 

According to a press release from <b>MyData</b> the heist was performed without their knowledge, and by the time they discovered evidence that the data leak had begun the culprits had vanished without a trace.

The same press release explained that the 'terrorists' had infiltrated their data vault by creating a gap less than a centimetre wide in the walls of the cafe above, allowing them to somehow reach the access point and begin leaking data.

A week later <b>Web</b> users around the globe began to report their personal information had been shared illegaly, and days after that sensitive information surrounding businesses, governments and corporations began to surface. The sudden influx of data caused a worldwide panic and <b>MyData</b> decided to cut access to the <b>Web</b> in order to prevent further catastrophe.
The world went quiet, almost all technology had relied on the <b>Web</b> to function and now the <b>Web</b> was no more.
The event known as the Breach had far reaching consequences, but other than the meagre amount of information provided by <b>MyData</b>, not much is known about why or how the Breach took place.
...
->CaseLog

+[The Persona Tapes]\ {You add a new entry to the case log...| } \ { |You read the entry...}
The Persona Tapes/Item
TODO Persona Tapes Case Log entry
...
->CaseLog

+[Close the Case Log] Ctrl+S, Alt+F4...
->END