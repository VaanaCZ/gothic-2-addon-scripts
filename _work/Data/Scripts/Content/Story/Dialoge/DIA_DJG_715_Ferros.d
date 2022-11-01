
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_EXIT   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 999;
	condition   = DIA_DJG_715_Ferros_EXIT_Condition;
	information = DIA_DJG_715_Ferros_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_Hello   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 4;
	condition   = DIA_DJG_715_Ferros_Hello_Condition;
	information = DIA_DJG_715_Ferros_Hello_Info;
	permanent   = FALSE;
	description = "Skąd pochodzisz?";
};

FUNC INT DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Hello_15_00"); //Skąd pochodzisz?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_01"); //Przybywam z kontynentu. Tam właśnie schronił się mój lud.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_02"); //Sytuacja pogarsza się z dnia na dzień. Orkowie plądrują wioski, pozostawiając po sobie jedynie dymiące zgliszcza.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_03"); //Król całkowicie stracił kontrolę nad krajem.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_04"); //Wy, paladyni, też zawiedliście.
	};	
};

//*********************************************************************
//	Info Friends 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_Friends   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 5;
	condition   = DIA_DJG_715_Ferros_Friends_Condition;
	information = DIA_DJG_715_Ferros_Friends_Info;
	permanent   = FALSE;
	description = "Gdzie jest teraz twój lud?";
};

FUNC INT DIA_DJG_715_Ferros_Friends_Condition()
{
	if (Npc_KnowsInfo (other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Friends_15_00"); //Gdzie jest teraz twój lud?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_01"); //Porzuciłem ich.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_02"); //Uważali, że mogą przywłaszczyć sobie wszystko, nawet to, co im się nie należało. Ja nie podzielałem ich zdania.
};

//*********************************************************************
//	Info War 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_War   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 6;
	condition   = DIA_DJG_715_Ferros_War_Condition;
	information = DIA_DJG_715_Ferros_War_Info;
	permanent   = FALSE;
	description = "Co jeszcze wiesz na temat wojny?";
};

FUNC INT DIA_DJG_715_Ferros_War_Condition()
{
	if (Npc_KnowsInfo (other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_War_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_War_15_00"); //Co jeszcze wiesz na temat wojny?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_01"); //Pewno od dawna nie widziałeś się z Królem, co?
	};
	
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_02"); //Orkowie oblegają stolicę. Nie wiem, czy padła, czy może wciąż opiera się ich atakom.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_03"); //Ostatnią informacją, którą słyszałem, było to, że Król nie żyje. Ale nie wierzę w to.
};

//*********************************************************************
//	Was machst du hier in der Burg? 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_OldCamp   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 7;
	condition   = DIA_DJG_715_Ferros_OldCamp_Condition;
	information = DIA_DJG_715_Ferros_OldCamp_Info;
	permanent   = FALSE;
	description = "Co porabiasz w zamku?";
};

FUNC INT DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_15_00"); //Co porabiasz w zamku?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_01"); //Usłyszałem o smokach i postanowiłem pomóc w ich pokonaniu.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_02"); //Niestety, gdy próbowałem przemknąć się obok obozowiska orków, zgubiłem miecz. Teraz tkwię tu bezczynnie.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_03"); //Bez broni nie mogę opuścić tego miejsca. Zaś miecze oferowane przez tutejszych płatnerzy to najgorszy złom, jaki widziałem.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Życzę powodzenia w poszukiwaniach.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Co dostanę, jeśli uda mi się odzyskać twój miecz?",DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Odnajdę twój miecz.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem		(ItMW_1H_FerrosSword_Mis , "FP_OW_ITEM_08"); 
	MIS_FerrosSword = LOG_RUNNING; 
	
	Log_CreateTopic (TOPIC_FerrosSword, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword, LOG_RUNNING);
	B_LogEntry (TOPIC_FerrosSword,"Feros zostawił u orków swój miecz. To nie było zbyt mądre."); 
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_No_15_00"); //Życzę powodzenia w poszukiwaniach.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01"); //Chyba czas spytać samego siebie: po co ja tu właściwie jestem?
	
	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Price ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //Co dostanę, jeśli uda mi się odzyskać twój miecz?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //Nie mogę ci nic zaoferować, bo na ten miecz wydałem ostatnie złoto, jakie miałem.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Yes ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00"); //Odnajdę twój miecz.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01"); //To wspaniale. Powinieneś go poszukać na klifie, na południe stąd.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02"); //Prawdopodobnie upuściłem go w pobliżu orkowych namiotów.
	B_LogEntry (TOPIC_FerrosSword,"Wygląda na to, że Feros zgubił miecz na wysokim klifie na południu, gdzie znajdują się namioty orków."); 
	
	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

//*********************************************************************
//	Info FerrosAnySword
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_FerrosAnySword   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 6;
	condition   = DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information = DIA_DJG_715_Ferros_FerrosAnySword_Info;
	permanent   = FALSE;
	description = "Może miałbym dla ciebie jakiś inny miecz.";
};

