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
	AI_Output (self, other, "DIA_Hodges_HALLO_03_01"); //Nie chcia³bym, ¿ebyœ to odebra³ w niew³aœciwy sposób, ale nie mam teraz ochoty na pogawêdkê - jestem zupe³nie wykoñczony.
	AI_Output (other, self, "DIA_Hodges_HALLO_15_02"); //Masz strasznie du¿o pracy, co?
	AI_Output (self, other, "DIA_Hodges_HALLO_03_03"); //Racja. Bennet wyrabia tyle broni, ¿e ledwie nad¹¿am z jej polerowaniem.
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
	description	 = 	"Co mo¿esz mi powiedzieæ o farmie?";
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
	AI_Output (other,self ,"DIA_Hodges_TellAboutFarm_15_00"); //Co mo¿esz mi powiedzieæ o farmie?
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_01"); //To jest farma Onara.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_02"); //A ten du¿y budynek to jego dom. Jedno skrzyd³o zajmuj¹ najemnicy.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_03"); //Odk¹d siê sprowadzili, my, farmerzy, musimy mieszkaæ w stodole.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_04"); //Ale mi to nie przeszkadza, to dobrze, ¿e ktoœ pilnuje farmy.
	
	if (Npc_GetDistToWP (self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_05"); //Ten budynek to kuchnia.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_06"); //Kuchnia znajduje siê na ty³ach kuŸni.
	};
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_07"); //Przy odrobinie szczêœcia mo¿e za³apiesz siê na coœ do jedzenia.
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
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_01"); //Onar wynaj¹³ ich, ¿eby obroniæ siê przed stra¿¹.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_02"); //Najemnicy chroni¹ tak¿e farmê, trzodê i farmerów.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_03"); //Wiêc ¿eby ci nie przysz³o do g³owy coœ ukraœæ.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_04"); //Oni tylko czekaj¹ na pretekst, ¿eby ciê zbiæ na kwaœne jab³ko.
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
	description	= "Mogê od ciebie kupiæ broñ?";
	trade		= TRUE;
};

func int DIA_Hodges_TRADE_Condition ()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info ()
{	
	AI_Output (other, self ,"DIA_Hodges_TRADE_15_00"); //Mogê kupiæ u ciebie jak¹œ broñ?
	AI_Output (self, other, "DIA_Hodges_TRADE_03_01"); //Wybór jest doœæ ubogi. Wiêkszoœæ mieczy i toporów trafia do Onara.
	
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
	AI_Output (self ,other,"DIA_Hodges_DontWork_03_01"); //Jeszcze nie s³ysza³eœ? Paladyni aresztowali Benneta.

	MIS_RescueBennet = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Kowal Bennet zosta³ aresztowany w mieœcie przez paladynów."); 

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
	description	 = 	"Co siê sta³o?";
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
	AI_Output (other,self ,"DIA_Hodges_WhatHappened_15_00"); //Co siê sta³o?
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_01"); //Byliœmy na zakupach w mieœcie, kiedy nagle us³yszeliœmy krzyk: 'Tu s¹, pojmaæ ich!'
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_02"); //O rany, ale siê przestraszy³em! Ucieka³em, jakby œciga³o mnie ca³e stado demonów.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_03"); //Bennet by³ tu¿ za mn¹. Nie wiem, co siê sta³o, ale kiedy dotar³em do bram miasta, jego ju¿ nie by³o.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_04"); //Musia³ siê zgubiæ gdzieœ po drodze.
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
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_01"); //Morderstwo! Podobno zabi³ paladyna. Co za wierutna bzdura! Przez ca³y czas by³ tu¿ obok mnie.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_02"); //Wiêc dlaczego nie pójdziesz do miasta i nie wyjaœnisz ca³ej sprawy?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_03"); //Zamknêliby mnie do pud³a jako jego wspólnika. Szczególnie w obecnej sytuacji.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_04"); //Sytuacji?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_05"); //No wiesz, Onar. To siê musia³o tak skoñczyæ.

	B_LogEntry (TOPIC_RESCUEBENNET,"Podobno Bennet zamordowa³ paladyna. Jego czeladnik Hodges twierdzi, ¿e to nieprawda, jednak boi siê oœwiadczyæ to w mieœcie."); 
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
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_01"); //Oczywiœcie nie wiem dok³adnie, co zamierzaj¹, ale niektórzy z nich s¹ naprawdê wkurzeni.
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_02"); //Domyœlam siê.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_03"); //Gdyby to zale¿a³o od nich, natychmiast zaatakowaliby miasto, ¿eby odbiæ Benneta.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_04"); //Porozmawiaj z Lee, mo¿e coœ da siê zrobiæ.
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




