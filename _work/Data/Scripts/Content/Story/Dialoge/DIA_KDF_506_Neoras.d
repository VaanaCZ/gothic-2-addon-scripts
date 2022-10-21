
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Hallo   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 2;
	condition   = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Neoras_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Neoras_Hallo_01_00"); //Was ... was ist los? Warum störst du mich? Siehst du nicht, dass ich gerade an einem äußerst komplexen Experiment arbeite?
	AI_Output (other,self ,"DIA_Neoras_Hallo_15_01"); //Ich wollte dich nicht stören.
	AI_Output (self ,other,"DIA_Neoras_Hallo_01_02"); //Das hast du bereits. (seufz) Also, was willst du?
};
///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Arbeit   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 5;
	condition   = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent   = FALSE;
	description	= "Hast du Arbeit für mich?";
};
FUNC INT DIA_Neoras_Arbeit_Condition()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Arbeit_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Arbeit_15_00"); //Hast du Arbeit für mich?
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_01"); //Ja, ich brauche Pflanzen für meine Experimente. Wir züchten zwar selbst Pflanzen, doch haben wir keine Feuernesseln mehr.
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_02"); //Sieben Blüten sollten reichen. Bring sie mir - ach, noch was: Ich vermisse ein Rezept zur Herstellung von magischen Tränken
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_03"); //Falls du es findest, wäre ich dir sehr dankbar.
	
	MIS_NeorasPflanzen = LOG_RUNNING;
	MIS_NeorasRezept = LOG_RUNNING;
	
	Log_CreateTopic (Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus (Topic_NeorasPflanzen,LOG_RUNNING);
	B_LogEntry (Topic_NeorasPflanzen,"Ich soll Meister Neoars dem Alchemisten sieben Feuernesseln bringen.");
	
	Log_CreateTopic (Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus (Topic_Neorasrezept,LOG_RUNNING);
	B_LogEntry (Topic_Neorasrezept,"Meister Neoras vermisst ein Rezept zur Herstellung von Manatränken.");

	if Npc_KnowsInfo (other, DIA_Opolos_beibringen)
	{
		B_LogEntry (Topic_Neorasrezept,"Das ist bestimmt das Rezept, das Opolos kurz mal sehen will.");
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Rezept abliefern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Rezept   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 6;
	condition   = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent   = TRUE;
	description	= "Wegen deines Rezepts...";
};
FUNC INT DIA_Neoras_Rezept_Condition()
{	
	if (MIS_NeorasRezept == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Rezept_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Rezept_15_00"); //Wegen deines Rezepts...
	
	if B_GiveInvItems (other, self, ItWr_ManaRezept,1)
	{
		AI_Output (other,self ,"DIA_Neoras_Rezept_15_01"); //Ich habe es gefunden.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_02"); //Gut. Ich hatte schon befürchtet, es wäre verschollen.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_03"); //Hier, nimm diesen magischen Trank als Zeichen meines Dankes.
		
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP (XP_NeorasRezept);
		B_GiveInvItems (self, other, ItPo_Mana_02,1);
	}
	else
	{
		AI_Output (other,self ,"DIA_Neoras_Rezept_15_04"); //Ich habe es noch nicht gefunden.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_05"); //Nun, dann hoffe ich, du findest es noch.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Flieder abliefern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Flieder   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 7;
	condition   = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent   = TRUE;
	description	= "Ich habe Feuernesseln für dich.";
};
FUNC INT DIA_Neoras_Flieder_Condition()
{	
	if (MIS_NeorasPflanzen == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Flieder_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Flieder_15_00"); //Ich habe Feuernesseln für dich.
	
	if B_GiveInvItems (other, self, ItPl_Mana_Herb_01,7)
	{
		AI_Output (self ,other,"DIA_Neoras_Flieder_01_01"); //Ausgezeichnet, damit kann ich arbeiten. Nimm diese 'Windfaust'-Spruchrolle für deine Hilfe.
		
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP (XP_NeorasPflanzen);
		B_GiveInvItems (self, other, ItSc_Windfist,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_Flieder_01_02"); //Ach ja? Du hast aber nicht genug dabei. Ich brauche SIEBEN Pflanzen.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_TEACH		(C_INFO)
{
	npc			 = 	KDF_506_Neoras;
	nr			 =  10;
	condition	 = 	DIA_Neoras_TEACH_Condition;
	information	 = 	DIA_Neoras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Kann ich bei dir lernen?";
};
func int DIA_Neoras_TEACH_Condition ()
{	
	return TRUE;
};
func void DIA_Neoras_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Neoras_TEACH_15_00"); //Kann ich bei dir lernen?
	
	if (other.guild == GIL_KDF)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_01"); //Ich werde dich in die Geheimnisse der Alchemie einweihen.
		
		Info_ClearChoices 	(DIA_Neoras_TEACH);
		Info_AddChoice 		(DIA_Neoras_TEACH,DIALOG_BACK,DIA_Neoras_TEACH_BACK);
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice 		(DIA_Neoras_TEACH,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Neoras_TEACH_Health_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Neoras_TEACH_Health_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Neoras_TEACH_Perm_Health);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Neoras_TEACH_Mana_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Neoras_TEACH_Mana_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Neoras_TEACH_Mana_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Neoras_TEACH_Perm_Mana);
		};
		
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_02"); //Ich unterweise keine Novizen. Wenn du eines Tages in den Kreis des Feuers aufgenommen wirst ...
		AI_Output (self, other, "DIA_Neoras_TEACH_01_03"); //... dann kann ich dir zeigen, wie du in der Lage bist, mächtige Tränke herzustellen.
	}
	else
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_04"); //Ich gebe mein Wissen nur an Angehörige unserer Kirche weiter.
	};
};
FUNC VOID DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices 	(DIA_Neoras_TEACH);
};
FUNC VOID DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
};
FUNC VOID DIA_Neoras_TEACH_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
};
FUNC VOID DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03);
};
FUNC VOID DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health);
};
FUNC VOID DIA_Neoras_TEACH_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
};
FUNC VOID DIA_Neoras_TEACH_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
};
FUNC VOID DIA_Neoras_TEACH_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
};
FUNC VOID DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
};

