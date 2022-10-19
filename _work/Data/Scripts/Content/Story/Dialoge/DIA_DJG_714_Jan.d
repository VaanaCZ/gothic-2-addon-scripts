// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jan_EXIT(C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 999;
	condition	= DIA_Jan_EXIT_Condition;
	information	= DIA_Jan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jan_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//***********
//	Begrüßung
//***********

INSTANCE DIA_JAN_Hello (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Hello_Condition;
	information	= DIA_Jan_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Jan_Hello_Condition()
{
	if (Kapitel >= 4)
	&& (Npc_IsInState (self,ZS_TALK))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Hello_Info()
{		
		AI_Output (self ,other,"DIA_Jan_Hello_10_00"); //Przyjœcie tutaj by³o bardzo g³upim pomys³em.
		AI_Output (self ,other,"DIA_Jan_Hello_10_01"); //Myœla³em, ¿e coœ tu zdobêdê. Ale w okolicy nie ma nic prócz paru aroganckich paladynów oraz orków.
};

//*******************************************
//	Du hast die Drachen vergessen!
//*******************************************

INSTANCE DIA_JAN_Dragons (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Dragons_Condition;
	information	= DIA_Jan_Dragons_Info;
	permanent	= FALSE;
	description	= "Zapomnia³eœ o smokach!";
};                       

FUNC INT DIA_Jan_Dragons_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (MIS_JanBecomesSmith == FALSE)
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Dragons_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Dragons_15_00"); //Zapomnia³eœ o smokach!
		AI_Output (self ,other,"DIA_Jan_Dragons_10_01"); //Jak móg³bym zapomnieæ. Powiem ci coœ. Jestem kowalem, nie wojownikiem.
		AI_Output (self ,other,"DIA_Jan_Dragons_10_02"); //Wyrabiam broñ. Walkê zostawiam innym.
		AI_Output (other,self ,"DIA_Jan_Dragons_15_03"); //Wobec tego dlaczego nie stoisz za kowad³em?
		AI_Output (self ,other,"DIA_Jan_Dragons_10_04"); //Paladyni nie wpuszcz¹ mnie do kuŸni. Nie mogê nic zrobiæ, chyba ¿e chcê skoñczyæ w lochu.

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_Dragons_10_05"); //Te¿ jesteœ jednym z nich. Wiêc mo¿e wstawisz siê za mn¹?
		};

		Info_ClearChoices (DIA_JAN_Dragons);
		Info_AddChoice (DIA_JAN_Dragons,"Muszê ruszaæ w drogê.",DIA_JAN_Dragons_ShitHappen);
		Info_AddChoice (DIA_JAN_Dragons,"Co bêdê z tego mia³?",DIA_JAN_Dragons_Reward);
		Info_AddChoice (DIA_JAN_Dragons,"Spróbujê ci pomóc.",DIA_JAN_Dragons_HelpYou);
};

FUNC VOID DIA_JAN_Dragons_HelpYou ()
{	
	AI_Output (other,self ,"DIA_JAN_Dragons_HelpYou_15_00"); //Spróbujê ci pomóc.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_01"); //Jak tego dokonasz? Parcival rozkaza³ nas pilnowaæ.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_02"); //Nikt nie odwa¿y siê tego zlekcewa¿yæ.
	AI_Output (other,self ,"DIA_JAN_Dragons_HelpYou_15_03"); //Zrobiê, co w mojej mocy.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_04"); //Nie s¹dzê, ¿eby zechcia³ ciê wys³uchaæ.
	
	Log_CreateTopic (TOPIC_JanBecomesSmith, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith, LOG_RUNNING);
	B_LogEntry (TOPIC_JanBecomesSmith,"Jan, ³owca smoków z zamku w Górniczej Dolinie, chce pracowaæ w kuŸni, jednak Parcival mu tego zabrania."); 


	MIS_JanBecomesSmith = LOG_RUNNING;
	Info_ClearChoices (DIA_JAN_Dragons);
};

