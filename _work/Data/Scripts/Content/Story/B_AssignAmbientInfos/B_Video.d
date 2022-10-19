// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //A single prisoner altered the fate of hundreds.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //But he paid a high price for it...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //He defeated the Sleeper, destroyed the Barrier ...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //... but, while all the other prisoners escaped, he remained behind in the rubble ...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //It was I who dispatched him against the Sleeper.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //It is now I who brings him back from there.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //He is weak and has forgotten much.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //But he is alive ...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //He is - back!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(at the campfire) Of course he's still alive. What did you think?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Let's hope so ...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(ground shakes) Did you feel that?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //What?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //The ground...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(astonished) Xardas! What ...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(complains) Not now ...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(fanatically) I am ready for it ... choose me! Yeah ...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(to himself) Where is he?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(quoting) And the human slew the beast and it entered into Beliar's realm...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardas! What exactly happened in the Temple of Irdorath?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //With the help of Innos, you have defeated the avatar of Evil.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //And I have taken its power unto myself ...
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Since I left the Circle of Fire, this alone has been my goal.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //In order to achieve it, I have helped you to fulfill your purpose.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //What was denied me in the Temple of the Sleeper has now finally come to pass.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar has chosen me.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //So you obey the god of darkness now?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //No. I do not obey Beliar any more than you obey Innos!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Not even the gods know what fate has in store for us...
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //And I am only just beginning to grasp what options are open to me...
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //But one thing is certain. We SHALL meet again ...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(calls) Cast off!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(looks in the distance, sees something) hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(mumbles) Oh, shit!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(pained coughs, choking) - (various)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh! (various)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(long drawn-out death scream, 4 seconds)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Close the gate!!! (various)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Stop them!!! (various)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh! (various)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //We're overloaded. We have to toss some of the gold overboard.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Get your hands off the gold!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Listen, it would really be better if we ...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //I don't want to hear any more about it ...
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //I've heard the war with the orcs is going badly ...
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //And?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //We probably won't be able to spend all the gold anywhere ...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //The gold stays on board!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //What good is the gold if we capsize in the tiniest storm?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //But I don't see a storm ...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Not YET ...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Relax! Everything will turn out all right!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(astonished) ... humans?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(scornfully) Humans are weak.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(scornfully) They succumb all too easily to the temptations of evil.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //And so, they get involved with powers they do not understand, and certainly cannot control.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Those who are steadfast in their faith have already begun the battle against the enemy.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //After the fall of the Barrier and the banishment of the Sleeper, Beliar's wrath has grown even greater!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //A mighty artifact, so it is written in the old scriptures, will be brought back to this world.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(quoting) 'When the God of Darkness sends his henchmen out to search'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //And just that has happened. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //This search - has long since begun!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //In their search, Beliar's henchmen are desecrating the oldest shrines of the gods.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Beliar's henchmen are desecrating the oldest shrines of the gods.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //The guardians of these holy places have awakened. And their wrath - makes the earth tremble!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Every powerful magician on this island can sense this wrath. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //And some of them have certainly begun to face the threat.
};
