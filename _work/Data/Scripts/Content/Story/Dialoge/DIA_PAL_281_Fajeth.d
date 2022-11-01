FUNC INT C_SnapperDeath()
{
	if  Npc_IsDead(NewMine_Snapper1) 
	&& 	Npc_IsDead(NewMine_Snapper2)
	&& 	Npc_IsDead(NewMine_Snapper3)
	&& 	Npc_IsDead(NewMine_Snapper4)
	&& 	Npc_IsDead(NewMine_Snapper5)
	&& 	Npc_IsDead(NewMine_Snapper6)
	&& 	Npc_IsDead(NewMine_Snapper7)
	&& 	Npc_IsDead(NewMine_Snapper8)
	{
		return TRUE;
	}; 

};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fajeth_EXIT   (C_INFO)
{
	npc         = PAL_281_Fajeth;
	nr          = 999;
	condition   = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

/* 
	Seit einiger Zeit suchen wir in diesem verfluchten Gebiet eine Stelle, die noch erzhaltiges Gestein enthält, 
	nicht ständig von Orkpatroullien heimgesucht wird, wo die dauernden Drachenangriffe ausbleiben!
	Wir sind völlig verdreckt und ausgehungert, haben unzählige Kämpfe ausgetragen 
	und haben endlich hier den Funken einer Hoffnung gefunden bei diesem dreckigen Loch in der Erde dort drüben unseren praktisch unmöglichen Auftrag zu erledigen.
	Und da kommt einer wie du daher und besitzt die Frechheit uns zu sagen, wir seien überfällig! Entweder bist du völlig verrückt oder einfach nur unverschämt!
*/
///////////////////////////////////////////////////////////////////////	
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_First		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_First_Condition;
	information	 = 	DIA_Fajeth_First_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_First_Condition ()
{
	if (Garond.aivar[AIV_TalkedToPlayer] == FALSE) 
	{
			return TRUE;
	};
};
func void DIA_Fajeth_First_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Kim jesteś i co tutaj robisz?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Przybywam z rozkazu Lorda Hagena...
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //Sądzę, że powinieneś spróbować dotrzeć do zamku. Przebywa tam kapitan Garond, głównodowodzący tej ekspedycji.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Hallo		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Hallo_Condition;
	information	 = 	DIA_Fajeth_Hallo_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_Hallo_Condition ()
{
	if (MIS_ScoutMine == LOG_RUNNING) 
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //Skąd przybywasz?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Jestem tutaj w imieniu Garonda...
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //Dobrze. Potrzebujemy nowych rąk do pracy.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Nie przybyłem tu pomagać w wydobyciu.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //Nie? A po co?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //Kazano mi dowiedzieć się, ile rudy zdołaliście wydobyć.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Wielki magu, twoja obecność napełnia mnie i moich ludzi odwagą.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Z pewnością mógłbyś nam pomóc, gdybyś zechciał użyć mocy, którą obdarzył cię Innos.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mogę dla ciebie zrobić?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Moja misja jest ważniejsza.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //Moje zadanie polega na wydobywaniu rudy i chronieniu naszych zapasów.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //Do tego potrzebuję ludzi. Jesteś sługą Innosa - a zatem musisz słuchać moich poleceń.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mogę dla ciebie zrobić?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ale ja otrzymałem już rozkazy i to od Garonda.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //Słuchaj, nie wiem, czemu Garond przysłał tu najemnika, ale z pewnością miał w tym jakiś cel.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Zanim cię odeślę, chciałbym ci zlecić jedno zadanie.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Wszystko ma swoją cenę.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nie, nie mam czasu...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Co mogę dla ciebie zrobić?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Horda zębaczy już od dawna grasuje w tej okolicy. Ostatnio krążą dookoła naszego obozu, jakby czekając na okazję do ataku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Nie wiem dokładnie, o co może im chodzić, ale dopóki tu są, w obozie nie zapanuje spokój.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Najwięcej problemów sprawia Fed. Nie dość, że sam jest śmiertelnie przerażony, to jeszcze rozsiewa panikę wśród pozostałych skazańców.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Bilgot też się do niczego nie nadaje.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //Tengron co prawda potrafi walczyć, ale brakuje mu sprytu.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Chcę, żebyś znalazł te bestie i zabił je. Tylko ty możesz podjąć się tego zadania.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth kazał mi się zająć zębaczami, które już od jakiegoś czasu krążą w okolicach obozu.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //Moja misja jest ważniejsza. Nie mogę ci pomóc.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Oczywiście, o wielki. Odpowiem na wszystkie twoje pytania.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //Ale ja otrzymałem już rozkazy i to od Garonda.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //I wypełnisz je. Ale dopiero po tym, jak cię odprawię.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Od tej chwili odzywasz się tylko po to, żeby zapytać: 'Co mogę dla pana zrobić?' Jasne?!
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Wszystko ma swoją cenę. Jeśli mi zapłacisz, może się nad tym zastanowię.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Nie jestem przyzwyczajony do ubijania interesów z najemnikami. Nie znoszę się targować.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Jednak na znak mojej przychylności zapłacę ci za twoją pracę 100 sztuk złota.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //Zgoda?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mogę dla ciebie zrobić?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nie, nie mam czasu...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //Nie, nie mam czasu zajmować się waszym problemem.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Gardzisz łatwym zarobkiem? Nigdy bym się tego nie spodziewał po najemniku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Ale skoro nie chcesz nam pomóc, to pytaj, o co chcesz, i wynoś się stąd jak najszybciej.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
///////////////////////////////////////////////////////////////////////	
//	Info Leader
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Leader		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Leader_Condition;
	information	 = 	DIA_Fajeth_Leader_Info;
	permanent 	 =  FALSE;
	description	 =  "Zabiłem przywódcę stada.";
};
func int DIA_Fajeth_Leader_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER) 
  	&&  Npc_IsDead(NewMine_LeadSnapper) 
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
			return TRUE;
	};
};
func void DIA_Fajeth_Leader_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Zabiłem przywódcę stada.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Dobrze. Pozbawione przywódcy bestie nie są nawet w połowie tak groźne. Nie sądzę, żeby miały nas jeszcze zaatakować.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Oto twoje złoto, zgodnie z umową.
		B_GiveInvItems (self, other, ItMi_Gold,100); 
	};
	
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
		
		
};
///////////////////////////////////////////////////////////////////////
//	Info SNAPPER_Killed
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_SNAPPER_KILLED		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_SNAPPER_KILLED_Condition;
	information	 = 	DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent	 = 	TRUE;
	description	 = 	"Zębacze już nie sprawią wam problemów.";
};

