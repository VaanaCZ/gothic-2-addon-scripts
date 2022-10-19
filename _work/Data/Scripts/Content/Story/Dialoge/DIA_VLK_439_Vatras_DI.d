///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Vatras_DI_EXIT   (C_INFO)
{
	npc         = VLK_439_Vatras_DI;
	nr          = 999;
	condition   = DIA_Vatras_DI_EXIT_Condition;
	information = DIA_Vatras_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Vatras_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Vatras_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_HEAL		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_HEAL_Condition;
	information	 = 	DIA_Vatras_DI_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Heile mich.";
};

func int DIA_Vatras_DI_HEAL_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_DI_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_HEAL_15_00"); //Heile mich.
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_DI_HEAL_05_01"); //(andächtig) Adanos segne diesen Körper. Er wird es sein, der das Gleichgewicht der Welt wiederherstellen wird.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_DI_HEAL_05_02"); //Dein Körper ist zurzeit unversehrt.
	};	
};
 
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_TRADE		(C_INFO)
{
	npc		 = 	VLK_439_Vatras_DI;
	nr          = 12;
	condition	 = 	DIA_Vatras_DI_TRADE_Condition;
	information	 = 	DIA_Vatras_DI_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"Kannst du mir etwas verkaufen?";
};

func int DIA_Vatras_DI_TRADE_Condition ()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_DI_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_TRADE_15_00"); //Kannst du mir etwas verkaufen?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Vatras_DI_TRADE_05_01"); //Was brauchst du denn?
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_OBSESSION		(C_INFO)
{
	npc		 = 	VLK_439_Vatras_DI;
	nr		 = 	35;
	condition	 = 	DIA_Vatras_DI_OBSESSION_Condition;
	information	 = 	DIA_Vatras_DI_OBSESSION_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hilf mir. Ich bin besessen.";
};

func int DIA_Vatras_DI_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&&  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Vatras_DI_OBSESSION_Info_OneTime;
func void DIA_Vatras_DI_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_OBSESSION_15_00"); //Hilf mir. Ich bin besessen.

	if (Got_HealObsession_Day<=(Wld_GetDay()-2))  
		{
			if (DIA_Vatras_DI_OBSESSION_Info_OneTime <= 1)//2 mal
			{
				CreateInvItems 	(self, ItPo_HealObsession_MIS, 1 );
				DIA_Vatras_DI_OBSESSION_Info_OneTime = (DIA_Vatras_DI_OBSESSION_Info_OneTime + 1);
			};
		
			if (Npc_HasItems (self,ItPo_HealObsession_MIS))
			{
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_01"); //Nimm diesen Trank der Erlösung. Pyrokar hat mir auf mein Geheiß einige der heilenden Elixiere mitgegeben.
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_02"); //Doch denke immer daran: Meine Möglichkeiten, dir die Albträume zu nehmen, sind sehr begrenzt.
				B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 1);
				Got_HealObsession_Day = Wld_GetDay(); 
			}
			else
			{
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_03"); //Pyrokars Vorräte sind erschöpft. Es tut mir sehr Leid, mein Freund. Ich kann dir nicht mehr helfen.
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_04"); //Ich gehe das Risiko nicht ein, dir noch eine Phiole nach so kurzer Zeit zu geben. Komm später wieder, mein Freund.
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RAT
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_RAT		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_RAT_Condition;
	information	 = 	DIA_Vatras_DI_RAT_Info;

	description	 = 	"Welchen Rat kannst du mir geben?";
};

func int DIA_Vatras_DI_RAT_Condition ()
{	
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (SC_IsObsessed == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Vatras_DI_RAT_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_RAT_15_00"); //Welchen Rat kannst du mir geben?
	AI_Output			(self, other, "DIA_Vatras_DI_RAT_05_01"); //Halte dich von den Suchenden fern. Denke daran, dass dir ihr schwarzer Blick hier fernab vom Kloster sehr stark schaden kann.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
		AI_Output			(other, self, "DIA_Vatras_DI_RAT_15_02"); //Keine Sorge, ich habe das Seelenruf-Amulett.
	};

	AI_Output			(self, other, "DIA_Vatras_DI_RAT_05_03"); //Sollte dir trotzdem etwas geschehen, komm zur mir. Ich werde sehen, was ich tun kann.
};

///////////////////////////////////////////////////////////////////////
//	Info PEDROTOT
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_PEDROTOT		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	3;	
	condition	 = 	DIA_Vatras_DI_PEDROTOT_Condition;
	information	 = 	DIA_Vatras_DI_PEDROTOT_Info;

	description	 = 	"Ich habe den Verräter Pedro gefunden.";
};

func int DIA_Vatras_DI_PEDROTOT_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
		{
				return TRUE;
		};
};

