///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //So, you slimy worm, you have indeed dared to come before the gate of the master.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //Are you the one pulling the strings here?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //I am the Guardian of the Halls of Irdorath. The mightiest source of Beliar's power on earth. The divine strength of the master flows through my hands.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Only one word from me and you will fall into eternal madness.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //I see. Guess I'll have to rid myself of another middleman.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"I'm at the last gate. The black mage seems to be the key."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Take me to your master.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Just how many more of your kind will I have to kill?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "What's hidden behind that huge portal over there?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Who's your master?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "You used to be a follower of the Sleeper.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Who's your master?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //He is a wanderer between the worlds. His divine wisdom enlightens us.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //He is the chosen of Beliar, who will free the kingdom from the wretched followers of Innos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //He brings death to all who doubt his splendor.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Sounds familiar.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //What's hidden behind that huge portal over there?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(laughs) My lord's chambers remain inaccessible to you. I shall give you no opportunity to open the gate.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //You used to be a follower of the Sleeper.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //That is the distant past. The master has opened our eyes. No one can stop us now.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //The master has shown us the only possible way to deal with you unbelievers.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Just how many more of your kind will I have to kill?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //We are many. You have no idea how numerous are those who await this time of freedom.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Cries of lamentation will flood across the land when we go out into the world.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //To free the world of the barbarians who call themselves the Guardians of the Fire. Our gathering here in the temple will not last long.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //Yes.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(threatening) Enough of this drivel! I shall destroy you.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Your sight will fade and your spirit will vanish into the darkness.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(to himself) Without that soul summoning amulet, I'd have a serious problem now.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