func int DIA_Fajeth_SNAPPER_KILLED_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	&& (C_SnapperDeath() == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_SNAPPER_KILLED_Info ()
{
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //Zębacze już nie sprawią wam problemów.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Dobra robota. Powinniśmy poradzić sobie z resztą tych bestii.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Zasługujesz na nagrodę - oto 100 sztuk złota, tak jak się umawialiśmy.
		B_GiveInvItems (self, other, ItmI_Gold,100); 
	};					
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
};
///////////////////////////////////////////////////////////////////////
//	Info Running
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Running		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Running_Condition;
	information	 = 	DIA_Fajeth_Running_Info;
	permanent	 =  TRUE;
	description  =  "Jak tam morale twoich ludzi?";
};

func int DIA_Fajeth_Running_Condition ()
{
	if  (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Running_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Running_15_00"); //Jak tam morale twoich ludzi?
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Naprawdę chcesz wiedzieć? Są tak przerażeni, że w ogóle nie nadają się do pracy!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Załatw jakoś ten problem z zębaczami albo czekają nas poważne kłopoty!
};
///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_BELOHNUNG		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	3;	
	condition	 = 	DIA_Fajeth_BELOHNUNG_Condition;
	information	 = 	DIA_Fajeth_BELOHNUNG_Info;
	permanent	 =  FALSE;
	description	 = 	"Powiedz mi, ile rudy udało wam się wydobyć do tej pory.";
};

func int DIA_Fajeth_BELOHNUNG_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	|| (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Powiedz mi, ile rudy udało wam się wydobyć do tej pory.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Zamelduj Garondowi, że udało nam się wydobyć jedynie DWIE skrzynie rudy.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Z powodu ciągłych ataków poniosłem spore straty.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Jeśli Garond przyśle mi więcej ludzi, będziemy mogli dalej wydobywać rudę.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Rozumiem. Zawiadomię go.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Dobrze. Reszta należy do ciebie. My postaramy się jak najdłużej utrzymać pozycje.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Górnicy Fajetha wydobyli do tej pory DWIE skrzynie rudy.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Perm2		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Perm2_Condition;
	information	 = 	DIA_Fajeth_Perm2_Info;
	permanent	 =  TRUE;
	description  =  "Jak idzie produkcja rudy?";
};

func int DIA_Fajeth_Perm2_Condition ()
{
	if  Npc_KnowsInfo (other,DIA_Fajeth_BELOHNUNG)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Perm2_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Perm2_15_00"); //Jak idzie produkcja rudy?
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Nie za dobrze. Czynimy niewielkie postępy.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Kiedy tu przybyliśmy, szło nam znacznie lepiej, jednak ostatnio moi chłopcy wydobywają same odłamki. Nic, co mogłoby nam się przydać.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Ale nie poddamy się - przynajmniej dopóki ja tutaj dowodzę.
};
//#####################################################################
//##
//##
//##							KAPITEL 3 und höher
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Erzabbau
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_ERZABBAU		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr			 = 	11;
	condition	 = 	DIA_Fajeth_ERZABBAU_Condition;
	information	 = 	DIA_Fajeth_ERZABBAU_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak idzie wydobycie?";
};

func int DIA_Fajeth_ERZABBAU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Fajeth_BELOHNUNG))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_00"); //Jak idzie wydobycie?
	
	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //Ostatnio zrobiło się tu trochę ciszej. Zastanawiam się dlaczego.
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Wszystkie smoki nie żyją.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //Mam nadzieję, że wkrótce nas ktoś zastąpi. Powoli popadam tu w obłęd.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_04"); //Sam zobacz. Beznadziejnie.
	};
};





// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fajeth_PICKPOCKET (C_INFO)
{
	npc			= PAL_281_Fajeth;
	nr			= 900;
	condition	= DIA_Fajeth_PICKPOCKET_Condition;
	information	= DIA_Fajeth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Fajeth_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Fajeth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_BACK 		,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};
	
func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};