FUNC VOID DIA_JAN_Dragons_Reward ()
{
	AI_Output (other,self ,"DIA_JAN_Dragons_Reward_15_00"); //Co bêdê mia³ z tego, ¿e ci pomogê?
	AI_Output (self ,other,"DIA_JAN_Dragons_Reward_10_01"); //Nic nie mam. Co najwy¿ej bêdê móg³ ciê czegoœ nauczyæ.
	if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_JAN_Dragons_Reward_10_02"); //Znam metodê, dziêki której ostrza z magicznej rudy s¹ jeszcze mocniejsze.
	};
	Jan_TeachPlayer = TRUE;
};

FUNC VOID DIA_JAN_Dragons_ShitHappen ()
{
	AI_Output (other,self ,"DIA_JAN_Dragons_ShitHappen_15_00"); //Muszê ruszaæ w drogê.
	AI_Output (self ,other,"DIA_JAN_Dragons_ShitHappen_10_01"); //Wspaniale. Nie mogê opuœciæ teraz zamku ani nic wykuæ.

	Info_ClearChoices (DIA_JAN_Dragons);
};
//*******************************************
//	Wo kommst du her?
//*******************************************

INSTANCE DIA_JAN_Home (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Home_Condition;
	information	= DIA_Jan_Home_Info;
	permanent	= FALSE;
	description	= "Sk¹d pochodzisz?";
};                       

FUNC INT DIA_Jan_Home_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (Kapitel >= 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Home_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Home_15_00"); //Sk¹d pochodzisz?
		AI_Output (self ,other,"DIA_Jan_Home_10_01"); //Do³¹czy³em do paru ludzi z gór. Ruszyliœmy do Doliny, aby zbiæ fortunê, poluj¹c na smoki.
		AI_Output (self ,other,"DIA_Jan_Home_10_02"); //Ich przywódca zwa³ siê Sylvio. Ch³opie, co to by³ mu³! Traktowa³ mnie, jakbym by³ jego w³asnoœci¹.
};

//*******************************************
//	Was ist in der Burg alles passiert?
//*******************************************

INSTANCE DIA_JAN_OldCamp (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_OldCamp_Condition;
	information	= DIA_Jan_OldCamp_Info;
	permanent	= TRUE;
	description	= "Co siê wydarzy³o w zamku?";
};                       

FUNC INT DIA_Jan_OldCamp_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_OldCamp_Info()
{		
		AI_Output (other,self ,"DIA_Jan_OldCamp_15_00"); //Co w ogóle sta³o siê w zamku?
		AI_Output (self ,other,"DIA_Jan_OldCamp_10_01"); //Nic, o czym bym s³ysza³. Oczywiœcie martwi mnie to, co sta³o siê POZA zamkiem.
};
//*******************************************
//	Ich hab mit Parcival geredet
//*******************************************

INSTANCE DIA_JAN_Parcival (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Parcival_Condition;
	information	= DIA_Jan_Parcival_Info;
	permanent	= FALSE;
	description	= "Rozmawia³em z Parcivalem.";
};                       

FUNC INT DIA_Jan_Parcival_Condition()
{
	if (MIS_JanBecomesSmith != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other,DIA_Parcival_Jan))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Parcival_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Parcival_15_00"); //Rozmawia³em z Parcivalem.
		AI_Output (self ,other,"DIA_Jan_Parcival_10_01"); //No i?

		if (hero.guild == GIL_DJG)
		{
			AI_Output (other,self ,"DIA_Jan_Parcival_15_02"); //Nie ufa nam, ³owcom smoków.
		}
		else
		{
			AI_Output (other,self ,"DIA_Jan_Parcival_15_03"); //Nie ufa wam, ³owcom smoków.
		};
		AI_Output (self ,other,"DIA_Jan_Parcival_10_04"); //Szlag by to trafi³. Ja chcê jedynie pracowaæ.
		AI_Output (self ,other,"DIA_Jan_Parcival_10_05"); //No to pozostaje mi siê poddaæ. Jedynie Garond móg³by mi teraz pomóc.
};


//*******************************************
//	Ich hab mit Garond geredet
//*******************************************