var int DIA_Vatras_DI_PEDROTOT_VatrasSucked;
func void DIA_Vatras_DI_PEDROTOT_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_00"); //Ich habe den Verräter Pedro gefunden.
	B_GivePlayerXP (XP_Ambient);
	
	if (MIS_Gorax_KillPedro == LOG_SUCCESS)
	&& (Npc_IsDead(Pedro_DI)) 
	{
		AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_01"); //Er ist tot.
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_02"); //Ich bin maßlos enttäuscht. Das hätte ich nicht von dir gedacht.
		AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_03"); //Was meinst du?
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_04"); //Ich kenne dein widerliches Abkommen mit Serpentes. Ich bin zutiefst erschüttert, dass ich zu guter letzt doch Unrecht haben musste.
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE;
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_05"); //Dann bringe ihn hierher aufs Schiff. Wir werden ihn der Gerichtsbarkeit von Khorinis überantworten.

		if (Npc_IsDead(Pedro_DI)) 
		{
			AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_06"); //Dafür dürfte es zu spät sein. Er ist tot.
			AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_07"); //(überrascht) Oh. Das ist sehr bedauerlich. Ich werde für seine arme Seele beten.
		}
		else
		{
			AI_StopProcessInfos (self);
		};
	};
};



///////////////////////////////////////////////////////////////////////
//	Info VatrasSucked
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_VatrasSucked		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	1;	
	condition	 = 	DIA_Vatras_DI_VatrasSucked_Condition;
	information	 = 	DIA_Vatras_DI_VatrasSucked_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Vatras_DI_VatrasSucked_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_DI_VatrasSucked_Info ()
{
	AI_Output			(self, other, "DIA_Vatras_DI_VatrasSucked_05_00"); //Geh mir aus den Augen, du Mörder. Von mir hast du keinerlei Hilfe mehr zu erwarten.
	AI_StopProcessInfos (self);
};


//***************************************************************************
//	Talente
//***************************************************************************
INSTANCE DIA_Vatras_DI_Talente (C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	condition		= DIA_Vatras_DI_Talente_Condition;
	information		= DIA_Vatras_DI_Talente_Info;
	permanent		= TRUE;

	description		= "Lehre mich deine Fähigkeiten."; 
};

FUNC INT DIA_Vatras_DI_Talente_Condition()
{		
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
FUNC VOID DIA_Vatras_DI_Talente_Info ()
{	
	AI_Output			(other, self, "DIA_Vatras_DI_Talente_15_00"); //Lehre mich deine Fähigkeiten.
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_05_01"); //Ich werde tun, was in meiner Macht steht.
	
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	Info_AddChoice	  (DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);

	if (hero.guild == GIL_KDF) 
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, "Magische Kreise", DIA_Vatras_DI_Talente_CIRCLES);
	};
	Info_AddChoice	  (DIA_Vatras_DI_Talente, "Alchemie - Die Kunst der Tränke", DIA_Vatras_DI_Talente_ALCHIMIE);
};

//**********************************************************
// Addchoices Talente: Magische Kreise
//------------------------------------
//**********************************************************
FUNC VOID DIA_Vatras_DI_Talente_CIRCLES()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	Info_AddChoice	    (DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 1) 
	{ 
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("1. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 1))			,DIA_Vatras_DI_Talente_Circle_1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("2. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 2))			,DIA_Vatras_DI_Talente_Circle_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("3. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 3))			,DIA_Vatras_DI_Talente_Circle_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("4. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 4))			,DIA_Vatras_DI_Talente_Circle_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 4)	
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("5. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 5))			,DIA_Vatras_DI_Talente_Circle_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("6. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 6))			,DIA_Vatras_DI_Talente_Circle_6);
	};
};

//**********************************************************
// Addchoices Talente: Alchimie
//-----------------------------
//**********************************************************
FUNC VOID DIA_Vatras_DI_Talente_ALCHIMIE ()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	Info_AddChoice	    (DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Vatras_DI_Talente_POTION_Health_01);	  
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Vatras_DI_Talente_POTION_Health_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Vatras_DI_Talente_POTION_Health_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Vatras_DI_Talente_POTION_Mana_01);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Vatras_DI_Talente_POTION_Mana_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Vatras_DI_Talente_POTION_Mana_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Trank der Geschwindigkeit"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)), DIA_Vatras_DI_Talente_POTION_Speed);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Elixier der Stärke"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Elixier der Geschicklichkeit"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Elixier des Geistes"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Elixier des Lebens", 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Vatras_DI_Talente_POTION_Perm_Health);
	};
};
//***************************************************************************
// Talente Magische Kreise
//***************************************************************************
FUNC VOID DIA_Vatras_DI_Talente_Circle_1()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 1);

};
FUNC VOID DIA_Vatras_DI_Talente_Circle_2()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 2);

};
FUNC VOID DIA_Vatras_DI_Talente_Circle_3()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 3);
};
FUNC VOID DIA_Vatras_DI_Talente_Circle_4()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 4);
};
FUNC VOID DIA_Vatras_DI_Talente_Circle_5()
{
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_5_05_00"); //Du bist nun Magier des 5. Kreises. Setze deine erlernten Zaubersprüche immer mit Bedacht ein.
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 5);
};
FUNC VOID DIA_Vatras_DI_Talente_Circle_6()
{
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_00"); //Du hast nun Zugang zum obersten Wissen der Magie.
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_01"); //Lass dich nur von der Vernunft leiten und beherrsche deine menschlichen Schwächen. Sie können deinen Blick trüben.
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 6);
};

