//*********************************************************************
//	Info EXIT 
//********************************************************************
INSTANCE DIA_Cornelius_Exit   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 999;
	condition   = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent   = TRUE;
	description	= DIALOG_ENDE;
};

FUNC INT DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos (self);
};

//############################
//##						##			
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	SeeMurder 
//********************************************************************
INSTANCE DIA_Cornelius_SeeMurder   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent   = FALSE;
	description	= "Du hast doch den Mord an Lothar beobachtet?";
};

FUNC INT DIA_Cornelius_SeeMurder_Condition()
{
	if (RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_SeeMurder_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_SeeMurder_15_00"); //Du hast doch den Mord an Lothar beobachtet?
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_01"); //(nervös) Ich muss zu einer laufenden Untersuchung keine Auskunft geben.
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_02"); //Alles was ich weiß, habe ich schon bei Lord Hagen zu Protokoll gegeben.
};

//*********************************************************************
//	Was hast du gesehen? 
//********************************************************************
INSTANCE DIA_Cornelius_WhatYouSee   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 5;
	condition   = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent   = FALSE;
	description	= "Was hast du gesehen?";
};

FUNC INT DIA_Cornelius_WhatYouSee_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_SeeMurder)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_WhatYouSee_15_00"); //Was hast du gesehen?
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_01"); //(hektisch) Ich hab jetzt wirklich keine Zeit.
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_02"); //(hektisch) Du musst jetzt gehen, das Büro schließt jetzt.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius weigert sich mir mir zu reden."); 
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Jetzt reicht es! Was hast du gesehen?
//********************************************************************
INSTANCE DIA_Cornelius_Enough   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 6;
	condition   = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent   = FALSE;
	description	= "Jetzt reicht es! Was hast du gesehen?";
};

FUNC INT DIA_Cornelius_Enough_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_WhatYouSee)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Enough_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_00"); //Jetzt reicht es! Was hast du gesehen?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_01"); //(nervös) Ich, ich habe gesehen, wie der Söldner den Paladin von hinten niedergeschlagen hat.
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_02"); //(nervös) Und dann hat er ihm sein Schwert in die Brust gerammt.
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_03"); //Bist du dir da ganz sicher?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_04"); //(ängstlich) Ja, natürlich. Ich konnte es mit eigenen Augen sehen.
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_05"); //(ängstlich) Aber ich hab jetzt wirklich keine Zeit, es wartet noch ein großer Stapel mit Papieren auf mich.

	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Ich glaube dir nicht.
//********************************************************************
INSTANCE DIA_Cornelius_DontBelieveYou   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent   = TRUE;
	description	= "Ich glaube dir nicht.";
};

FUNC INT DIA_Cornelius_DontBelieveYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_Enough)
	&& Cornelius_TellTruth != TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_15_00"); //Ich glaube dir nicht.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_13_01"); //(gespielt selbstsicher) Und wenn schon, was willst du dagegen tun?

	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
	//hier fehlt noch Taschendiebstahl
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Was verlangst du?",DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Du willst doch weiterleben, oder?",DIA_Cornelius_DontBelieveYou_WantSurvive);
	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Im Kloster kann man dich zu reden bringen.",DIA_Cornelius_DontBelieveYou_Monastery);
	};
	if (hero.guild == GIL_SLD)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Ich könnte den Söldnern sagen wo du wohnst. ",DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};
	if (hero.guild == GIL_MIL)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Aus Meineid steht Knast, langer Knast!",DIA_Cornelius_DontBelieveYou_Perjury);
	};
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WhatYouWant ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00"); //Was verlangst du?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01"); //(arrogant) Du hast gar nicht genug Gold, um mich zu bezahlen.
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02"); //Wie viel?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03"); //2000 Goldstücke. Dann könnte ich mir die Sache noch mal überlegen.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Für 2000 Goldstücke, wäre Cornelius bereit mit mir zu reden.");
	
	Cornelius_PayForProof = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WantSurvive ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00"); //Du willst doch weiterleben, oder?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01"); //(ängstlich) Wenn du mich angreifst, wird man dich hängen.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02"); //Ich habe mächtige Freunde. Also wage es nicht, Hand an mich zu legen.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03"); //Jetzt raus hier! Oder ich rufe die Wachen!
	
	
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_00"); //Im Kloster kann man dich zum Reden bringen.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01"); //(kreidebleich) Was meinst du damit?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_02"); //Nun, wir haben Möglichkeiten, die Wahrheit zu erfahren. Schmerzhafte Möglichkeiten.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03"); //Nein, bitte nicht. Ich werde alles sagen, was du willst.
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00"); //Ich könnte den Söldnern sagen, wo du wohnst.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01"); //(kreidebleich) Was soll das heißen?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02"); //Sie wollen dich bestimmt gerne kennen lernen. Sie sind ziemlich sauer.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03"); //Das kannst du nicht machen, sie werden mich töten.
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04"); //Das ist sehr gut möglich.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05"); //Ich sag alles, was du willst, aber das darfst du nicht tun.
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Perjury_15_00"); //Auf Meineid steht Knast, langer Knast!
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01"); //Du willst mir drohen? Ein kleiner Gardist will mir drohen? Mir, dem Sekretär des Statthalters?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02"); //Wenn du nicht sofort verschwindest, werde ich dafür sorgen, dass du degradiert wirst.
	
	Cornelius_ThreatenByMilSC = TRUE;
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Hier ist das Geld
//********************************************************************
INSTANCE DIA_Cornelius_PayCornelius   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent   = TRUE;
	description	= "Hier ist das Gold.";
};

