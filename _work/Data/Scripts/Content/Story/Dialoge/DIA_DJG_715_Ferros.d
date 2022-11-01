
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
	description = "Da dove venite?";
};

FUNC INT DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Hello_15_00"); //Da dove venite?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_01"); //Dal continente. La mia gente e io ci siamo rifugiati qui.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_02"); //La situazione lì sta peggiorando. Gli orchi bruciano tutti i villaggi che incontrano, lasciando dietro di loro solo cenere e distruzione.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_03"); //Il re ha perso il controllo del suo regno.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_04"); //Se vuoi saperlo, penso che voi paladini abbiate fallito.
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
	description = "Dov’è la tua gente, adesso?";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Friends_15_00"); //Dov’è la tua gente, adesso?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_01"); //L'ho abbandonata.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_02"); //Credevano che avrebbero potuto prendere tutto ciò che volevano, anche se non apparteneva a loro. Allora mi sono tirato fuori.
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
	description = "Cos’altro sai sulla guerra?";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_War_15_00"); //Cos’altro sai sulla guerra?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_01"); //Non vai a trovare il tuo re da molto tempo, vero?
	};
	
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_02"); //Gli orchi sono alle porte della capitale, ma non so se l'abbiano o meno conquistata.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_03"); //L'ultima cosa che ho sentito dire è che il re è morto. Ma non ci credo.
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
	description = "Cosa ci fai qui nel castello?";
};

FUNC INT DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_15_00"); //Cosa ci fai qui nel castello?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_01"); //Ho saputo dei draghi o volevo dare una mano a combatterli.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_02"); //Purtroppo ho perso la mia spada quando stavo strisciando oltre gli orchi. Ora sono bloccato qui.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_03"); //Senza una spada non posso fuggire e quelle che vendono qui sono la peggior ferraglia che abbia mai visto.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Ti auguro buona fortuna per la tua ricerca.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Cosa mi dai se ti trovo una buona spada?",DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Troverò la tua spada.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem		(ItMW_1H_FerrosSword_Mis , "FP_OW_ITEM_08"); 
	MIS_FerrosSword = LOG_RUNNING; 
	
	Log_CreateTopic (TOPIC_FerrosSword, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword, LOG_RUNNING);
	B_LogEntry (TOPIC_FerrosSword,"Feros ha abbandonato la sua spada tra gli orchi. È stato stupido da parte sua."); 
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_No_15_00"); //Ti auguro buona fortuna con la tua ricerca.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01"); //Devo riflettere seriamente sul motivo che mi ha spinto a venire qui.
	
	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Price ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //Cosa mi dai, se ti trovo una buona spada?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //Purtroppo non posso darti nulla. Ho speso fino all'ultima moneta d'oro per acquistare la spada.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Yes ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00"); //Troverò la tua spada.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01"); //Sarebbe fantastico. Dovresti controllare l'alta scogliera a sud.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02"); //Probabilmente l'ho persa lì, vicino alle tende degli orchi.
	B_LogEntry (TOPIC_FerrosSword,"Sembra che Feros abbia perso la sua spada sull'alta collina a sud, dove si trovano le tende degli orchi."); 
	
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
	description = "Forse ho un’altra spada per te.";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00"); //Forse ho un’altra spada per te.


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
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00"); //È una bella spada. Davvero di ottima fattura.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01"); //Sei sicuro di volermela regalare?
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"No, serve a me.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Sì, prendila.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"No, serve a me.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Sì, prendila.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

FUNC VOID B_Ferros_FerrosAnySword_Yes1 ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00"); //Sì, prendila.
};

FUNC VOID B_Ferros_FerrosAnySword_Yes2 ()
{
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00"); //Grazie, sono tuo debitore.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01"); //In cambio ti mostrerò un paio di trucchetti che ti permetteranno di sfruttare meglio la tua forza e destrezza in combattimento.

	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Feros può insegnarmi a migliorare forza e destrezza.");

};

FUNC VOID B_Ferros_FerrosAnySword_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//No, serve a me.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Capisco.
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
	description = "Ho trovato la tua spada.";
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
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosHisSword_15_00"); //Ho trovato la tua spada.
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
	description = "Mostrami come migliorare le mie abilità.";
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
	AI_Output (other,self ,"DIA_Ferros_Teach_15_00"); //Mostrami come migliorare le mie abilità.

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_01"); //Dopo questi attacchi degli orchi ho deciso di ritirarmi. Mi basta essere ancora vivo.
	}
	else
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_02"); //Un buon guerriero deve sapere come trasmettere le proprie abilità alla sua spada.
	
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
	description	= "Tutti i draghi sono morti.";
				
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
	AI_Output	(other,self ,"DIA_Ferros_AllDragonsDead_15_00"); //Tutti i draghi sono morti.
	AI_Output 	(self ,other,"DIA_Ferros_AllDragonsDead_01_01"); //Bel lavoro! Se avessimo avuto più uomini come te, forse non saremmo arrivati a questo punto.
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