//***************************************************************************
// Talente Alchemy
//***************************************************************************

FUNC VOID DIA_Vatras_DI_Talente_POTION_Health_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Health_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Health_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Mana_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Mana_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Mana_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Speed ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);	
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_STR ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_DEX ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_Mana ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_Health ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health);
};

// ------ Back ------
func void DIA_Vatras_DI_Talente_BACK ()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
};

///////////////////////////////////////////////////////////////////////
//	Info DementorObsessionBook
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_DementorObsessionBook		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_DementorObsessionBook_Condition;
	information	 = 	DIA_Vatras_DI_DementorObsessionBook_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich habe hier einen Almanach der Besessenen.";
};

func int DIA_Vatras_DI_DementorObsessionBook_Condition ()
{	
	if  (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))
		{
				return TRUE;
		};
};

var int DIA_Vatras_DI_DementorObsessionBook_OneTime;
func void DIA_Vatras_DI_DementorObsessionBook_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_DementorObsessionBook_15_00"); //Ich habe hier einen Almanach der Besessenen.
	if (DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_01"); //Hm. Ich denke, es ist das Beste, wenn ich es ins Kloster zu Pyrokar bringe, wenn wir hier wieder weg kommen.
		
		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_02"); //Du hast noch mehr davon? Bringe mir ruhig alle, die du finden kannst.
	};
	B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
	B_GivePlayerXP (XP_Ambient);
};
	
///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Vatras_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich habe es geschafft.";
};

func int DIA_Vatras_DI_UndeadDragonDead_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon))
		{
				return TRUE;
		};
};

var int DIA_Vatras_DI_UndeadDragonDead_OneTime;
func void DIA_Vatras_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_UndeadDragonDead_15_00"); //Ich habe es geschafft.

	if (DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_01"); //Ich weiß, ich spüre es.
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_02"); //Du hast Beliar einen Schlag versetzt, der ihn noch einige Zeit beschäftigen wird.
	
		if (hero.guild == GIL_DJG)
		{
			AI_Output (other, self, "DIA_Vatras_DI_UndeadDragonDead_15_03"); //Kann ich mich jetzt zur Ruhe setzen oder habt ihr Magier noch eine Leiche im Keller, die von dieser Welt vertrieben werden muss?
		}
		else
		{
			AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_04"); //Doch bedenke, dass dies nur eine Episode des ewigen Kampfes zwischen Gut und Böse war.
		};
		
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_05"); //Das Böse findet immer einen Weg, auf diese Welt zu kommen. Der Krieg wird niemals enden.
		
		if (hero.guild == GIL_PAL)
		{
			AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_06"); //Als Kämpfer für das Gute solltest du das eigentlich wissen.
		};
			
		AI_Output (self, other, "DIA_Vatras_Add_05_15"); //Nur Adanos allein steht zwischen den streitenden Göttern, um das Gleichgewicht zu erhalten!
		AI_Output (other, self, "DIA_Vatras_Add_15_16"); //Er hätte mir mal lieber helfen sollen.
		AI_Output (self, other, "DIA_Vatras_Add_05_17"); //Das hat er - dessen kannst du dir sicher sein...
					
		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};	

	AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_09"); //Sag´ nun dem Kapitän, dass er so schnell wie möglich ablegen soll. Die momentane Ruhe kann trügen.
};
 
///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER_DI
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER_DI		(C_INFO)
{
	npc		 = 	VLK_439_Vatras_DI;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition;
	information	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition ()
{
	if 	(
		(VatrasPissedOffForever == TRUE)
		|| (
			(MadKillerCount >= 7) 						//SC hat mehr als 6 unschuldige auf dem Gewissen.
			&& (VatrasMadKillerCount != MadKillerCount)	//die letzte Chance von Vatras nicht genutzt
			)
	 	)
		&& (Npc_IsInState (self,ZS_Talk))
			{
				return TRUE;
			};	
};
var int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime;
func void DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info ()
{
	if (DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime == FALSE)
	{
		B_LastWarningVatras ();
		DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime = TRUE;
	};
	B_VatrasPissedOff ();
	AI_StopProcessInfos (self);
};