FUNC INT DIA_Cornelius_PayCornelius_Condition()
{
	if Cornelius_PayForProof == TRUE
	&& (Npc_HasItems (other,ItMi_Gold) >= 2000)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_PayCornelius_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_PayCornelius_15_00"); //Hier ist das Gold.
	
	B_GiveInvItems (other,self ,ItMi_Gold,2000);
	
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_01"); //Ich frag dich besser nicht, wo du das her hast.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_02"); //Um ehrlich zu sein, ist mir das auch egal.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_03"); //Aber wir sind im Geschäft.
	
	Cornelius_TellTruth = TRUE;
};


//*********************************************************************
//	Was ist wirklich passiert?
//********************************************************************
INSTANCE DIA_Cornelius_RealStory   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent   = TRUE;
	description	= "Was ist wirklich passiert?";
};

FUNC INT DIA_Cornelius_RealStory_Condition()
{
	if Cornelius_TellTruth == TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_RealStory_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_00"); //Was ist wirklich passiert?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_01"); //Ich hab nicht gesehen, was passiert ist. Ich habe Gold bekommen. Dafür, dass ich den Söldner belaste.
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_02"); //In diesen Zeiten muss jeder sehen, wo er bleibt. Ich brauchte das Geld.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_03"); //Wer hat dich bezahlt?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_04"); //Das reicht. Er wird mich töten, wenn ich ihn verrate.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_05"); //Bist du bereit, das auch Lord Hagen zu erzählen?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_06"); //Ich bin doch nicht verrückt, in der Stadt kann ich jetzt nicht mehr bleiben.
	
	if (Npc_HasItems (self,ItWr_CorneliusTagebuch_Mis) >=1)
	{
		AI_Output (self ,other,"DIA_Cornelius_RealStory_13_07"); //Ich werde dir mein Tagebuch geben, das sollte als Beweis genügen.
		B_GiveInvItems (self,other,ItWr_CorneliusTagebuch_Mis,1);
	};
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius hat gelogen, man hat ihn bezahlt um Bennet in den Kanst zu bringen. Er will mir allerdings nicht verraten, wer ihn Bezahlt hat, er schlottert vor Angst.");
	
	CorneliusFlee = TRUE;
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FLEE");
};


//*********************************************************************
//	Auf der Flucht
//********************************************************************
INSTANCE DIA_Cornelius_Fleeing (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 1;
	condition   = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Cornelius_Fleeing_Condition()
{
	if (CorneliusFlee == TRUE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Fleeing_Info()
{
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cornelius_PICKPOCKET (C_INFO)
{
	npc			= VLK_401_Cornelius;
	nr			= 900;
	condition	= DIA_Cornelius_PICKPOCKET_Condition;
	information	= DIA_Cornelius_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre gewagt sein Buch zu stehlen)";
};                       

FUNC INT DIA_Cornelius_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_CorneliusTagebuch_Mis) >= 1)
	&&  (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff))
	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cornelius_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_BACK 		,DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItWr_CorneliusTagebuch_Mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
};