INSTANCE DIA_JAN_JanIsSmith (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_JanIsSmith_Condition;
	information	= DIA_Jan_JanIsSmith_Info;
	permanent	= FALSE;
	description	= "IdŸ po swój m³ot, jest dla ciebie robota.";
};                       

FUNC INT DIA_Jan_JanIsSmith_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_JanIsSmith_Info()
{		
		AI_Output (other,self ,"DIA_Jan_JanIsSmith_15_00"); //IdŸ po swój m³ot, jest dla ciebie robota.
		AI_Output (self ,other,"DIA_Jan_JanIsSmith_10_01"); //Uda³o ci siê? Jak to zrobi³eœ?
		AI_Output (other,self ,"DIA_Jan_JanIsSmith_15_02"); //Musia³em za ciebie porêczyæ, wiêc lepiej mnie nie zawiedŸ.
		AI_Output (self ,other,"DIA_Jan_JanIsSmith_10_03"); //Nie martw siê. Na pewno ciê nie zawiodê.

		AI_StopProcessInfos (self);
	
		Npc_ExchangeRoutine (self,"SMITH");
};

//*******************************************
//	Verkaufst du Waffen?
//*******************************************

INSTANCE DIA_JAN_SellWeapons (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_SellWeapons_Condition;
	information	= DIA_Jan_SellWeapons_Info;
	permanent	= FALSE;
	description	= "Sprzedajesz jak¹œ broñ?";
};                       

FUNC INT DIA_Jan_SellWeapons_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (Jan_TeachPlayer == FALSE)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_SellWeapons_Info()
{		
		AI_Output (other,self ,"DIA_Jan_SellWeapons_15_00"); //Sprzedajesz jak¹œ broñ?

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_SellWeapons_10_01"); //Oczywiœcie, ¿e nie. Wtedy twoi koledzy wrzuciliby mnie do wiêzienia za nielegalny handel, co? Nie, zapomnij o tym.
		}
		else
		{
			AI_Output (self ,other,"DIA_Jan_SellWeapons_10_02"); //Robi³bym to, gdybym móg³. Ale najpierw muszê dostarczyæ broñ paladynom w zamku.
		};

		AI_Output (self ,other,"DIA_Jan_SellWeapons_10_03"); //Ale mogê ci pokazaæ, jak samemu wykuæ broñ.
		
		Jan_TeachPlayer = TRUE;
};

//*******************************************
//	Zeig mir wie man schmiedet.
//*******************************************

INSTANCE Jan_Training_Talente (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= Jan_Training_Talente_Condition;
	information	= Jan_Training_Talente_Info;
	permanent	= TRUE;
	description	= "Naucz mnie kowalstwa.";
};                       

FUNC INT Jan_Training_Talente_Condition()
{
	if (Jan_TeachPlayer == TRUE)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID Jan_Training_Talente_Info()
{		
	AI_Output (other,self ,"DIA_Jan_TeachPlayer_15_00"); //Naucz mnie kowalstwa.
	AI_Output (self,other ,"DIA_Jan_TeachPlayer_10_01"); //Co konkretnie planujesz zrobiæ?
	
	Info_ClearChoices (Jan_Training_Talente);
	
	Info_AddChoice		(Jan_Training_Talente, Dialog_Back,Jan_Training_Smith_Back);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString("Nauka kowalstwa"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,Jan_Training_Smith_Common);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{	
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,Jan_Training_Smith_1hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,Jan_Training_Smith_2hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,Jan_Training_Smith_1hSpecial2);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,Jan_Training_Smith_2hSpecial2);
		};
	};
};

FUNC VOID Jan_Training_Smith_Back()
{
	Info_ClearChoices (Jan_Training_Talente);
};

FUNC VOID Jan_Training_Smith_Common ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_Common);
};

FUNC VOID Jan_Training_Smith_1hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};

FUNC VOID Jan_Training_Smith_2hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);	
};

FUNC VOID Jan_Training_Smith_1hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};

FUNC VOID Jan_Training_Smith_2hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};

//*******************************************
//	Kann ich bei dir Rüstungen kaufen?
//*******************************************

