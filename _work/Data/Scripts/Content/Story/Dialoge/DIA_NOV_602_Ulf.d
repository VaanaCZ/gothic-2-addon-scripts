///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulf_EXIT   (C_INFO)
{
	npc         = NOV_602_Ulf;
	nr          = 999;
	condition   = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info YOU
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Hallo		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	2;
	condition	 = 	DIA_Ulf_Hallo_Condition;
	information	 = 	DIA_Ulf_Hallo_Info;
	permanent	 =  FALSE;
	description	 = 	"Co tu porabiasz?";
};

func int DIA_Ulf_Hallo_Condition ()
{
	if (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	&& (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};	
};
func void DIA_Ulf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //Co tu porabiasz?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //Staram si� jak najlepiej wykona� zadania zlecone mi przez klasztor.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Jestem nowicjuszem w klasztorze. Wykonuj� zlecenia mag�w i pladyn�w.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //W�a�nie dostarczy�em trzem karczmarzom w mie�cie wino z klasztoru.
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Wirte
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Wirte		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Wirte_Condition;
	information	 = 	DIA_Ulf_Wirte_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kim s� w�a�ciciele trzech knajp?";
};

func int DIA_Ulf_Wirte_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Wirte_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Kim s� ci trzej karczmarze?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Jednym z nich jest ten mi�y cz�owiek za barem.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Drugim jest Caragon, prowadz�cy tawern� na placu �wi�tynnym, trzecim za� Kardif, w�a�ciciel knajpy w dzielnicy portowej.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Kloster		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Kloster_Condition;
	information	 = 	DIA_Ulf_Kloster_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co mo�esz mi powiedzie� o klasztorze?";
};

func int DIA_Ulf_Kloster_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Kloster_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Co mo�esz mi powiedzie� o klasztorze?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //My, nowicjusze, poszukujemy o�wiecenia w modlitwie do Innosa, pod nadzorem mag�w przyswajamy te� podstawy wiary.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //S�u�ymy im, by oni mogli s�u�y� Innosowi. No i przygotowujemy si� do zjednoczenia z Ogniem.
};
///////////////////////////////////////////////////////////////////////
//	bring mich zum Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Bringen	(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	4;
	condition	 = 	DIA_Ulf_Bringen_Condition;
	information	 = 	DIA_Ulf_Bringen_Info;
	permanent	 =  FALSE;
	description	 = 	"Zabierz mnie do klasztoru.";
};

func int DIA_Ulf_Bringen_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Bringen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //Zabierz mnie do klasztoru.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Nie ma szans. Nie wiesz chyba, z iloma stworzeniami musia�em sobie poradzi�, zanim tutaj dotar�em.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Kiedy pomy�l� o tych wszystkich krwiopijcach, wilkach i goblinach, to si� ciesz�, �e nie musz� si� st�d rusza�.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Poza tym i tak nie wszed�by� do klasztoru.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //Dlaczego?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Wej�� tam mog� jedynie magowie, paladyni i nowicjusze.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Aufnahme		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Aufnahme_Condition;
	information	 = 	DIA_Ulf_Aufnahme_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak mog� zosta� nowicjuszem?";
};

func int DIA_Ulf_Aufnahme_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Bringen)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Aufnahme_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Jak mog� zosta� nowicjuszem?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Kiedy cz�owiek czuje g��bok� wewn�trzn� potrzeb�...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Hej - powiedz mi tylko, jakie musz� spe�ni� warunki!
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Potrzebujesz dar�w. Owcy i...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Aby zosta� nowicjuszem w klasztorze Innosa, b�d� potrzebowa� owcy i 1000 sztuk z�ota.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Gold		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	8;
	condition	 = 	DIA_Ulf_Gold_Condition;
	information	 = 	DIA_Ulf_Gold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Sk�d mam wzi�� tyle z�ota?";
};

func int DIA_Ulf_Gold_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Gold_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Sk�d mam wzi�� tyle z�ota?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Jak mniemam, nie znasz nikogo, kto by za ciebie zap�aci�. Zatem b�dziesz je musia� zarobi�.
};
///////////////////////////////////////////////////////////////////////
//	Info Schaf
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Schaf		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Schaf_Condition;
	information	 = 	DIA_Ulf_Schaf_Info;
	permanent	 = 	FALSE;
	description	 = 	"Sk�d mog� wzi�� owc�?";
};

