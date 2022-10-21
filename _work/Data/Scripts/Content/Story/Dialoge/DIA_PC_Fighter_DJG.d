
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

	description	 = 	"Widzê, ¿e przy³¹czy³eœ siê do ³owców smoków.";
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
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Widzê, ¿e przy³¹czy³eœ siê do ³owców smoków.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //Poszed³em z Sylviem do Górniczej Doliny, bo nikt nie zna okolicy lepiej ode mnie. Zreszt¹ chcia³em sam rozejrzeæ siê w sytuacji.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Wiesz, co ci powiem? Coœ tu siê szykuje. Pierwszy raz widzê tylu orków naraz w jednym miejscu.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Nie zdziwi³bym siê, gdyby Garond i jego paladyni zostali do tej pory wybici do nogi.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Do zobaczenia!", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Co zamierzasz teraz robiæ?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Co zamierzasz teraz robiæ?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Najpierw pójdê z ch³opakami do Górniczej Doliny. Potem pewnie siê st¹d ulotniê.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Muszê siê dowiedzieæ, co planuj¹ orkowie.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Do zobaczenia!
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Uwa¿aj na siebie.
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

	description	 = 	"A wiêc tutaj siê schowa³eœ!";
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
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //A wiêc tutaj siê schowa³eœ!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Ty te¿ nie dasz siê tak ³atwo zabiæ, co?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Znalaz³eœ coœ ciekawego?";
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
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Znalaz³eœ coœ ciekawego?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Ci¹gle szukam. Myœlê, ¿e coœ dzieje siê w starych ruinach, w górach. W nocy widaæ tam dziwne œwiat³a i s³ychaæ jakieœ wrzaski.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Mo¿e Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Myœlisz, ¿e to sprawka smoka?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn przebywa u podnó¿a p³askowy¿u przy fortecy orków. Dziêki temu mo¿e obserwowaæ jednoczeœnie równinê i orkowe barykady."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Mo¿e Lester wróci³ na swoje œmieci?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Raczej nie. O ile wiem, Lester ju¿ tam nie mieszka.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //Myœlisz, ¿e to sprawka smoka?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Bardzo mo¿liwe. Tamten p³askowy¿ jest lepiej strze¿ony ni¿ królewski skarbiec, a koniec koñców - to jedyna droga do fortecy.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Jakby ma³o by³o samych smoków - krêci siê tam mnóstwo innego plugastwa.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Gorn twierdzi, ¿e w starej skalnej fortecy przebywa smok."); 
	
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

	description	 = 	"O czym mówisz?";
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
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //O czym mówisz?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Nie przyjrza³em im siê jeszcze dok³adniej, ale czymkolwiek s¹ - chodz¹ wyprostowane i maj¹ ³uskowat¹ skórê. Skacz¹ po ska³ach jak stado zêbaczy w poœcigu za ofiar¹.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //S³ysza³em parê razy, jak wêszy³y po okolicy. Myœlê, ¿e zajê³y ca³¹ wy¿ynê.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"A co z orkami?";
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
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //A co z orkami?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Obserwujê je od d³u¿szego czasu. Za t¹ ich palisad¹ musi siê kryæ coœ wa¿nego. Myœlê, ¿e trzymaj¹ tam swoje g³ówne si³y.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //Myœlisz, ¿e jest ich tam jeszcze wiêcej ni¿ tutaj?!
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //Nie zdziwi³bym siê, gdyby pewnego dnia przewrócili tê swoj¹ palisadê i zalali nas jak powódŸ. Nie podoba mi siê to...
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Gdyby rzeczywiœcie ruszyli do ataku, bêdê musia³ ostrzec Lee. On i tak chce siê wynieœæ z tej wyspy, a w obecnej sytuacji to chyba niez³y pomys³.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Pomo¿esz mi dostaæ siê do fortecy?";
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
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Pomo¿esz mi dostaæ siê do fortecy?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //Sam nie wiem. Bojê siê spuœciæ orków z oka, choæby na chwilê.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //Nie przesadzasz przypadkiem?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Mo¿e, ale nigdy sobie nie wybaczê, gdybym nie zd¹¿y³ ostrzec pozosta³ych. Chocia¿, z drugiej strony...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //A co mi tam! W koñcu, po co tu jestem? W porz¹dku, pomogê ci przebiæ siê do fortecy.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Trochê ruchu mi nie zaszkodzi. Zreszt¹ i tak chcia³em siê lepiej przyjrzeæ tym dziwnym bestiom.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Daj mi znaæ, kiedy bêdziesz gotowy.

	B_LogEntry (TOPIC_Dragonhunter,"Gorn chce mi pomóc przedostaæ siê do skalnej fortecy na p³askowy¿u."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"Mo¿emy ruszaæ!";
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
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Mo¿emy ruszaæ!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Jak za dawnych czasów, co? Ale coœ sobie wyjaœnijmy: to MOJA bitwa. Tym razem to JA idê z przodu!

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
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //Ha! £atwizna! Có¿, przyjacielu, reszt¹ musisz zaj¹æ siê sam. Spuœæ im ciêgi! Ja wrócê na swój posterunek i bêdê dalej obserwowa³ orków.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //Nie ma sprawy! Do zobaczenia!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //No, mam nadziejê!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn powróci³ na swój posterunek. Zamierza nadal obserwowaæ poczynania orków."); 

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

	description	 = 	"Kamienny smok nie ¿yje!";	
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
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Kamienny smok nie ¿yje!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Od jakiegoœ czasu nie s³yszê ¿adnych wrzasków. By³eœ w fortecy?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Tak!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ha, ha! Tak myœla³em. Po tobie nie zostaje nawet kamieñ na kamieniu!
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Co zamierzasz robiæ dalej?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Zostanê tu jeszcze trochê, a potem wrócê do Lee. Mo¿e spotkamy siê u niego!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Mam ju¿ doœæ tej okolicy. Najwy¿sza pora zwijaæ manatki.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //Na razie!
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