//#####################################################################
//##
//##	Kapitel 2
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap2_EXIT_Condition;
	information = DIA_Neoras_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap2_EXIT_Condition()
{
	if Kapitel == 2
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
}; 

//#####################################################################
//##
//##	Kapitel 3
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap3_EXIT_Condition;
	information = DIA_Neoras_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Trank brauen 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Neoras_BrewPotion   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 39;
	condition   = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent   = TRUE;
	description = "Kannst du mir einen Trank brauen?";
};
FUNC INT DIA_Neoras_BrewPotion_Condition()
{
	if (NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_BrewPotion_Info()
{
	AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_00"); //Kannst du mir einen Trank brauen?
	
	if (hero.guild == GIL_NOV)
	{
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_01"); //Für einen Novizen bist du ganz schön vorlaut. Verrichte deine Arbeit.
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_02"); //Alles, was du brauchst, kannst du bei Gorax kaufen.
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_03"); //Zweifelst du an meinen Fähigkeiten? Ich kann jeden Trank brauen.
		AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_04"); //Gut.
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_05"); //Nicht so schnell, du müsstest mir natürlich die Zutaten liefern und eine kleine Aufwandsentschädigung sowie das Material bezahlen.
		AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_06"); //Wie viel verlangst du?
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_07"); //Für das Brauen selbst bekomme ich 10 Goldstücke.
		
		NeorasBrewsForYou = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Was brauche ich für einen...
///////////////////////////////////////////////////////////////////////
/*
INSTANCE DIA_Neoras_Ingrediences   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 38;
	condition   = DIA_Neoras_Ingrediences_Condition;
	information = DIA_Neoras_Ingrediences_Info;
	permanent   = TRUE;
	description = "Welche Zutaten brauche ich für...";
};
FUNC INT DIA_Neoras_Ingrediences_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_Ingrediences_Info()
{
	Info_ClearChoices (DIA_Neoras_Ingrediences);
	Info_AddChoice (DIA_Neoras_Ingrediences,DIALOG_BACK,DIA_Neoras_Ingrediences_Back);
	Info_AddChoice (DIA_Neoras_Ingrediences,"einen Trank der Geschwindigkeit?",DIA_Neoras_Ingrediences_Speed);
	Info_AddChoice (DIA_Neoras_Ingrediences,"ein Mana Extrakt?",DIA_Neoras_Ingrediences_Mana);
	Info_AddChoice (DIA_Neoras_Ingrediences,"ein Extrakt der Heilung?",DIA_Neoras_Ingrediences_Health);
};

FUNC VOID DIA_Neoras_Ingrediences_Back ()
{
	Info_ClearChoices (DIA_Neoras_Ingrediences);
};

FUNC VOID DIA_Neoras_Ingrediences_Speed ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Speed_15_00"); //Welche Zutaten brauche ich für einen Trank der Geschwindigkeit?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Speed_01_01"); //Für einen Trank, der dich schneller macht, brauche ich fünfmal so genanntes Snapperkraut und einen Kronstöckel.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Speed_01_02"); //Und vergiss das Gold nicht.
};

FUNC VOID DIA_Neoras_Ingrediences_Mana ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Mana_15_00"); //Welche Zutaten brauche ich für ein Mana-Extrakt?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_01"); //Ein Manatrank ist nicht wirklich kompliziert.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_02"); //Du musst mir fünfmal Feuerkraut und einen Feldknöterich bringen.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_03"); //Und vergiss das Gold nicht.
};

FUNC VOID DIA_Neoras_Ingrediences_Health ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Health_15_00"); //Welche Zutaten brauche ich für ein Extrakt der Heilung?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_01"); //So ein Trank ist nicht besonders kompliziert.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_02"); //Du musst mir nur fünf Heilkräuter und einen Feldknöterich bringen.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_03"); //Und vergiss das Gold nicht.
};
*/
///////////////////////////////////////////////////////////////////////
//	Braue mir einen Trank //Ist Perm für KAp 3,4 und 5!!
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Neoras_BrewForMe   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 39;
	condition   = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent   = TRUE;
	description = "Braue mir...";
};
FUNC INT DIA_Neoras_BrewForMe_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"...einen Trank der Geschwindigkeit.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"...ein Mana Extrakt.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"...ein Extrakt der Heilung.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Back ()
{
	Info_ClearChoices (DIA_Neoras_BrewForMe);
};

FUNC VOID DIA_Neoras_BrewForMe_Speed ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Speed_15_00"); //Braue mir einen Trank der Geschwindigkeit.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_01"); //In Ordnung, hast du die Zutaten und das Gold?
	
	if (Npc_HasItems (other,ItPl_Speed_Herb_01) >= 1)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Speed_15_02"); //Ja, hier.
		
		B_GiveInvItems (other,self,ItPl_Speed_Herb_01,1);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_03"); //Gut, danke, ich geb' dir jetzt schon einen Trank, dann musst du nicht so lange warten.
	
		B_GiveInvItems (self,other,ItPo_Speed,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_04"); //Dir fehlen die nötigen Zutaten, komm wieder, wenn du sie beisammen hast.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir einen Trank der Geschwindigkeit.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir ein Mana Extrakt.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir ein Extrakt der Heilung.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Mana ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Mana_15_00"); //Braue mir ein Mana-Extrakt.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_01"); //In Ordnung, hast du die Zutaten und das Gold?
	
	if (Npc_HasItems (other,ItPl_Mana_Herb_02) >= 2)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Mana_15_02"); //Ja, hier.
		
		B_GiveInvItems (other,self,ItPl_Mana_Herb_02,2);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_03"); //Gut, ich werde dir jetzt gleich einen Trank geben, dann musst du nicht so lange warten.
	
		B_GiveInvItems (self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_04"); //Dir fehlen die nötigen Zutaten, komm wieder, wenn du sie beisammen hast.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir einen Trank der Geschwindigkeit.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir ein Mana Extrakt.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir ein Extrakt der Heilung.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Health ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Health_15_00"); //Braue mir ein Extrakt der Heilung.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_01"); //In Ordnung, hast du die Zutaten und das Gold?
	
	if (Npc_HasItems (other,ItPl_Health_Herb_02) >= 2)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Health_15_02"); //Ja, hier.
		
		B_GiveInvItems (other,self,ItPl_Health_Herb_02,2);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_03"); //Gut, ich gebe dir jetzt gleich einen Trank, dann musst du nicht so lange warten.
	
		B_GiveInvItems (self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_04"); //Dir fehlen die nötigen Zutaten. Komm wieder, wenn du sie beisammen hast.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir einen Trank der Geschwindigkeit.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir ein Mana Extrakt.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Braue mir ein Extrakt der Heilung.",DIA_Neoras_BrewForMe_Health);
};

//#####################################################################
//##
//##	Kapitel 4
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap4_EXIT_Condition;
	information = DIA_Neoras_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRACHENEIER		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	40;
	condition	 = 	DIA_Neoras_DRACHENEIER_Condition;
	information	 = 	DIA_Neoras_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Du siehst so verschwitzt aus.";
};

