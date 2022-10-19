//##################################################
//##
//##	Kapitel 1
//##
//##################################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Hodges_Kap1_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap1_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap1_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap1_EXIT_Condition ()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};

func void DIA_Hodges_Kap1_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Hodges_HALLO		(C_INFO)
{
	npc		 	= BAU_908_Hodges;
	nr		 	= 1;
	condition	= DIA_Hodges_HALLO_Condition;
	information	= DIA_Hodges_HALLO_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hodges_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Hodges_HALLO_15_00"); //Witaj, jestem tu nowy.
	AI_Output (self, other, "DIA_Hodges_HALLO_03_01"); //Nie chcia�bym, �eby� to odebra� w niew�a�ciwy spos�b, ale nie mam teraz ochoty na pogaw�dk� - jestem zupe�nie wyko�czony.
	AI_Output (other, self, "DIA_Hodges_HALLO_15_02"); //Masz strasznie du�o pracy, co?
	AI_Output (self, other, "DIA_Hodges_HALLO_03_03"); //Racja. Bennet wyrabia tyle broni, �e ledwie nad��am z jej polerowaniem.
};

// ************************************************************
// 			  				 About Farm
// ************************************************************
instance DIA_Hodges_TellAboutFarm	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_TellAboutFarm_Condition;
	information	 = 	DIA_Hodges_TellAboutFarm_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Co mo�esz mi powiedzie� o farmie?";
};

func int DIA_Hodges_TellAboutFarm_Condition ()
{
	if ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};	
};

func void DIA_Hodges_TellAboutFarm_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_TellAboutFarm_15_00"); //Co mo�esz mi powiedzie� o farmie?
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_01"); //To jest farma Onara.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_02"); //A ten du�y budynek to jego dom. Jedno skrzyd�o zajmuj� najemnicy.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_03"); //Odk�d si� sprowadzili, my, farmerzy, musimy mieszka� w stodole.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_04"); //Ale mi to nie przeszkadza, to dobrze, �e kto� pilnuje farmy.
	
	if (Npc_GetDistToWP (self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_05"); //Ten budynek to kuchnia.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_06"); //Kuchnia znajduje si� na ty�ach ku�ni.
	};
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_07"); //Przy odrobinie szcz�cia mo�e za�apiesz si� na co� do jedzenia.
};

// ************************************************************
// 			  				   AboutSld 
// ************************************************************
instance DIA_Hodges_AboutSld	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_AboutSld_Condition;
	information	 = 	DIA_Hodges_AboutSld_Info;
	permanent 	 = 	FALSE;
	description	 = 	"A o co chodzi z tymi najemnikami?";
};

func int DIA_Hodges_AboutSld_Condition ()
{
	if (hero.guild != GIL_SLD) 
	&& (hero.guild != GIL_DJG)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_AboutSld_15_00"); //A o co chodzi z tymi najemnikami?
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_01"); //Onar wynaj�� ich, �eby obroni� si� przed stra��.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_02"); //Najemnicy chroni� tak�e farm�, trzod� i farmer�w.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_03"); //Wi�c �eby ci nie przysz�o do g�owy co� ukra��.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_04"); //Oni tylko czekaj� na pretekst, �eby ci� zbi� na kwa�ne jab�ko.
};

// ************************************************************
// 			  				   TRADE 
// ************************************************************
instance DIA_Hodges_TRADE	(C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 2;
	condition	= DIA_Hodges_TRADE_Condition;
	information	= DIA_Hodges_TRADE_Info;
	permanent 	= TRUE;
	description	= "Mog� od ciebie kupi� bro�?";
	trade		= TRUE;
};

func int DIA_Hodges_TRADE_Condition ()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info ()
{	
	AI_Output (other, self ,"DIA_Hodges_TRADE_15_00"); //Mog� kupi� u ciebie jak�� bro�?
	AI_Output (self, other, "DIA_Hodges_TRADE_03_01"); //Wyb�r jest do�� ubogi. Wi�kszo�� mieczy i topor�w trafia do Onara.
	
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
};


