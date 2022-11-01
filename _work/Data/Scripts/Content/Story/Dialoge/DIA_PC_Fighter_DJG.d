
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornDJG_EXIT(C_INFO)
{
	npc		= PC_Fighter_DJG;
	nr		= 999;
	condition	= DIA_GornDJG_EXIT_Condition;
	information	= DIA_GornDJG_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornDJG_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_STARTCAMP_Condition;
	information	 = 	DIA_GornDJG_STARTCAMP_Info;

	description	 = 	"Vedo che ti sei unito ai cacciatori di draghi.";
};

func int DIA_GornDJG_STARTCAMP_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_STARTCAMP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Vedo che ti sei unito ai cacciatori di draghi.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //Ho seguito Silvio nella Valle delle Miniere, visto che conosco molto bene la zona e volevo capire meglio la situazione.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Ti dirò, qualcuno sta architettando qualcosa qui. Non ho mai visto così tanti orchi insieme in vita mia.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Non mi stupirebbe se Garond e i paladini nel castello fossero già tutti fuggiti o morti.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Ci vediamo!", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Cosa pensi di fare, adesso?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Quali sono i tuoi piani ora?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Per prima cosa, seguirò i ragazzi alla Valle delle Miniere, poi partirò.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Devo scoprire cosa stanno architettando gli orchi.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Ci vediamo in giro.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Stai attento.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HALLO_Condition;
	information	 = 	DIA_GornDJG_HALLO_Info;

	description	 = 	"Così ti sei rifugiato qui!|";
};

func int DIA_GornDJG_HALLO_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1500) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //Dunque è qui che ti sei rintanato!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Non muori facilmente, eh?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Hai già preso qualcosa?";
};

func int DIA_GornDJG_WHATSUP_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATSUP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Hai scoperto qualcosa?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Sto ancora aspettando. Penso ci sia qualcosa lassù nelle vecchie rovine di pietra. Ci sono delle luci di notte e si sentono delle urla.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Forse Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Un drago?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn è ai piedi dell'altopiano della vecchia fortezza di roccia. In questo modo può controllare l'altopiano e la barriera degli orchi."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Forse è Lester che è tornato alle sue vecchie rovine sulla rocca?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Non può essere. Per quanto ne so, Lester non vive più lì.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //Un drago?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Probabile. L'altipiano è sorvegliato come una dannata tesoreria reale. Ahimè, è l'unica strada per la fortezza.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Come se i draghi non fossero già abbastanza. Sembra che abbiano degli altri mostri al seguito.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Secondo Gorn, un grado risiede nella vecchia fortezza di roccia."); 
	
	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATMONSTERS_Condition;
	information	 = 	DIA_GornDJG_WHATMONSTERS_Info;

	description	 = 	"Che tipo di mostri sono?";
};

func int DIA_GornDJG_WHATMONSTERS_Condition ()
{
	if (GornDJG_WhatMonsters == TRUE)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATMONSTERS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //Che tipo di mostri?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Non sono riuscito a capirlo, ma camminano eretti e hanno la pelle squamosa. Si muovono tra le rocce come degli squartatori che hanno fiutato la preda.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //Posso sentirli respirare e sbuffare chiaramente da qui. Penso abbiano occupato l'intero altopiano lassù.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"E gli orchi?";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //Che mi dici degli orchi?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Li ho tenuti d'occhio a lungo. La barricata che hanno costruito laggiù deve nascondere qualcosa. Sospetto che orde di essi si stiano riunendo là dietro.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //Vuoi dire, altri ANCORA oltre a quelli che sono già qui?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //Non mi stupirebbe se un giorno abbattessero la palizzata e inondassero la valle. Ho un brutto presentimento al riguardo.
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Se dovesse accadere, dovrei tornare ad avvertire Lee. Egli vuole comunque lasciare l'isola. In tal caso, sarebbe veramente l'ora.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Puoi aiutarmi a entrare nella fortezza?";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
		&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
		&& ((Npc_IsDead(RockDragon))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Puoi aiutarmi a entrare nella fortezza?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //Non saprei, temo che gli orchi potrebbero attaccare mentre non guardo.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //Non essere paranoico!
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Non posso farci niente. Non me la perdonerei mai se arrivassi troppo tardi, capisci? D'altra parte...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //Al diavolo! Perché mai sono qui? Cambiamo il piano e apriamoci la strada verso la fortezza.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Un po' di esercizio non farà male. Inoltre, voglio dare un'occhiata a quelle bestiacce lassù.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Fammi sapere quando sarai pronto.

	B_LogEntry (TOPIC_Dragonhunter,"Gorn vuole che l'aiuti ad arrivare alla fortezza di roccia sull'altopiano."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"All’attacco!";
};

func int DIA_GornDJG_LOSGEHTS_Condition ()
{
if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_LOSGEHTS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Attacchiamo!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Proprio come ai vecchi tempi, eh? Ma lascia che ti dica una cosa: questa è la mia battaglia, andrò io per primo!

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"RunToRockRuinBridge"); 
};




///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_BISHIERHIN_Condition;
	information	 = 	DIA_GornDJG_BISHIERHIN_Info;
	important	 = 	TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition ()
{
	if (Npc_GetDistToWP(self,"LOCATION_19_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_BISHIERHIN_Info ()
{
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //È stato un gioco da ragazzi. Dunque, amico mio, dovrai occuparti da solo del resto. Fagliela sudare! Io tornerò indietro e terrò d'occhio gli orchi.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //Nessun problema. Ci vediamo!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //Lo spero!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn è tornato al suo posto di guardia. Vuole continuare a controllare gli orchi."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"Il drago di pietra è morto!";	
};

func int DIA_GornDJG_DRAGONDEAD_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
		&& (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1000)
		&&  ((Npc_IsDead(RockDragon))== TRUE)
		)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_DRAGONDEAD_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Il drago di pietra è morto!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Non sento più urla! Sei stato alla fortezza di pietra?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Sì!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ah ah, lo sapevo. Dovunque tu vada, non rimarrà in piedi neanche una pietra.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Cosa farai ora?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Rimarrò ancora un po', poi tornerò da Lee. Forse ci incontreremo ancora lì!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Sono stanco di questa dannata zona. È ora di andarsene da questa regione.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //Ci vediamo!
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DJG;
	nr			= 900;
	condition	= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 35);
};
 
FUNC VOID DIA_Fighter_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};