//-------------------------------------
 var int DIA_JAN_SellArmor_permanent;
//------------------------------------

INSTANCE DIA_JAN_SellArmor (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_SellArmor_Condition;
	information	= DIA_Jan_SellArmor_Info;
	permanent	= TRUE;
	description	= "Mogê kupiæ od ciebie jak¹œ zbrojê?";
};                       

FUNC INT DIA_Jan_SellArmor_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_SellArmor_Info()
{		
		AI_Output (other,self ,"DIA_Jan_SellArmor_15_00"); //Mogê kupiæ od ciebie jak¹œ zbrojê?

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_01"); //Nie mam nic, co by³oby lepsze od twojej zbroi. Zapomnijmy o tym.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_02"); //Mag, który chce nosiæ zbrojê? Zapomnij. IdŸ do krawca. Nie mogê zrobiæ dla ciebie zbroi.
		}
		else
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_03"); //Gdybym jak¹œ mia³, chêtnie bym ci j¹ sprzeda³. Niestety, nie mam ¿adnej zbroi.
			
			Info_ClearChoices (DIA_JAN_SellArmor);
			Info_AddChoice (DIA_JAN_SellArmor,"No to chyba nic nie mo¿na zrobiæ.",DIA_JAN_SellArmor_Sorry);
			Info_AddChoice (DIA_JAN_SellArmor,"Mo¿e w takim razie zrobisz mi zbrojê?",DIA_JAN_SellArmor_BuildOne);
		};	
};

FUNC VOID DIA_JAN_SellArmor_Sorry()
{
	AI_Output (other,self ,"DIA_JAN_SellArmor_Sorry_15_00"); //No to chyba nic nie mo¿na zrobiæ.
	AI_Output (self ,other,"DIA_JAN_SellArmor_Sorry_10_01"); //Jak ju¿ coœ bêdziesz mia³, to daj mi znaæ.
	
	Info_ClearChoices (DIA_JAN_SellArmor);
};

FUNC VOID DIA_JAN_SellArmor_BuildOne()
{
	AI_Output (other,self ,"DIA_JAN_SellArmor_BuildOne_15_00"); //Mo¿e w takim razie zrobisz mi zbrojê?
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_01"); //Có¿, jeœli chcesz czegoœ lepszego, musisz mi dostarczyæ odpowiednie materia³y.
	AI_Output (other,self ,"DIA_JAN_SellArmor_BuildOne_15_02"); //Czego potrzebujesz?
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_03"); //Chcesz walczyæ ze smokami, prawda? Przynieœ mi kilka smoczych ³usek. Móg³bym z nich coœ dla ciebie zmajstrowaæ.
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_04"); //20 powinno wystarczyæ.
	
	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices (DIA_JAN_SellArmor);
};

//*******************************************
//	Ich habe die Drachenschuppen für dich.
//*******************************************

//-------------------------------------------
var int Jan_Sells_Armor;
//-------------------------------------------

INSTANCE DIA_JAN_Dragonscales (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Dragonscales_Condition;
	information	= DIA_Jan_Dragonscales_Info;
	permanent	= TRUE;
	description	= "Mam te smocze ³uski dla ciebie.";
};                       

FUNC INT DIA_Jan_Dragonscales_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == TRUE)
	&& (Jan_Sells_Armor == FALSE)
	&& (Npc_HasItems (other,ItAT_Dragonscale) >= 1)
	{
		return 1;
	};	
};
 var int DIA_JAN_Dragonscales_OneTime;
FUNC VOID DIA_Jan_Dragonscales_Info()
{		
		AI_Output (other,self ,"DIA_JAN_Dragonscales_15_00"); //Mam te smocze ³uski dla ciebie.
		if (Npc_HasItems (other,ItAT_Dragonscale) >= 20)
		{
			B_GiveInvItems (other,self ,ItAT_Dragonscale,20);
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_01"); //Dobrze, da siê coœ z tego zrobiæ.
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_02"); //Wróæ jutro. Ta czêœæ powinna byæ ju¿ gotowa.
			
			if (DIA_JAN_Dragonscales_OneTime == FALSE)//Joly:zur sicherheit
			{
				B_GivePlayerXP (XP_Addon_JanSellsArmor);
				DIA_JAN_Dragonscales_OneTime = TRUE;
			};
			
			Jan_Sells_Armor = Wld_GetDay ();
		}
		else
		{	
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_03"); //Potrzebujê 20 smoczych ³usek. Inaczej nie bêdê w stanie zrobiæ ci ¿adnej zbroi.
		};	
};

