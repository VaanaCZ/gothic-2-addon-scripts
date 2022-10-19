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
	Seit einiger Zeit suchen wir in diesem verfluchten Gebiet eine Stelle, die noch erzhaltiges Gestein enth�lt, 
	nicht st�ndig von Orkpatroullien heimgesucht wird, wo die dauernden Drachenangriffe ausbleiben!
	Wir sind v�llig verdreckt und ausgehungert, haben unz�hlige K�mpfe ausgetragen 
	und haben endlich hier den Funken einer Hoffnung gefunden bei diesem dreckigen Loch in der Erde dort dr�ben unseren praktisch unm�glichen Auftrag zu erledigen.
	Und da kommt einer wie du daher und besitzt die Frechheit uns zu sagen, wir seien �berf�llig! Entweder bist du v�llig verr�ckt oder einfach nur unversch�mt!
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
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Kim jeste� i co tutaj robisz?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Przybywam z rozkazu Lorda Hagena...
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //S�dz�, �e powiniene� spr�bowa� dotrze� do zamku. Przebywa tam kapitan Garond, g��wnodowodz�cy tej ekspedycji.
	
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
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //Sk�d przybywasz?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Jestem tutaj w imieniu Garonda...
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //Dobrze. Potrzebujemy nowych r�k do pracy.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Nie przyby�em tu pomaga� w wydobyciu.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //Nie? A po co?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //Kazano mi dowiedzie� si�, ile rudy zdo�ali�cie wydoby�.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Wielki magu, twoja obecno�� nape�nia mnie i moich ludzi odwag�.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Z pewno�ci� m�g�by� nam pom�c, gdyby� zechcia� u�y� mocy, kt�r� obdarzy� ci� Innos.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mog� dla ciebie zrobi�?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Moja misja jest wa�niejsza.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //Moje zadanie polega na wydobywaniu rudy i chronieniu naszych zapas�w.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //Do tego potrzebuj� ludzi. Jeste� s�ug� Innosa - a zatem musisz s�ucha� moich polece�.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mog� dla ciebie zrobi�?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ale ja otrzyma�em ju� rozkazy i to od Garonda.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //S�uchaj, nie wiem, czemu Garond przys�a� tu najemnika, ale z pewno�ci� mia� w tym jaki� cel.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Zanim ci� ode�l�, chcia�bym ci zleci� jedno zadanie.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Wszystko ma swoj� cen�.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nie, nie mam czasu...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Co mog� dla ciebie zrobi�?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Horda z�baczy ju� od dawna grasuje w tej okolicy. Ostatnio kr��� dooko�a naszego obozu, jakby czekaj�c na okazj� do ataku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Nie wiem dok�adnie, o co mo�e im chodzi�, ale dop�ki tu s�, w obozie nie zapanuje spok�j.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Najwi�cej problem�w sprawia Fed. Nie do��, �e sam jest �miertelnie przera�ony, to jeszcze rozsiewa panik� w�r�d pozosta�ych skaza�c�w.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Bilgot te� si� do niczego nie nadaje.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //Tengron co prawda potrafi walczy�, ale brakuje mu sprytu.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Chc�, �eby� znalaz� te bestie i zabi� je. Tylko ty mo�esz podj�� si� tego zadania.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth kaza� mi si� zaj�� z�baczami, kt�re ju� od jakiego� czasu kr��� w okolicach obozu.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //Moja misja jest wa�niejsza. Nie mog� ci pom�c.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Oczywi�cie, o wielki. Odpowiem na wszystkie twoje pytania.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //Ale ja otrzyma�em ju� rozkazy i to od Garonda.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //I wype�nisz je. Ale dopiero po tym, jak ci� odprawi�.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Od tej chwili odzywasz si� tylko po to, �eby zapyta�: 'Co mog� dla pana zrobi�?' Jasne?!
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Wszystko ma swoj� cen�. Je�li mi zap�acisz, mo�e si� nad tym zastanowi�.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Nie jestem przyzwyczajony do ubijania interes�w z najemnikami. Nie znosz� si� targowa�.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Jednak na znak mojej przychylno�ci zap�ac� ci za twoj� prac� 100 sztuk z�ota.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //Zgoda?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mog� dla ciebie zrobi�?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nie, nie mam czasu...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //Nie, nie mam czasu zajmowa� si� waszym problemem.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Gardzisz �atwym zarobkiem? Nigdy bym si� tego nie spodziewa� po najemniku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Ale skoro nie chcesz nam pom�c, to pytaj, o co chcesz, i wyno� si� st�d jak najszybciej.
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
	description	 =  "Zabi�em przyw�dc� stada.";
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
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Zabi�em przyw�dc� stada.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Dobrze. Pozbawione przyw�dcy bestie nie s� nawet w po�owie tak gro�ne. Nie s�dz�, �eby mia�y nas jeszcze zaatakowa�.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Oto twoje z�oto, zgodnie z umow�.
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
	description	 = 	"Z�bacze ju� nie sprawi� wam problem�w.";
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
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //Z�bacze ju� nie sprawi� wam problem�w.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Dobra robota. Powinni�my poradzi� sobie z reszt� tych bestii.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Zas�ugujesz na nagrod� - oto 100 sztuk z�ota, tak jak si� umawiali�my.
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
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Naprawd� chcesz wiedzie�? S� tak przera�eni, �e w og�le nie nadaj� si� do pracy!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Za�atw jako� ten problem z z�baczami albo czekaj� nas powa�ne k�opoty!
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
	description	 = 	"Powiedz mi, ile rudy uda�o wam si� wydoby� do tej pory.";
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
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Powiedz mi, ile rudy uda�o wam si� wydoby� do tej pory.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Zamelduj Garondowi, �e uda�o nam si� wydoby� jedynie DWIE skrzynie rudy.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Z powodu ci�g�ych atak�w ponios�em spore straty.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Je�li Garond przy�le mi wi�cej ludzi, b�dziemy mogli dalej wydobywa� rud�.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Rozumiem. Zawiadomi� go.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Dobrze. Reszta nale�y do ciebie. My postaramy si� jak najd�u�ej utrzyma� pozycje.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"G�rnicy Fajetha wydobyli do tej pory DWIE skrzynie rudy.");
	
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
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Nie za dobrze. Czynimy niewielkie post�py.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Kiedy tu przybyli�my, sz�o nam znacznie lepiej, jednak ostatnio moi ch�opcy wydobywaj� same od�amki. Nic, co mog�oby nam si� przyda�.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Ale nie poddamy si� - przynajmniej dop�ki ja tutaj dowodz�.
};
//#####################################################################
//##
//##
//##							KAPITEL 3 und h�her
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
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //Ostatnio zrobi�o si� tu troch� ciszej. Zastanawiam si� dlaczego.
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Wszystkie smoki nie �yj�.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //Mam nadziej�, �e wkr�tce nas kto� zast�pi. Powoli popadam tu w ob��d.
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


