
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

	description	 = 	"Widz�, �e przy��czy�e� si� do �owc�w smok�w.";
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
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Widz�, �e przy��czy�e� si� do �owc�w smok�w.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //Poszed�em z Sylviem do G�rniczej Doliny, bo nikt nie zna okolicy lepiej ode mnie. Zreszt� chcia�em sam rozejrze� si� w sytuacji.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Wiesz, co ci powiem? Co� tu si� szykuje. Pierwszy raz widz� tylu ork�w naraz w jednym miejscu.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Nie zdziwi�bym si�, gdyby Garond i jego paladyni zostali do tej pory wybici do nogi.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Do zobaczenia!", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Co zamierzasz teraz robi�?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Co zamierzasz teraz robi�?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Najpierw p�jd� z ch�opakami do G�rniczej Doliny. Potem pewnie si� st�d ulotni�.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Musz� si� dowiedzie�, co planuj� orkowie.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Do zobaczenia!
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Uwa�aj na siebie.
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

	description	 = 	"A wi�c tutaj si� schowa�e�!";
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
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //A wi�c tutaj si� schowa�e�!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Ty te� nie dasz si� tak �atwo zabi�, co?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Znalaz�e� co� ciekawego?";
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
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Znalaz�e� co� ciekawego?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Ci�gle szukam. My�l�, �e co� dzieje si� w starych ruinach, w g�rach. W nocy wida� tam dziwne �wiat�a i s�ycha� jakie� wrzaski.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Mo�e Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "My�lisz, �e to sprawka smoka?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn przebywa u podn�a p�askowy�u przy fortecy ork�w. Dzi�ki temu mo�e obserwowa� jednocze�nie r�wnin� i orkowe barykady."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Mo�e Lester wr�ci� na swoje �mieci?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Raczej nie. O ile wiem, Lester ju� tam nie mieszka.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //My�lisz, �e to sprawka smoka?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Bardzo mo�liwe. Tamten p�askowy� jest lepiej strze�ony ni� kr�lewski skarbiec, a koniec ko�c�w - to jedyna droga do fortecy.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Jakby ma�o by�o samych smok�w - kr�ci si� tam mn�stwo innego plugastwa.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Gorn twierdzi, �e w starej skalnej fortecy przebywa smok."); 
	
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

	description	 = 	"O czym m�wisz?";
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
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //O czym m�wisz?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Nie przyjrza�em im si� jeszcze dok�adniej, ale czymkolwiek s� - chodz� wyprostowane i maj� �uskowat� sk�r�. Skacz� po ska�ach jak stado z�baczy w po�cigu za ofiar�.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //S�ysza�em par� razy, jak w�szy�y po okolicy. My�l�, �e zaj�y ca�� wy�yn�.

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
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Obserwuj� je od d�u�szego czasu. Za t� ich palisad� musi si� kry� co� wa�nego. My�l�, �e trzymaj� tam swoje g��wne si�y.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //My�lisz, �e jest ich tam jeszcze wi�cej ni� tutaj?!
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //Nie zdziwi�bym si�, gdyby pewnego dnia przewr�cili t� swoj� palisad� i zalali nas jak pow�d�. Nie podoba mi si� to...
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Gdyby rzeczywi�cie ruszyli do ataku, b�d� musia� ostrzec Lee. On i tak chce si� wynie�� z tej wyspy, a w obecnej sytuacji to chyba niez�y pomys�.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Pomo�esz mi dosta� si� do fortecy?";
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
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Pomo�esz mi dosta� si� do fortecy?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //Sam nie wiem. Boj� si� spu�ci� ork�w z oka, cho�by na chwil�.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //Nie przesadzasz przypadkiem?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Mo�e, ale nigdy sobie nie wybacz�, gdybym nie zd��y� ostrzec pozosta�ych. Chocia�, z drugiej strony...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //A co mi tam! W ko�cu, po co tu jestem? W porz�dku, pomog� ci przebi� si� do fortecy.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Troch� ruchu mi nie zaszkodzi. Zreszt� i tak chcia�em si� lepiej przyjrze� tym dziwnym bestiom.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Daj mi zna�, kiedy b�dziesz gotowy.

	B_LogEntry (TOPIC_Dragonhunter,"Gorn chce mi pom�c przedosta� si� do skalnej fortecy na p�askowy�u."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht�s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"Mo�emy rusza�!";
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
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Mo�emy rusza�!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Jak za dawnych czas�w, co? Ale co� sobie wyja�nijmy: to MOJA bitwa. Tym razem to JA id� z przodu!

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
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //Ha! �atwizna! C�, przyjacielu, reszt� musisz zaj�� si� sam. Spu�� im ci�gi! Ja wr�c� na sw�j posterunek i b�d� dalej obserwowa� ork�w.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //Nie ma sprawy! Do zobaczenia!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //No, mam nadziej�!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn powr�ci� na sw�j posterunek. Zamierza nadal obserwowa� poczynania ork�w."); 

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

	description	 = 	"Kamienny smok nie �yje!";	
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
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Kamienny smok nie �yje!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Od jakiego� czasu nie s�ysz� �adnych wrzask�w. By�e� w fortecy?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Tak!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ha, ha! Tak my�la�em. Po tobie nie zostaje nawet kamie� na kamieniu!
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Co zamierzasz robi� dalej?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Zostan� tu jeszcze troch�, a potem wr�c� do Lee. Mo�e spotkamy si� u niego!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Mam ju� do�� tej okolicy. Najwy�sza pora zwija� manatki.
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