//*******************************************
//	Ist die Rüstung fertig?
//*******************************************

//-------------------------------
var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;
//-------------------------------

INSTANCE DIA_JAN_ArmorReady (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_ArmorReady_Condition;
	information	= DIA_Jan_ArmorReady_Info;
	permanent	= TRUE;
	description	= "Zbroja jest gotowa?";
};                       

FUNC INT DIA_Jan_ArmorReady_Condition()
{
	if (MIS_OCGateOpen == FALSE)
	&& (Jan_Sells_Armor != FALSE)
	&& (DIA_JAN_ArmorReady_NoPerm == FALSE)
	{
		return 1;
	};	
};

FUNC VOID DIA_Jan_ArmorReady_Info()
{		
		AI_Output (other,self ,"DIA_JAN_ArmorReady_15_00"); //Zbroja jest gotowa?
		if (Jan_Sells_Armor == Wld_GetDay ())
		{
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_01"); //Nie, jeszcze nie. PrzyjdŸ jutro.
		}
		else
		{
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_02"); //Tak, to prawdziwy majstersztyk. Mo¿esz j¹ kupiæ, jeœli chcesz.
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_03"); //Dam ci specjaln¹ cenê - 12,000 sztuk z³ota.
			AI_Output (other,self ,"DIA_JAN_ArmorReady_15_04"); //Co? Po tym wszystkim, co dla ciebie zrobi³em?
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_05"); //Muszê jakoœ zarobiæ na ¿ycie. Bierzesz albo do widzenia.
		
			DJG_Armor_is_offered = TRUE;
			DIA_JAN_ArmorReady_NoPerm = TRUE;
		};	
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Jan_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	DJG_714_Jan;
	nr           = 	4;
	condition	 = 	DIA_Jan_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Jan_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"Œredni pancerz ³owcy smoków. Ochrona (broñ i strza³y) 80, 12000 sztuk z³ota."; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Jan_DJG_ARMOR_M_Condition ()
{
	IF (Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (DJG_Armor_is_offered == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Jan_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Jan_DJG_ARMOR_M_15_00"); //Chcê kupiæ zbrojê.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Jan_DJG_ARMOR_M_10_01"); //Sam widzisz, ¿e warta jest ka¿dej sztuki z³ota.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Jan_DJG_ARMOR_M_10_02"); //Nie masz doœæ z³ota.
	};	
	
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonPlettBericht		(C_INFO)
{
	npc			 = 	DJG_714_Jan;
	nr			 = 	3;
	condition	 = 	DIA_Jan_DragonPlettBericht_Condition;
	information	 = 	DIA_Jan_DragonPlettBericht_Info;

	description	 = 	"Co do tych smoków...";
};

var int DIA_Jan_DragonPlettBericht_NoPerm;
func int DIA_Jan_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_JAN_Dragons))
	&& (DIA_Jan_DragonPlettBericht_NoPerm == FALSE)
	&& (MIS_OCGateOpen == FALSE)
	&& (MIS_KilledDragons != 0)
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info ()
{
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_00"); //Zabi³em smoka.
	}
	else if ((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_01"); //Zabi³em kilka smoków.
	}
	else 
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_02"); //Zabi³em wszystkie smoki.
	};
	
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_03"); //No i co? Jesteœ przecie¿ ³owc¹ smoków, prawda?
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_04"); //A czy ty równie¿ nim nie jesteœ?
	}
	else
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_05"); //To ³adnie. Ale szczerze powiedziawszy, niewiele mnie to interesuje.
	};
	
	AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_06"); //Ju¿ ci powiedzia³em, ¿e wolê robiæ broñ, ni¿ braæ udzia³ w polowaniu na smoki.

	if (hero.guild != GIL_DJG)
	&& (hero.guild != GIL_SLD)
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_07"); //Jest jednak pewna rzecz, która by mnie interesowa³a.
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_08"); //Gdybyœ przyniós³ mi trochê smoczej krwi, zap³aci³bym ci za ni¹ niez³¹ sumkê.
		Jan_WantsDragonBlood = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonBlood
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonBlood		(C_INFO)
{
	npc		 = 	DJG_714_Jan;
	nr		 = 	3;
	condition	 = 	DIA_Jan_DragonBlood_Condition;
	information	 = 	DIA_Jan_DragonBlood_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mam dla ciebie trochê smoczej krwi.";
};

