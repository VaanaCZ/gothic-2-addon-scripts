
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

	description	 = 	"Vidím, že ses pøidal k drakobijcùm.";
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
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Vidím, že ses pøidal k drakobijcùm.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //Šel jsem se Sylviem do Hornického údolí, protože se tady vyznám ze všech nejlépe a chtìl jsem si udìlat pøesnou pøedstavu o zdejší situaci.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Jedno ti povím. Nìco se tu chystá. Ještì nikdy jsem nevidìl tolik skøetù na jednom místì.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Nedivil bych se, kdyby touhle dobou Garond a všichni paladini z hradu už neutekli nebo nebyli rozsekaní na kousky.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Uvidíme se.", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Co budeš dìlat teï?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Co chceš dìlat?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Nejdøív pùjdu tady s chlapci do Hornického údolí a pak vyrazím.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Rozhodnì musím zjistit, co mají skøeti za lubem.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Uvidíme se.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Dávej na sebe pozor.
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

	description	 = 	"Tak tady ses zašil!";
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
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //Takže tady ses zašil!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Není tak snadné se zabít, co?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Už jsi nìco chytil?";
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
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Už jsi nìco chytil?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Poøád èekám. Øekl bych, že tam v tìch skalních troskách nìco je. V noci se tam svítí a jsou dokonce slyšet nìjaké skøeky.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Že by Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Drak?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn hlídkuje na úpatí plošiny u staré kamenné pevnosti. Tak mùže dobøe pozorovat nejen ji, ale i skøetí opevnìní."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Možná to je Lester, který se vrátil do svých rozvalin?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //To tìžko. Co vím, Lester tu už nežije.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //Drak?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Dost možná. Ta planina je støežená jako nìjaká mizerná královská pokladnice. Ale je to bohužel jediná cesta k pevnosti.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Jako by nestaèilo, že jsou draci dost nepøíjemní sami o sobì. Vypadá to, že mají v záloze ještì pár dalších pøíšer.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Podle Gorna se ve staré kamenné pevnosti usadil drak."); 
	
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

	description	 = 	"Jaké pøíšery to jsou?";
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
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //Jaké pøíšery to jsou?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Nevím to úplnì pøesnì, ale chodí vzpøímenì a mají šupinatou kùži. Pohybují se po skalách jako chòapavci, kteøí vycítili obì.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //Tady dole je slyším funìt a supìt. Øekl bych, že zabrali úplnì celou planinu.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"A co skøeti?";
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
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //A co skøeti?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Chvíli jsem je sledoval. Za tou ohradou dole se musí nìco ukrývat. Mám podezøení, že se jich tam shromáždil už pìkný zástup.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //Tím chceš øíct, že jich tam je VÍC než tady?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //Nepøekvapilo by mì, kdyby jednoho dne tu palisádu strhli a zaplavili celou zemi. Vùbec se mi to nechce líbit.
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Pokud se to stane, budu se muset vrátit a varovat Leeho. Stejnì se chce z ostrova zdekovat. Pak bude nejvyšší èas.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Mùžeš mi pomoci dostat se do pevnosti?";
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
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Mùžeš mi pomoci dostat se do pevnosti?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //To vážnì nevím. Bojím se, že skøeti zaútoèí pøesnì ve chvíli, kdy je pustím z oèí.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //To je paranoidní!
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Nemùžu si pomoct. Víš, nikdy bych si neodpustil, kdybych pøišel pozdì. Na druhou stranu...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //Vždy je to jedno! Proè jinak bych tady byl? Zaútoème na planinu a prosekejme si cestu do pevnosti.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Troška pohybu nám neuškodí. Kromì toho bych se docela rád podíval na ty bestie víc zblízka.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Dej mi vìdìt, až budeš pøipraven!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn mi chce pomoci proniknout do kamenné pevnosti na planinì."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"Zaútoème!";
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
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Zaútoème!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Jako za starých èasù, co? Ale jedno ti øeknu: tohle je moje bitva. Tentokrát jdu vepøedu já!

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
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //Byla to hraèka. Tak, pøíteli, o zbytek se už budeš muset postarat ty. Poøádnì jim zatop! Já se vrátím a budu zase dávat pozor na skøety.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //Žádný problém. Ještì se uvidíme!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //To doufám!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn se vrátil zpìt na své pozorovací stanovištì. Chce i nadále sledovat skøety."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Zaèít");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"Drak ze skal je mrtvý!";	
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
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Drak ze skal je mrtvý!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Neslyším žádné další skøeky! Byl jsi v té skalní pevnosti?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Ano!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ha, ha! To jsem si domyslel. Kdekoliv se objevíš, nezùstane kámen na kameni.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Co budeš dìlat dál?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Ještì chvíli tu zùstanu a pak se vrátím k Leeovi. Možná se tam zase setkáme!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Celá tahle krajina mi zaèíná lézt na nervy. Už je naèase, abychom odsud vypadli.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //Uvidíme se pozdìji!
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











