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
	description	 = 	"Ulecz moje rany.";
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
	AI_Output			(other, self, "DIA_Vatras_DI_HEAL_15_00"); //Ulecz moje rany.
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_DI_HEAL_05_01"); //Adanosie, pobłogosław to ciało i uwolnij je od ran, by mogło przywrócić równowagę temu światu!
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_DI_HEAL_05_02"); //Nie jesteś ranny.
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

	description	 = 	"Masz coś na sprzedaż?";
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
	AI_Output			(other, self, "DIA_Vatras_DI_TRADE_15_00"); //Masz coś na sprzedaż?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Vatras_DI_TRADE_05_01"); //A czego potrzebujesz?
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

	description	 = 	"Pomóż mi! Jestem opętany!";
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
	AI_Output			(other, self, "DIA_Vatras_DI_OBSESSION_15_00"); //Pomóż mi! Jestem opętany!

	if (Got_HealObsession_Day<=(Wld_GetDay()-2))  
		{
			if (DIA_Vatras_DI_OBSESSION_Info_OneTime <= 1)//2 mal
			{
				CreateInvItems 	(self, ItPo_HealObsession_MIS, 1 );
				DIA_Vatras_DI_OBSESSION_Info_OneTime = (DIA_Vatras_DI_OBSESSION_Info_OneTime + 1);
			};
		
			if (Npc_HasItems (self,ItPo_HealObsession_MIS))
			{
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_01"); //Weź tę Miksturę Wyzwolenia. Pyrokar dał mi kilka swoich magicznych eliksirów.
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_02"); //Pamiętaj jednak, że mogę ci pomóc tylko ograniczoną liczbę razy.
				B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 1);
				Got_HealObsession_Day = Wld_GetDay(); 
			}
			else
			{
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_03"); //Zapasy Pyrokara już się wyczerpały. Przykro mi, przyjacielu. Nie mogę ci już pomóc.
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_04"); //Nie mogę ci podać kolejnej dawki po tak krótkim czasie od zażycia poprzedniej. Wróć do mnie później, przyjacielu.
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

	description	 = 	"Masz dla mnie jakieś rady?";
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
	AI_Output			(other, self, "DIA_Vatras_DI_RAT_15_00"); //Masz dla mnie jakieś rady?
	AI_Output			(self, other, "DIA_Vatras_DI_RAT_05_01"); //Trzymaj się z dala od Poszukiwaczy. Pamiętaj, że ich spojrzenie może się okazać zabójcze tak daleko od klasztoru.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
		AI_Output			(other, self, "DIA_Vatras_DI_RAT_15_02"); //Nie obawiaj się, mam amulet przywoływania dusz.
	};

	AI_Output			(self, other, "DIA_Vatras_DI_RAT_05_03"); //Gdyby mimo to coś ci się stało, wróć do mnie. Spróbuję ci jakoś pomóc.
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

	description	 = 	"Znalazłem tego zdrajcę, Pedra.";
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
	AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_00"); //Znalazłem tego zdrajcę, Pedra.
	B_GivePlayerXP (XP_Ambient);
	
	if (MIS_Gorax_KillPedro == LOG_SUCCESS)
	&& (Npc_IsDead(Pedro_DI)) 
	{
		AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_01"); //Już nie żyje.
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_02"); //Rozczarowałeś mnie. Myślałem, że jesteś inny.
		AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_03"); //Jak to?
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_04"); //Wiem o twej niecnej umowie z Serpentesem. Nie zdajesz sobie nawet sprawy, jak straszliwie się na tobie zawiodłem.
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE;
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_05"); //Zatem przyprowadź go tutaj, na statek. Oddamy go w ręce odpowiednich władz w Khorinis.

		if (Npc_IsDead(Pedro_DI)) 
		{
			AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_06"); //Na to już trochę za późno. Nie żyje.
			AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_07"); //Och, wielka szkoda. Będę się modlił za jego biedną duszę.
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
	AI_Output			(self, other, "DIA_Vatras_DI_VatrasSucked_05_00"); //Zejdź mi z oczu, morderco. Na moją pomoc nie masz co liczyć.
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

	description		= "Naucz mnie tego, co potrafisz."; 
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
	AI_Output			(other, self, "DIA_Vatras_DI_Talente_15_00"); //Naucz mnie czegoś.
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_05_01"); //Zrobię, co w mojej mocy.
	
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	Info_AddChoice	  (DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);

	if (hero.guild == GIL_KDF) 
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, "Kręgi magii", DIA_Vatras_DI_Talente_CIRCLES);
	};
	Info_AddChoice	  (DIA_Vatras_DI_Talente, "Alchemia - sztuka warzenia mikstur", DIA_Vatras_DI_Talente_ALCHIMIE);
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
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("Pierwszy krąg magii"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 1))			,DIA_Vatras_DI_Talente_Circle_1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("Drugi krąg magii"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 2))			,DIA_Vatras_DI_Talente_Circle_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("Trzeci krąg magii"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 3))			,DIA_Vatras_DI_Talente_Circle_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("Czwarty krąg magii"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 4))			,DIA_Vatras_DI_Talente_Circle_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 4)	
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("Piąty krąg magii"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 5))			,DIA_Vatras_DI_Talente_Circle_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("Szósty krąg magii"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 6))			,DIA_Vatras_DI_Talente_Circle_6);
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
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Esencja lecznicza", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Vatras_DI_Talente_POTION_Health_01);	  
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Ekstrakt leczniczy", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Vatras_DI_Talente_POTION_Health_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Eliksir leczniczy", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Vatras_DI_Talente_POTION_Health_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Esencja many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Vatras_DI_Talente_POTION_Mana_01);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Ekstrakt many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Vatras_DI_Talente_POTION_Mana_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Eliksir many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Vatras_DI_Talente_POTION_Mana_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Mikstura szybkości"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)), DIA_Vatras_DI_Talente_POTION_Speed);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Eliksir siły"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Eliksir zręczności"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Eliksir ducha"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("Eliksir życia", 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Vatras_DI_Talente_POTION_Perm_Health);
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
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_5_05_00"); //Jesteś teraz magiem piątego kręgu. Wykorzystuj swoje umiejętności z należną rozwagą.
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 5);
};
FUNC VOID DIA_Vatras_DI_Talente_Circle_6()
{
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_00"); //Zyskałeś dostęp do najwyższych tajników magii.
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_01"); //Zachowaj rozsądek i zwalczaj swoje ludzkie słabości, by nie przyćmiły ci prawdy.
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

	description	 = 	"Mam tutaj Almanach Opętanych.";
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
	AI_Output			(other, self, "DIA_Vatras_DI_DementorObsessionBook_15_00"); //Mam tutaj almanach opętanych.
	if (DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_01"); //Hmmm... Jeśli się stąd wydostaniemy, zabiorę go do klasztoru, do Pyrokara.
		
		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_02"); //Znalazłeś ich więcej? Przynieś mi wszystkie, które zdołasz znaleźć!
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
	description	 = 	"Zwyciężyłem!";
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
	AI_Output			(other, self, "DIA_Vatras_DI_UndeadDragonDead_15_00"); //Zwyciężyłem!

	if (DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_01"); //Wiem, czuję to!
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_02"); //Zadałeś Beliarowi straszliwy cios, po którym szybko się nie otrząśnie.
	
		if (hero.guild == GIL_DJG)
		{
			AI_Output (other, self, "DIA_Vatras_DI_UndeadDragonDead_15_03"); //Mogę wreszcie odpocząć, czy też wy, magowie, macie dla mnie kolejnego trupa w szafie, którego należy wypędzić z tego świata?
		}
		else
		{
			AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_04"); //Nie zapominaj, że był to zaledwie epizod w odwiecznej walce Dobra ze Złem.
		};
		
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_05"); //Zło zawsze znajdzie jakiś sposób, by wkroczyć do tego świata. Ta wojna nigdy się nie skończy.
		
		if (hero.guild == GIL_PAL)
		{
			AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_06"); //Jako orędownik Dobra powinieneś o tym wiedzieć.
		};
			
		AI_Output (self, other, "DIA_Vatras_Add_05_15"); //Tylko Adanos stoi między zwaśnionymi bogami, by zapewnić równowagę sił.
		AI_Output (other, self, "DIA_Vatras_Add_15_16"); //Zamiast tego mógł mi nieco pomóc.
		AI_Output (self, other, "DIA_Vatras_Add_05_17"); //Ależ tak właśnie zrobił. Możesz być tego pewien.
					
		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};	

	AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_09"); //Powiedz kapitanowi, by podnosił kotwicę. Ta cisza i spokój mogą być tylko złudne.
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