func int DIA_Jan_DragonBlood_Condition ()
{
	if (Jan_WantsDragonBlood == TRUE)
	&& (MIS_OCGateOpen == FALSE)
	&& (Npc_HasItems (other,ItAt_DragonBlood))
	&& ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
		{
			return TRUE;
		};
};

func void DIA_Jan_DragonBlood_Info ()
{
	AI_Output			(other, self, "DIA_Jan_DragonBlood_15_00"); //Mam dla ciebie trochê smoczej krwi.
	AI_Output			(self, other, "DIA_Jan_DragonBlood_10_01"); //Œwietnie. Sprzedaj mi wszystko, co masz.

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(wszystko)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(jedna buteleczka)", DIA_Jan_DragonBlood_1 );
	};
};
func void DIA_Jan_DragonBlood_BACK ()
{
	Info_ClearChoices	(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1 ()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = 1;

	B_GiveInvItems (other, self, ItAt_DragonBlood,  DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP (XP_DJG_BringDragonBloods);
	DragonBloodGeld	= (DragonBloodCount * Value_DragonBlood);	//Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems (self, ItMi_Gold, DragonBloodGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(wszystko)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(jedna buteleczka)", DIA_Jan_DragonBlood_1 );
	};
	

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString (Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen	(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

func void DIA_Jan_DragonBlood_all ()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = Npc_HasItems(other, ItAt_DragonBlood);

	B_GiveInvItems (other, self, ItAt_DragonBlood,  DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP (XP_DJG_BringDragonBloods);
	DragonBloodGeld	= (DragonBloodCount * Value_DragonBlood); //Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems (self, ItMi_Gold, DragonBloodGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(wszystko)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(jedna buteleczka)", DIA_Jan_DragonBlood_1 );
	};

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString (Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen	(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

///////////////////////////////////////////////////////////////////////
//	Info nachOCGATEOPEN
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_NACHOCGATEOPEN		(C_INFO)
{
	npc		 = 	DJG_714_Jan;
	nr		 = 	3;
	condition	 = 	DIA_Jan_NACHOCGATEOPEN_Condition;
	information	 = 	DIA_Jan_NACHOCGATEOPEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wszystko w porz¹dku?";
};

func int DIA_Jan_NACHOCGATEOPEN_Condition ()
{
	if (MIS_OCGateOpen == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Jan_NACHOCGATEOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Jan_NACHOCGATEOPEN_15_00"); //Wszystko w porz¹dku?
	AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_01"); //Absolutnie nic nie jest w porz¹dku!
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_02"); //Idioci! Dlaczego otworzyliœcie bramê? Zawsze wiedzia³em, ¿e paladynom brakuje pi¹tej klepki!
	}
	else
	{
		AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_03"); //Tak po prostu otwieraj¹ sobie bramê. Têpaki! W g³owie mi siê to nie mieœci.
	};
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jan_PICKPOCKET (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 900;
	condition	= DIA_Jan_PICKPOCKET_Condition;
	information	= DIA_Jan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jan_PICKPOCKET_Condition()
{
	C_Beklauen (37, 95);
};
 
FUNC VOID DIA_Jan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jan_PICKPOCKET);
	Info_AddChoice		(DIA_Jan_PICKPOCKET, DIALOG_BACK 		,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jan_PICKPOCKET);
};
	
func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jan_PICKPOCKET);
};