func int DIA_Ulf_Schaf_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Schaf_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //Sk�d mog� wzi�� owc�?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //Od farmer�w, oczywi�cie. Nie dostaniesz jej jednak za darmo.
	
	B_LogEntry (Topic_Kloster,"Owc� mog� zdoby� u farmer�w.");
};
///////////////////////////////////////////////////////////////////////
//	Info Suche
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Suche		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Suche_Condition;
	information	 = 	DIA_Ulf_Suche_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Ulf_Suche_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Suche_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //Hej, nie zgadniesz, co si� sta�o.
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Zosta�e� wybra�cem.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //Dok�adnie. W�a�nie mia�em napi� si� zimnego piwa, kiedy zjawi� si� Daron i oznajmi�, �e zosta�em wybra�cem.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Kto by pomy�la�? Niezbadana jest wola Innosa. Co ci� tu sprowadza?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //Za��da�em Pr�by Ognia.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //Niemo�liwe?! Cz�owieku, nie brak ci odwagi. Czy to oznacza, �e ty r�wnie� poszukujesz 'tego, co wierny znajdzie na ko�cu �cie�ki'?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //Na to wygl�da.
};
///////////////////////////////////////////////////////////////////////
//	Info Rausgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Rausgefunden		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Rausgefunden_Condition;
	information	 = 	DIA_Ulf_Rausgefunden_Info;
	permanent	 = 	FALSE;
	description  = "I co, znalaz�e� ju� co�?";
};
func int DIA_Ulf_Rausgefunden_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Rausgefunden_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //I co, znalaz�e� ju� co�?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //C�, �ledzi�em Agona - ale w pewnym momencie znikn�� mi z oczu.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //Czekaj... Co oni tam jeszcze m�wili? Pod��aj za znakami Innosa. Nie rozumiem tylko tej cz�ci o �cie�kach...
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //C� wi�c mi pozostaje, ci�gle szukam.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "FOLLOW");
	
};
///////////////////////////////////////////////////////////////////////
//	Info Folgen
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Folgen		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Folgen_Condition;
	information	 = 	DIA_Ulf_Folgen_Info;
	permanent	 = 	FALSE;
	description  = "Hej, czy ty mnie �ledzisz?";
};
func int DIA_Ulf_Folgen_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Folgen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //Hej, czy ty mnie �ledzisz?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Nonsens. Zmierzam po prostu w tym samym kierunku.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Stop		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Stop_Condition;
	information	 = 	DIA_Ulf_Stop_Info;
	permanent	 = 	FALSE;
	description  = "Przesta� za mn� �azi�.";
};
func int DIA_Ulf_Stop_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Folgen)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Stop_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //Przesta� za mn� �azi�.
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //Nie �a�� za tob�. Ale prosz�, je�li to ma ci� uspokoi�, p�jd� inn� �cie�k�.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SUCHE");
};
///////////////////////////////////////////////////////////////////////
//	Info Abrechnung
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Abrechnung		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Abrechnung_Condition;
	information	 = 	DIA_Ulf_Abrechnung_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};	
func int DIA_Ulf_Abrechnung_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems (other, ItmI_RuneBlank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Abrechnung_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Wi�c znowu si� spotykamy. Ostatnio sporo rozmy�la�em. Odczuwam siln� ch�� zostania magiem.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Cz�owieku - nie r�b tego...
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Nie mam wyboru. �ycie nowicjusza - to nie dla mnie.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Musz� zosta� magiem. Wtedy wszystko zacznie si� uk�ada�. Teraz za� odbior� to, co mi si� nale�y.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //Masz jakie� ostatnie �yczenie?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Daj spok�j, nie chc� ci� zabija�.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Koniec gadania - musz� wraca� do klasztoru.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Masz co� do palenia?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //Daj spok�j, nie chc� ci� zabija�.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Gadaj zdr�w. Zdajesz sobie chyba spraw� z tego, �e nie masz ze mn� szans.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Koniec gadania - musz� wraca� do klasztoru.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //Nigdzie nie p�jdziesz!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Masz co� do palenia?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //Masz szcz�cie. Tak si� sk�ada, �e akurat mam co� przy sobie.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Miejmy to ju� za sob�.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Troll		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Troll_Condition;
	information	 = 	DIA_Ulf_Troll_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};
func int DIA_Ulf_Troll_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	&& ((Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_14") <= 1000)
	|| (Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_15") <= 1000))
	{
		return TRUE;
	};
};
func void DIA_Ulf_Troll_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //Hej, jeste� pewien, �e idziemy we w�a�ciwym kierunku? Podobno gdzie� tam mieszka troll.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Chyba lepiej uda� si� w innym kierunku.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"WAIT");
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulf_PICKPOCKET (C_INFO)
{
	npc			= NOV_602_Ulf;
	nr			= 900;
	condition	= DIA_Ulf_PICKPOCKET_Condition;
	information	= DIA_Ulf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ulf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 50);
};
 
FUNC VOID DIA_Ulf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulf_PICKPOCKET);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_BACK 		,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};
	
func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};











