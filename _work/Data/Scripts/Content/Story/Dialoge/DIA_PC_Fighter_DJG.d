
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

	description	 = 	"Widzę, że przyłączyłeś się do łowców smoków.";
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
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Widzę, że przyłączyłeś się do łowców smoków.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //Poszedłem z Sylviem do Górniczej Doliny, bo nikt nie zna okolicy lepiej ode mnie. Zresztą chciałem sam rozejrzeć się w sytuacji.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Wiesz, co ci powiem? Coś tu się szykuje. Pierwszy raz widzę tylu orków naraz w jednym miejscu.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Nie zdziwiłbym się, gdyby Garond i jego paladyni zostali do tej pory wybici do nogi.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Do zobaczenia!", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Co zamierzasz teraz robić?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Co zamierzasz teraz robić?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Najpierw pójdę z chłopakami do Górniczej Doliny. Potem pewnie się stąd ulotnię.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Muszę się dowiedzieć, co planują orkowie.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Do zobaczenia!
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Uważaj na siebie.
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

	description	 = 	"A więc tutaj się schowałeś!";
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
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //A więc tutaj się schowałeś!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Ty też nie dasz się tak łatwo zabić, co?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Znalazłeś coś ciekawego?";
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
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Znalazłeś coś ciekawego?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Ciągle szukam. Myślę, że coś dzieje się w starych ruinach, w górach. W nocy widać tam dziwne światła i słychać jakieś wrzaski.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Może Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Myślisz, że to sprawka smoka?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn przebywa u podnóża płaskowyżu przy fortecy orków. Dzięki temu może obserwować jednocześnie równinę i orkowe barykady."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Może Lester wrócił na swoje śmieci?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Raczej nie. O ile wiem, Lester już tam nie mieszka.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //Myślisz, że to sprawka smoka?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Bardzo możliwe. Tamten płaskowyż jest lepiej strzeżony niż królewski skarbiec, a koniec końców - to jedyna droga do fortecy.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Jakby mało było samych smoków - kręci się tam mnóstwo innego plugastwa.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Gorn twierdzi, że w starej skalnej fortecy przebywa smok."); 
	
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
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Nie przyjrzałem im się jeszcze dokładniej, ale czymkolwiek są - chodzą wyprostowane i mają łuskowatą skórę. Skaczą po skałach jak stado zębaczy w pościgu za ofiarą.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //Słyszałem parę razy, jak węszyły po okolicy. Myślę, że zajęły całą wyżynę.

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
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Obserwuję je od dłuższego czasu. Za tą ich palisadą musi się kryć coś ważnego. Myślę, że trzymają tam swoje główne siły.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //Myślisz, że jest ich tam jeszcze więcej niż tutaj?!
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //Nie zdziwiłbym się, gdyby pewnego dnia przewrócili tę swoją palisadę i zalali nas jak powódź. Nie podoba mi się to...
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Gdyby rzeczywiście ruszyli do ataku, będę musiał ostrzec Lee. On i tak chce się wynieść z tej wyspy, a w obecnej sytuacji to chyba niezły pomysł.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Pomożesz mi dostać się do fortecy?";
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
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Pomożesz mi dostać się do fortecy?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //Sam nie wiem. Boję się spuścić orków z oka, choćby na chwilę.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //Nie przesadzasz przypadkiem?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Może, ale nigdy sobie nie wybaczę, gdybym nie zdążył ostrzec pozostałych. Chociaż, z drugiej strony...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //A co mi tam! W końcu, po co tu jestem? W porządku, pomogę ci przebić się do fortecy.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Trochę ruchu mi nie zaszkodzi. Zresztą i tak chciałem się lepiej przyjrzeć tym dziwnym bestiom.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Daj mi znać, kiedy będziesz gotowy.

	B_LogEntry (TOPIC_Dragonhunter,"Gorn chce mi pomóc przedostać się do skalnej fortecy na płaskowyżu."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"Możemy ruszać!";
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
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Możemy ruszać!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Jak za dawnych czasów, co? Ale coś sobie wyjaśnijmy: to MOJA bitwa. Tym razem to JA idę z przodu!

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
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //Ha! Łatwizna! Cóż, przyjacielu, resztą musisz zająć się sam. Spuść im cięgi! Ja wrócę na swój posterunek i będę dalej obserwował orków.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //Nie ma sprawy! Do zobaczenia!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //No, mam nadzieję!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn powrócił na swój posterunek. Zamierza nadal obserwować poczynania orków."); 

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

	description	 = 	"Kamienny smok nie żyje!";	
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
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Kamienny smok nie żyje!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Od jakiegoś czasu nie słyszę żadnych wrzasków. Byłeś w fortecy?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Tak!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ha, ha! Tak myślałem. Po tobie nie zostaje nawet kamień na kamieniu!
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Co zamierzasz robić dalej?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Zostanę tu jeszcze trochę, a potem wrócę do Lee. Może spotkamy się u niego!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Mam już dość tej okolicy. Najwyższa pora zwijać manatki.
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











