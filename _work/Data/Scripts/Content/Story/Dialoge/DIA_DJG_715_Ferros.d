
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
	description = "Odkud jsi p�i�el?";
};

FUNC INT DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Hello_15_00"); //Odkud jsi p�i�el?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_01"); //Z pevniny. P�iplul jsem sem se sv�mi lidmi.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_02"); //Situace se po��d zhor�uje. Sk�eti za sebou nech�vaj� jen vyp�len� vesnice.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_03"); //Kr�l u� nem� ��dnou moc.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_04"); //Pokud to chce� v�d�t, tak jste vy paladinov� zklamali na pln� ���e.
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
	description = "Kde jsou tv� lid� te�?";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Friends_15_00"); //Kde jsou tv� lid� te�?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_01"); //Opustil jsem je.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_02"); //M�li dojem, �e si m��ou br�t, co se jim zl�b�, a bylo jim jedno, komu to pat��. Zbavili se m�.
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
	description = "Co dal��ho v� o v�lce?";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_War_15_00"); //Co dal��ho v� o v�lce?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_01"); //U� jsi sv�ho kr�le nevid�l p�kn� dlouho, co?
	};
	
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_02"); //Sk�eti jsou za branami hlavn�ho m�sta. Ale jestli u� padlo, to nev�m.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_03"); //Posledn� v�c, co jsem sly�el, byla, �e kr�l padl. Ale j� tomu nev���m.
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
	description = "Co d�l� tady na hrad�?";
};

FUNC INT DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_15_00"); //Co d�l� tady na hrad�?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_01"); //Zaslechl jsem o drac�ch a cht�l jsem pomoct v boji proti nim.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_02"); //Bohu�el jsem ztratil sv�j me�, kdy� jsem se pl�il kolem sk�et�. Te� jsem tady jak v pasti.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_03"); //Bez me�e se odsud nem��u dostat a ty me�e, co se tu daj� koupit, jsou ty nejhor�� kr�my, co jsem kdy vid�l.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"P�eju ti hodn� �t�st� p�i hled�n�.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Co mi d� za to, kdy� ti se�enu me�?",DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Najdu tv�j me�.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem		(ItMW_1H_FerrosSword_Mis , "FP_OW_ITEM_08"); 
	MIS_FerrosSword = LOG_RUNNING; 
	
	Log_CreateTopic (TOPIC_FerrosSword, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword, LOG_RUNNING);
	B_LogEntry (TOPIC_FerrosSword,"Kdesi u sk�et� ztratil Feros sv�j me� - to bylo po��dn� hloup�."); 
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_No_15_00"); //P�eju ti hodn� �t�st� p�i hled�n�.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01"); //Asi bych se m�l s�m sebe pt�t, pro� jsem vlastn� tady.
	
	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Price ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //Co mi d� za to, kdy� ti se�enu me�?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //Bohu�el ti nem��u d�t nic. Svoje posledn� pen�ze jsem utratil za ten me�.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Yes ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00"); //Najdu tv�j me�.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01"); //To by bylo v�born�. M�l bys ho hledat na tom strm�m sr�zu na jihu.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02"); //Pravd�podobn� jsem ho ztratil pobl� sk�et�ch stan�.
	B_LogEntry (TOPIC_FerrosSword,"Feros sv�j me� nejsp� ztratil na vysok�m �tesu na jihu - tam, kde si sk�eti rozbili sv� stany."); 
	
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
	description = "Mo�n� bych pro tebe m�l jin� me�.";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00"); //Mo�n� bych pro tebe m�l jin� me�.


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
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00"); //Je to dobr� �epel. Opravdu v�jime�n� pr�ce.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01"); //Jse� si jist�, �e mi n�co takov�ho chce� d�t?
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Ne, pot�ebuju ho pro sebe.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Jo, vezmi si to.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Ne, pot�ebuju ho pro sebe.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Jo, vezmi si to.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

FUNC VOID B_Ferros_FerrosAnySword_Yes1 ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00"); //Jo, vezmi si to.
};

FUNC VOID B_Ferros_FerrosAnySword_Yes2 ()
{
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00"); //D�ky, m� to u m�.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01"); //Na opl�tku ti uk�u spoustu trik�, kter� ti v boji umo�n� l�pe vyu��vat svou s�lu a obratnost.

	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Feros mi pom��e vylep�it s�lu a obratnost.");

};

FUNC VOID B_Ferros_FerrosAnySword_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Ne, pot�ebuju ho pro sebe.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Tak tomu rozum�m.
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
	description = "Na�el jsem tv�j me�.";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosHisSword_15_00"); //Na�el jsem tv�j me�.
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
	description = "Uka� mi, jak m��u pos�lit sv� schopnosti.";
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
	AI_Output (other,self ,"DIA_Ferros_Teach_15_00"); //Uka� mi, jak m��u pos�lit sv� schopnosti.

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_01"); //Po t�ch sk�et�ch �toc�ch jsem s t�m skon�il. Jsem r�d, �e jsem z�stal na�ivu, chlape.
	}
	else
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_02"); //Dobr� bojovn�k by se m�l nau�it, jak sv� schopnosti p�ev�st p��mo na zbra�.
	
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
	description	= "V�ichni draci u� jsou mrtv�.";
				
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
	AI_Output	(other,self ,"DIA_Ferros_AllDragonsDead_15_00"); //V�ichni draci jsou mrtv�.
	AI_Output 	(self ,other,"DIA_Ferros_AllDragonsDead_01_01"); //Dobr� pr�ce! Kdybychom m�li v�c takov�ch lid�, nejsp� by se to nikdy nedostalo tak daleko.
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


