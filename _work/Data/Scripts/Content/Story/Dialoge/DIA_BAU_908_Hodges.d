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
	AI_Output (other, self, "DIA_Hodges_HALLO_15_00"); //Zdrav�m, jsem tu nov�.
	AI_Output (self, other, "DIA_Hodges_HALLO_03_01"); //Neber si to nijak zle, ale nen� mi do �e�i - jsem �pln� hotovej.
	AI_Output (other, self, "DIA_Hodges_HALLO_15_02"); //M� pr�ce nad hlavu, co?
	AI_Output (self, other, "DIA_Hodges_HALLO_03_03"); //Tak to m� pravdu. Bennet d�l� tolik zbran�, �e je ani nesta��m le�tit.
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
	description	 = 	"Co mi m��e� ��ct o farm�?";
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
	AI_Output (other,self ,"DIA_Hodges_TellAboutFarm_15_00"); //Co mi m��e� ��ct o farm�?
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_01"); //Tohle je Onarova farma.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_02"); //To velk� staven� je jeho d�m. Jedno k��dlo p�enechal �old�k�m.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_03"); //My roln�ci m�me ka�d� sv� l��ko ve stodole.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_04"); //(p�ekotn�) Ale j� jsem spokojen�, je dobr� m�t lidi na hl�d�n� farmy.
	
	if (Npc_GetDistToWP (self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_05"); //Tady za mnou je kuchy�.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_06"); //Kuchy� je v t� budov�, co m� zep�edu kov�rnu.
	};
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_07"); //Mo�n� bude� m�t �t�st� a Thekla pro tebe najde n�co k j�dlu.
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
	description	 = 	"A co ti �oldn��i?";
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
	AI_Output (other,self ,"DIA_Hodges_AboutSld_15_00"); //A co ti �oldn��i?
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_01"); //Onar je najal, aby dr�eli domobranu zp�tky.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_02"); //Ale tak� hl�daj� farmu, ovce a farm��e.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_03"); //Tak�e ani nepomysli na to, �e bys mohl n�co ukr�st nebo se hrabat v n��� truhle.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_04"); //Jen �ekaj� na p��le�itost, jak t� vy��dit.
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
	description	= "Mohu si od tebe koupit n�jak� zbran�?";
	trade		= TRUE;
};

func int DIA_Hodges_TRADE_Condition ()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info ()
{	
	AI_Output (other, self ,"DIA_Hodges_TRADE_15_00"); //Mohu si od tebe koupit n�jak� zbran�?
	AI_Output (self, other, "DIA_Hodges_TRADE_03_01"); //Moc toho nem�m. Skoro v�echny me�e a sekery jsme dali do Onarova domu.
	
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
	description	 = 	"Pro� nepracuje�?";
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
	AI_Output (other,self ,"DIA_Hodges_DontWork_15_00"); //Pro� nepracuje�?
	AI_Output (self ,other,"DIA_Hodges_DontWork_03_01"); //Tys to je�t� nesly�el? Paladinov� zav�eli Benneta.

	MIS_RescueBennet = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Kov��e Benneta uv�znili m�st�t� paladinov�."); 

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
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_01"); //No, byli jsme ve m�st� nakupovat, kdy� v�ichni najednou za�ali k�i�et. A n�kdo za�val: T�mhle jsou, chy�te je!
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_02"); //Chlape, jak j� byl vyd�enej! Vzal jsem nohy na ramena a ut�kal, jako by mi v pat�ch byl ��bel s�m.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_03"); //Bennet byl hned za mnou. Nev�m, co se stalo, ale kdy� jsem se dostal z m�sta, u� jsem ho nikde nevid�l.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_04"); //Musel se mi ztratit n�kde ve m�st�.
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
	description	 = 	"Tak pro� Benneta zav�eli?";
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
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_00"); //Tak pro� Benneta zav�eli?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_01"); //Za vra�du! Bennet byl obvin�n z vra�dy paladina. Takovej nesmysl. Byl jsem celou dobu s n�m.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_02"); //Tak pro� nezajde� do m�sta a celou tu v�c nevysv�tl�?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_03"); //�oupnou m� do basy jako komplice. Ne, za t�hle situace tam rozhodn� nep�jdu.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_04"); //Jak� situace?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_05"); //V�dy� v�, Onar a m�sto. To by dopadlo �patn�.

	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet pr� zavra�dil paladina. Jeho u�edn�k Hodges ale tvrd�, �e je nevinn�. Ov�em nedovolil si vstoupit do m�sta."); 
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
	description	 = 	"Co na to �oldn��i tady na farm�?";
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
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_00"); //Co na to �oldn��i tady na farm�?
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_01"); //Nev�m, co maj za lubem, ale n�kter� z nich jsou fakt vyto�en�.
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_02"); //To je pochopiteln�.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_03"); //Kdyby to bylo jen na nich, nejrad�i by hned vpadli do m�sta a dostali Benneta ven.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_04"); //Promluv si s Leem, t�eba ti n�co najde.
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




