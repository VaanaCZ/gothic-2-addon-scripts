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
	AI_Output (other, self, "DIA_Hodges_HALLO_15_00"); //Zdravím, jsem tu nový.
	AI_Output (self, other, "DIA_Hodges_HALLO_03_01"); //Neber si to nijak zle, ale není mi do âeèi - jsem úplnê hotovej.
	AI_Output (other, self, "DIA_Hodges_HALLO_15_02"); //Máš práce nad hlavu, co?
	AI_Output (self, other, "DIA_Hodges_HALLO_03_03"); //Tak to máš pravdu. Bennet dêlá tolik zbraní, že je ani nestaèím leštit.
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
	description	 = 	"Co mi mùžeš âíct o farmê?";
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
	AI_Output (other,self ,"DIA_Hodges_TellAboutFarm_15_00"); //Co mi mùžeš âíct o farmê?
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_01"); //Tohle je Onarova farma.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_02"); //To velké stavení je jeho dùm. Jedno kâídlo pâenechal žoldákùm.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_03"); //My rolníci máme každý své lùžko ve stodole.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_04"); //(pâekotnê) Ale já jsem spokojený, je dobrý mít lidi na hlídání farmy.
	
	if (Npc_GetDistToWP (self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_05"); //Tady za mnou je kuchyà.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_06"); //Kuchyà je v té budovê, co má zepâedu kovárnu.
	};
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_07"); //Možná budeš mít štêstí a Thekla pro tebe najde nêco k jídlu.
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
	description	 = 	"A co ti žoldnéâi?";
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
	AI_Output (other,self ,"DIA_Hodges_AboutSld_15_00"); //A co ti žoldnéâi?
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_01"); //Onar je najal, aby drželi domobranu zpátky.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_02"); //Ale také hlídají farmu, ovce a farmáâe.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_03"); //Takže ani nepomysli na to, že bys mohl nêco ukrást nebo se hrabat v nêèí truhle.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_04"); //Jen èekají na pâíležitost, jak tê vyâídit.
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
	description	= "Mohu si od tebe koupit nêjaké zbranê?";
	trade		= TRUE;
};

func int DIA_Hodges_TRADE_Condition ()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info ()
{	
	AI_Output (other, self ,"DIA_Hodges_TRADE_15_00"); //Mohu si od tebe koupit nêjaké zbranê?
	AI_Output (self, other, "DIA_Hodges_TRADE_03_01"); //Moc toho nemám. Skoro všechny meèe a sekery jsme dali do Onarova domu.
	
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
	description	 = 	"Proè nepracuješ?";
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
	AI_Output (other,self ,"DIA_Hodges_DontWork_15_00"); //Proè nepracuješ?
	AI_Output (self ,other,"DIA_Hodges_DontWork_03_01"); //Tys to ještê neslyšel? Paladinové zavâeli Benneta.

	MIS_RescueBennet = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Kováâe Benneta uvêznili mêstští paladinové."); 

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
	description	 = 	"Co se stalo?";
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
	AI_Output (other,self ,"DIA_Hodges_WhatHappened_15_00"); //Co se stalo?
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_01"); //No, byli jsme ve mêstê nakupovat, když všichni najednou zaèali kâièet. A nêkdo zaâval: Támhle jsou, chyãte je!
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_02"); //Chlape, jak já byl vydêšenej! Vzal jsem nohy na ramena a utíkal, jako by mi v patách byl ëábel sám.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_03"); //Bennet byl hned za mnou. Nevím, co se stalo, ale když jsem se dostal z mêsta, už jsem ho nikde nevidêl.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_04"); //Musel se mi ztratit nêkde ve mêstê.
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
	description	 = 	"Tak proè Benneta zavâeli?";
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
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_00"); //Tak proè Benneta zavâeli?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_01"); //Za vraždu! Bennet byl obvinên z vraždy paladina. Takovej nesmysl. Byl jsem celou dobu s ním.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_02"); //Tak proè nezajdeš do mêsta a celou tu vêc nevysvêtlíš?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_03"); //Šoupnou mê do basy jako komplice. Ne, za týhle situace tam rozhodnê nepùjdu.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_04"); //Jaký situace?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_05"); //Vždyã víš, Onar a mêsto. To by dopadlo špatnê.

	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet prý zavraždil paladina. Jeho uèedník Hodges ale tvrdí, že je nevinný. Ovšem nedovolil si vstoupit do mêsta."); 
};


///////////////////////////////////////////////////////////////////////
//	Wie reagieren die Söldner?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetAndSLD			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	33;
	condition	 = 	DIA_Hodges_BennetAndSLD_Condition;
	information	 = 	DIA_Hodges_BennetAndSLD_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Co na to žoldnéâi tady na farmê?";
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
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_00"); //Co na to žoldnéâi tady na farmê?
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_01"); //Nevím, co maj za lubem, ale nêkterý z nich jsou fakt vytoèený.
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_02"); //To je pochopitelné.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_03"); //Kdyby to bylo jen na nich, nejradši by hned vpadli do mêsta a dostali Benneta ven.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_04"); //Promluv si s Leem, tâeba ti nêco najde.
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