func int DIA_Neoras_DRACHENEIER_Condition ()
{
	if 	(Kapitel >= 4)
	&& 	((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	|| (hero.guild == GIL_KDF))
	&&  (MIS_Neoras_DragonEgg == 0)
		{
				return TRUE;
		};
};

func void DIA_Neoras_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_15_00"); //Du siehst so verschwitzt aus.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_01_01"); //Ich bin auch völlig fertig. Seit Tagen versuch ich schon, dieses verflixte Gebräu hinzukriegen. Es will einfach nicht gelingen.

	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "Nicht mein Problem.", DIA_Neoras_DRACHENEIER_no );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "Was für ein Trank soll das werden?", DIA_Neoras_DRACHENEIER_trank );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "Was ist das Problem?", DIA_Neoras_DRACHENEIER_ei );

};
func void DIA_Neoras_DRACHENEIER_ei ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_15_00"); //Was ist das Problem?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_01"); //In dem Rezept steht etwas von einem Drachenei. Ich habe natürlich keins von diesen Dingern.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_02"); //Also versuche ich, diese Zutat zu simulieren. Allerdings bisher mit wenig Erfolg.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_03"); //Sollte dir einmal so ein Ding in irgendeiner Grabhöhle über den Weg rollen, dann denk an mich.

	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "Was verwendest du denn statt dem Drachenei?", DIA_Neoras_DRACHENEIER_ei_statt );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "Ich werde sehen, was ich tun kann.", DIA_Neoras_DRACHENEIER_ei_jep );

};
func void DIA_Neoras_DRACHENEIER_ei_jep ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_00"); //Ich werde sehen, was ich tun kann.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_jep_01_01"); //Hey. Das war nur ein Witz. Ich glaube nicht, dass du tatsächlich ein Drachenei finden wirst.
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_02"); //Abwarten.
	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
	
	Log_CreateTopic (TOPIC_DRACHENEIERNeoras, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENEIERNeoras,"Neoras braucht ein Drachenei für seine Experimente. Er meint, ich würde vielleicht in irgendeiner Grabhöhle fündig werden."); 

	MIS_Neoras_DragonEgg = LOG_RUNNING;
};

