
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
	description = "Sk�d pochodzisz?";
};

FUNC INT DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Hello_15_00"); //Sk�d pochodzisz?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_01"); //Przybywam z kontynentu. Tam w�a�nie schroni� si� m�j lud.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_02"); //Sytuacja pogarsza si� z dnia na dzie�. Orkowie pl�druj� wioski, pozostawiaj�c po sobie jedynie dymi�ce zgliszcza.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_03"); //Kr�l ca�kowicie straci� kontrol� nad krajem.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_04"); //Wy, paladyni, te� zawiedli�cie.
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
	description = "Gdzie jest teraz tw�j lud?";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Friends_15_00"); //Gdzie jest teraz tw�j lud?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_01"); //Porzuci�em ich.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_02"); //Uwa�ali, �e mog� przyw�aszczy� sobie wszystko, nawet to, co im si� nie nale�a�o. Ja nie podziela�em ich zdania.
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
		AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_01"); //Pewno od dawna nie widzia�e� si� z Kr�lem, co?
	};
	
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_02"); //Orkowie oblegaj� stolic�. Nie wiem, czy pad�a, czy mo�e wci�� opiera si� ich atakom.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_03"); //Ostatni� informacj�, kt�r� s�ysza�em, by�o to, �e Kr�l nie �yje. Ale nie wierz� w to.
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
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_01"); //Us�ysza�em o smokach i postanowi�em pom�c w ich pokonaniu.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_02"); //Niestety, gdy pr�bowa�em przemkn�� si� obok obozowiska ork�w, zgubi�em miecz. Teraz tkwi� tu bezczynnie.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_03"); //Bez broni nie mog� opu�ci� tego miejsca. Za� miecze oferowane przez tutejszych p�atnerzy to najgorszy z�om, jaki widzia�em.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"�ycz� powodzenia w poszukiwaniach.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Co dostan�, je�li uda mi si� odzyska� tw�j miecz?",DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Odnajd� tw�j miecz.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem		(ItMW_1H_FerrosSword_Mis , "FP_OW_ITEM_08"); 
	MIS_FerrosSword = LOG_RUNNING; 
	
	Log_CreateTopic (TOPIC_FerrosSword, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword, LOG_RUNNING);
	B_LogEntry (TOPIC_FerrosSword,"Feros zostawi� u ork�w sw�j miecz. To nie by�o zbyt m�dre."); 
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_No_15_00"); //�ycz� powodzenia w poszukiwaniach.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01"); //Chyba czas spyta� samego siebie: po co ja tu w�a�ciwie jestem?
	
	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Price ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //Co dostan�, je�li uda mi si� odzyska� tw�j miecz?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //Nie mog� ci nic zaoferowa�, bo na ten miecz wyda�em ostatnie z�oto, jakie mia�em.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Yes ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00"); //Odnajd� tw�j miecz.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01"); //To wspaniale. Powiniene� go poszuka� na klifie, na po�udnie st�d.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02"); //Prawdopodobnie upu�ci�em go w pobli�u orkowych namiot�w.
	B_LogEntry (TOPIC_FerrosSword,"Wygl�da na to, �e Feros zgubi� miecz na wysokim klifie na po�udniu, gdzie znajduj� si� namioty ork�w."); 
	
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
	description = "Mo�e mia�bym dla ciebie jaki� inny miecz.";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00"); //Mo�e mia�bym dla ciebie jaki� inny miecz.


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
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00"); //To �wietne ostrze. Robota najwy�szej klasy.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01"); //Jeste� pewien, �e chcesz mi go tak po prostu odda�?
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Nie, potrzebuj� go.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Tak, we� go.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Nie, potrzebuj� go.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Tak, we� go.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

FUNC VOID B_Ferros_FerrosAnySword_Yes1 ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00"); //Tak, we� go.
};

FUNC VOID B_Ferros_FerrosAnySword_Yes2 ()
{
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00"); //Dzi�ki, jestem twoim d�u�nikiem.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01"); //W zamian poka�� ci kilka sztuczek, dzi�ki kt�rym b�dziesz m�g� lepiej wykorzysta� sw� si�� i zr�czno�� podczas pojedynk�w.

	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Feros mo�e mnie nauczy�, jak zwi�kszy� swoj� si�� i zr�czno��.");

};

FUNC VOID B_Ferros_FerrosAnySword_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Nie, potrzebuj� go.
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
	description = "Znalaz�em tw�j miecz.";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosHisSword_15_00"); //Znalaz�em tw�j miecz.
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
	description = "Poka� mi, jak mog� udoskonali� swoje umiej�tno�ci.";
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
	AI_Output (other,self ,"DIA_Ferros_Teach_15_00"); //Poka� mi, jak mog� udoskonali� swoje umiej�tno�ci.

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_01"); //Po tych atakach ork�w mam dosy�. Szcz�cie, �e w og�le jeszcze �yj�.
	}
	else
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_02"); //Dobry wojownik musi umie� przekaza� broni cz�� swojej energii.
	
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
	description	= "Wszystkie smoki nie �yj�.";
				
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
	AI_Output	(other,self ,"DIA_Ferros_AllDragonsDead_15_00"); //Wszystkie smoki s� martwe.
	AI_Output 	(self ,other,"DIA_Ferros_AllDragonsDead_01_01"); //Doskonale! Gdyby�my mieli wi�cej ludzi takich jak ty, sprawy prawdopodobnie nigdy nie zasz�yby tak daleko.
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