//##################################################
//##
//##	Kapitel 2
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap2_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap2_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap2_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap2_EXIT_Condition ()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 3
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap3_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap3_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap3_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap3_EXIT_Condition ()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Warum arbeitest du nicht?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_DontWork		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_DontWork_Condition;
	information	 = 	DIA_Hodges_DontWork_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Dlaczego nie pracujesz?";
};

func int DIA_Hodges_DontWork_Condition ()
{
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_DontWork_15_00"); //Dlaczego nie pracujesz?
	AI_Output (self ,other,"DIA_Hodges_DontWork_03_01"); //Jeszcze nie s�ysza�e�? Paladyni aresztowali Benneta.

	MIS_RescueBennet = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Kowal Bennet zosta� aresztowany w mie�cie przez paladyn�w."); 

};

///////////////////////////////////////////////////////////////////////
//	Was ist passiert?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_WhatHappened		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_WhatHappened_Condition;
	information	 = 	DIA_Hodges_WhatHappened_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Co si� sta�o?";
};

func int DIA_Hodges_WhatHappened_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_WhatHappened_15_00"); //Co si� sta�o?
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_01"); //Byli�my na zakupach w mie�cie, kiedy nagle us�yszeli�my krzyk: 'Tu s�, pojma� ich!'
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_02"); //O rany, ale si� przestraszy�em! Ucieka�em, jakby �ciga�o mnie ca�e stado demon�w.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_03"); //Bennet by� tu� za mn�. Nie wiem, co si� sta�o, ale kiedy dotar�em do bram miasta, jego ju� nie by�o.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_04"); //Musia� si� zgubi� gdzie� po drodze.
};

///////////////////////////////////////////////////////////////////////
//	Weswegen wurde Bennet denn verhaftet?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetsCrime			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	32;
	condition	 = 	DIA_Hodges_BennetsCrime_Condition;
	information	 = 	DIA_Hodges_BennetsCrime_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Jaki zarzut postawiono Bennetowi?";
};

func int DIA_Hodges_BennetsCrime_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetsCrime_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_00"); //Jaki zarzut postawiono Bennetowi?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_01"); //Morderstwo! Podobno zabi� paladyna. Co za wierutna bzdura! Przez ca�y czas by� tu� obok mnie.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_02"); //Wi�c dlaczego nie p�jdziesz do miasta i nie wyja�nisz ca�ej sprawy?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_03"); //Zamkn�liby mnie do pud�a jako jego wsp�lnika. Szczeg�lnie w obecnej sytuacji.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_04"); //Sytuacji?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_05"); //No wiesz, Onar. To si� musia�o tak sko�czy�.

	B_LogEntry (TOPIC_RESCUEBENNET,"Podobno Bennet zamordowa� paladyna. Jego czeladnik Hodges twierdzi, �e to nieprawda, jednak boi si� o�wiadczy� to w mie�cie."); 
};


///////////////////////////////////////////////////////////////////////
//	Wie reagieren die S�ldner?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetAndSLD			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	33;
	condition	 = 	DIA_Hodges_BennetAndSLD_Condition;
	information	 = 	DIA_Hodges_BennetAndSLD_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Jak zareagowali na to wasi najemnicy?";
};

func int DIA_Hodges_BennetAndSLD_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_00"); //Jak zareagowali na to wasi najemnicy?
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_01"); //Oczywi�cie nie wiem dok�adnie, co zamierzaj�, ale niekt�rzy z nich s� naprawd� wkurzeni.
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_02"); //Domy�lam si�.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_03"); //Gdyby to zale�a�o od nich, natychmiast zaatakowaliby miasto, �eby odbi� Benneta.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_04"); //Porozmawiaj z Lee, mo�e co� da si� zrobi�.
};
//##################################################
//##
//##	Kapitel 4
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap4_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap4_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap4_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap4_EXIT_Condition ()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 5
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap5_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap5_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap5_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap5_EXIT_Condition ()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hodges_PICKPOCKET (C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 900;
	condition	= DIA_Hodges_PICKPOCKET_Condition;
	information	= DIA_Hodges_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Hodges_PICKPOCKET_Condition()
{
	C_Beklauen (15, 10);
};
 
FUNC VOID DIA_Hodges_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hodges_PICKPOCKET);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_BACK 		,DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};
	
func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};