func void DIA_Neoras_DRACHENEIER_ei_statt ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_statt_15_00"); //Was verwendest du denn statt dem Drachenei?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_statt_01_01"); //Glaub mir, das willst du nicht wissen.
};

func void DIA_Neoras_DRACHENEIER_trank ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_trank_15_00"); //Was für ein Trank soll das werden?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_trank_01_01"); //Ich habe das Rezept einem reisenden Händler abgekauft. Es stehen einige seltsame, aber interessante Dinge darin.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_trank_01_02"); //Ich bin mir nicht sicher, ob dieser Trank tatsächlich etwas bewirkt, aber allein mein Forscherdrang veranlasst mich, weiter zu machen.
};

func void DIA_Neoras_DRACHENEIER_no ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_no_15_00"); //Nicht mein Problem.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_no_01_01"); //Dann störe mich auch nicht weiter.
	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
};


///////////////////////////////////////////////////////////////////////
//	Info FoundDragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_FOUNDDRAGONEGG		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information	 = 	DIA_Neoras_FOUNDDRAGONEGG_Info;

	description	 = 	"Ich habe hier ein Drachenei für dich.";
};

func int DIA_Neoras_FOUNDDRAGONEGG_Condition ()
{
	if (Npc_HasItems (other,ItAt_DragonEgg_Mis))
	&& (MIS_Neoras_DragonEgg == LOG_RUNNING)
		{
				return TRUE;
		};
};
var int Neoras_DragonEggDrink_Day;
func void DIA_Neoras_FOUNDDRAGONEGG_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_00"); //Ich habe hier ein Drachenei für dich.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_01"); //Du willst mich auf den Arm nehmen.
	B_GiveInvItems 		(other, self, ItAt_DragonEgg_Mis,1);
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_02"); //Wahrhaftig. Das hätte ich nicht für möglich gehalten. Wo hast du es gefunden?
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_03"); //Das behalte ich lieber für mich.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_04"); //Großartig. Was willst du dafür haben?
	
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP (XP_Neoras_DragonEgg);

	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "Überrasch´ mich.", DIA_Neoras_FOUNDDRAGONEGG_irgendwas );
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "Wie wär´s mit ein paar Heiltränken.", DIA_Neoras_FOUNDDRAGONEGG_heil );
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "Gib mir etwas von dem Rezepttrank, wenn er fertig ist.", DIA_Neoras_FOUNDDRAGONEGG_trank );
};