FUNC INT DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	IF 	(	(MIS_FerrosSword == LOG_RUNNING) 
	&&	(	(Npc_HasItems (other,ItMW_1H_Special_01) >= 1)
	|| 		(Npc_HasItems (other,ItMW_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00"); //Może miałbym dla ciebie jakiś inny miecz.


	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,DIALOG_BACK,DIA_DJG_715_Ferros_FerrosAnySword_Back);
	
	if (Npc_HasItems (other,ItMW_1H_Special_01) >= 1)
	{
		Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,ItMW_1H_Special_01.name,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};
	if (Npc_HasItems (other,ItMW_1H_Special_02) >= 1)
	{
		Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,ItMW_1H_Special_02.name,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Back ()
{
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
};

FUNC VOID B_Ferros_FerrosAnySword_Give ()
{
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00"); //To świetne ostrze. Robota najwyższej klasy.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01"); //Jesteś pewien, że chcesz mi go tak po prostu oddać?
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Nie, potrzebuję go.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Tak, weź go.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Nie, potrzebuję go.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Tak, weź go.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

FUNC VOID B_Ferros_FerrosAnySword_Yes1 ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00"); //Tak, weź go.
};

FUNC VOID B_Ferros_FerrosAnySword_Yes2 ()
{
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00"); //Dzięki, jestem twoim dłużnikiem.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01"); //W zamian pokażę ci kilka sztuczek, dzięki którym będziesz mógł lepiej wykorzystać swą siłę i zręczność podczas pojedynków.

	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Feros może mnie nauczyć, jak zwiększyć swoją siłę i zręczność.");

};

FUNC VOID B_Ferros_FerrosAnySword_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Nie, potrzebuję go.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Rozumiem.
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes ()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems (other,self ,ItMW_1H_Special_01,1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP (XP_FerrosSword);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No ()
{

	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes ()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems (other,self ,ItMW_1H_Special_02,1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP (XP_FerrosSword);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No ()
{
	B_Ferros_FerrosAnySword_No();

	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
};

//*********************************************************************
//	Info FerrosHisSword
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_FerrosHisSword   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 6;
	condition   = DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information = DIA_DJG_715_Ferros_FerrosHisSword_Info;
	permanent   = FALSE;
	description = "Znalazłem twój miecz.";
};

FUNC INT DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	IF 	(	(MIS_FerrosSword == LOG_RUNNING) 
	&&	(Npc_HasItems (other,ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosHisSword_15_00"); //Znalazłem twój miecz.
	B_GiveInvItems (other,self,ItMw_1h_FerrosSword_Mis,1);
	B_Ferros_FerrosAnySword_Yes2 ();
	MIS_FerrosSword = LOG_SUCCESS;	
	B_GivePlayerXP (XP_FerrosSword);
};

//*******************************************
//	TechPlayer
//*******************************************

INSTANCE DIA_Ferros_Teach(C_INFO)
{
	npc			= DJG_715_Ferros;
	nr			= 1;
	condition	= DIA_Ferros_Teach_Condition;
	information	= DIA_Ferros_Teach_Info;
	permanent	= TRUE;
	description = "Pokaż mi, jak mogę udoskonalić swoje umiejętności.";
};                       

FUNC INT DIA_Ferros_Teach_Condition()
{
	if (MIS_FerrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ferros_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Ferros_Teach_15_00"); //Pokaż mi, jak mogę udoskonalić swoje umiejętności.

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_01"); //Po tych atakach orków mam dosyć. Szczęście, że w ogóle jeszcze żyję.
	}
	else
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_02"); //Dobry wojownik musi umieć przekazać broni część swojej energii.
	
	Info_ClearChoices (DIA_Ferros_Teach);
	Info_AddChoice		(DIA_Ferros_Teach, DIALOG_BACK, DIA_Ferros_Teach_Back);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Ferros_Teach_STR_1);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Ferros_Teach_STR_5);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Ferros_Teach_DEX_1);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Ferros_Teach_DEX_5);
	};

};

FUNC VOID DIA_Ferros_Teach_Back ()
{
	Info_ClearChoices (DIA_Ferros_Teach);
};

FUNC VOID DIA_Ferros_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Ferros_Teach_STR_1);
};

FUNC VOID DIA_Ferros_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Ferros_Teach_STR_5);
};

FUNC VOID DIA_Ferros_Teach_DEX_1 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Ferros_Teach_DEX_1);
};

FUNC VOID DIA_Ferros_Teach_DEX_5 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Ferros_Teach_DEX_5);
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Ferros_AllDragonsDead   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 5;
	condition   = DIA_Ferros_AllDragonsDead_Condition;
	information = DIA_Ferros_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Wszystkie smoki nie żyją.";
				
};

FUNC INT DIA_Ferros_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Ferros_AllDragonsDead_15_00"); //Wszystkie smoki są martwe.
	AI_Output 	(self ,other,"DIA_Ferros_AllDragonsDead_01_01"); //Doskonale! Gdybyśmy mieli więcej ludzi takich jak ty, sprawy prawdopodobnie nigdy nie zaszłyby tak daleko.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ferros_PICKPOCKET (C_INFO)
{
	npc			= DJG_715_Ferros;
	nr			= 900;
	condition	= DIA_Ferros_PICKPOCKET_Condition;
	information	= DIA_Ferros_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Ferros_PICKPOCKET_Condition()
{
	C_Beklauen (56, 75);
};
 
FUNC VOID DIA_Ferros_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ferros_PICKPOCKET);
	Info_AddChoice		(DIA_Ferros_PICKPOCKET, DIALOG_BACK 		,DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ferros_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ferros_PICKPOCKET);
};
	
func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ferros_PICKPOCKET);
};