var int Neoras_SCWantsDragonEggDrink;
func void DIA_Neoras_FOUNDDRAGONEGG_trank ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_trank_15_00"); //Gib mir etwas von dem Trank, wenn er fertig ist.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_01"); //Also gut. Aber wie gesagt, ich habe keine Ahnung, was dabei heraus kommen wird.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_02"); //Komm später wieder, wenn ich ihn vollendet habe.

	Neoras_DragonEggDrink_Day = Wld_GetDay(); 
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_heil_15_00"); //Wie wär's mit ein paar Heiltränken.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_heil_01_01"); //Eine gute Wahl. Hier, nimm. Mögen sie dir helfen.

	CreateInvItems 		(self, ItPo_Health_03, 3);									
	B_GiveInvItems 		(self, other, ItPo_Health_03, 3);					
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);

};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00"); //Überrasch mich.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01"); //Mmh. Gut. Dann nimm diesen magischen Ring. Er wird dir sicherlich helfen, deine Feinde zu bezwingen.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02"); //Er schützt dich vor Angriffen magischer Wesen.

	CreateInvItems 		(self, ItRi_Prot_Mage_02, 1);									
	B_GiveInvItems 		(self, other, ItRi_Prot_Mage_02, 1);
						
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRAGONEGGDRINK		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_DRAGONEGGDRINK_Condition;
	information	 = 	DIA_Neoras_DRAGONEGGDRINK_Info;

	description	 = 	"Ich komme, um den ominösen Dracheneitrank abzuholen.";
};

func int DIA_Neoras_DRAGONEGGDRINK_Condition ()
{
	if (Neoras_DragonEggDrink_Day <=(Wld_GetDay()-2))
	&& (Neoras_SCWantsDragonEggDrink == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_00"); //Ich komme, um den ominösen Dracheneitrank abzuholen.
	AI_Output			(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_01"); //Ja. Ich habe ihn gerade fertig gestellt. Hab ihn noch nicht ausprobiert und übernehme keine Verantwortung, hörst du?
	AI_Output			(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_02"); //Gib schon her.
	AI_Output			(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_03"); //Na gut. Hoffentlich fliegt dir nicht die Schädeldecke weg von dem Zeug.
	CreateInvItems 		(self, ItPo_DragonEggDrinkNeoras_MIS, 1);									
	B_GiveInvItems 		(self, other, ItPo_DragonEggDrinkNeoras_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info UsedDragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_USEDDRAGONEGGDRINK		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information	 = 	DIA_Neoras_USEDDRAGONEGGDRINK_Info;

	description	 = 	"Ich habe dein Dracheneigebräu ausprobiert.";
};

func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition ()
{
	if (Neoras_SCUsedDragonEggDrink == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_00"); //Ich habe dein Dracheneigebräu ausprobiert. Das Zeug ist gut.
	AI_Output			(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_01"); //Mmh. Sehr interessant. Ich muss unbedingt meine Forschungen daran fortsetzen.
	AI_Output			(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_02"); //Kannst du mir noch mehr davon machen?
	AI_Output			(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_03"); //Besser ist, wir beide versuchen das Ganze in ein paar Wochen noch mal. Sonst wachsen dir möglicherweise noch Hörner.
};

//#####################################################################
//##
//##	Kapitel 5
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap5_EXIT_Condition;
	information = DIA_Neoras_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Neoras_PICKPOCKET (C_INFO)
{
	npc			= KDF_506_Neoras;
	nr			= 900;
	condition	= DIA_Neoras_PICKPOCKET_Condition;
	information	= DIA_Neoras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Neoras_PICKPOCKET_Condition()
{
	C_Beklauen (72, 140);
};
 
FUNC VOID DIA_Neoras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Neoras_PICKPOCKET);
	Info_AddChoice		(DIA_Neoras_PICKPOCKET, DIALOG_BACK 		,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Neoras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Neoras_PICKPOCKET);
};
	
func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Neoras_PICKPOCKET);
};
























