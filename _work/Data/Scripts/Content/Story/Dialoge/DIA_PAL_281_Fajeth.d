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
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Kim jesteœ i co tutaj robisz?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Przybywam z rozkazu Lorda Hagena...
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //S¹dzê, ¿e powinieneœ spróbowaæ dotrzeæ do zamku. Przebywa tam kapitan Garond, g³ównodowodz¹cy tej ekspedycji.
	
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
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //Sk¹d przybywasz?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Jestem tutaj w imieniu Garonda...
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //Dobrze. Potrzebujemy nowych r¹k do pracy.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Nie przyby³em tu pomagaæ w wydobyciu.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //Nie? A po co?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //Kazano mi dowiedzieæ siê, ile rudy zdo³aliœcie wydobyæ.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Wielki magu, twoja obecnoœæ nape³nia mnie i moich ludzi odwag¹.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Z pewnoœci¹ móg³byœ nam pomóc, gdybyœ zechcia³ u¿yæ mocy, któr¹ obdarzy³ ciê Innos.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mogê dla ciebie zrobiæ?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Moja misja jest wa¿niejsza.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //Moje zadanie polega na wydobywaniu rudy i chronieniu naszych zapasów.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //Do tego potrzebujê ludzi. Jesteœ s³ug¹ Innosa - a zatem musisz s³uchaæ moich poleceñ.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mogê dla ciebie zrobiæ?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ale ja otrzyma³em ju¿ rozkazy i to od Garonda.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //S³uchaj, nie wiem, czemu Garond przys³a³ tu najemnika, ale z pewnoœci¹ mia³ w tym jakiœ cel.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Zanim ciê odeœlê, chcia³bym ci zleciæ jedno zadanie.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Wszystko ma swoj¹ cenê.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nie, nie mam czasu...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Co mogê dla ciebie zrobiæ?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Horda zêbaczy ju¿ od dawna grasuje w tej okolicy. Ostatnio kr¹¿¹ dooko³a naszego obozu, jakby czekaj¹c na okazjê do ataku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Nie wiem dok³adnie, o co mo¿e im chodziæ, ale dopóki tu s¹, w obozie nie zapanuje spokój.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Najwiêcej problemów sprawia Fed. Nie doœæ, ¿e sam jest œmiertelnie przera¿ony, to jeszcze rozsiewa panikê wœród pozosta³ych skazañców.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Bilgot te¿ siê do niczego nie nadaje.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //Tengron co prawda potrafi walczyæ, ale brakuje mu sprytu.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Chcê, ¿ebyœ znalaz³ te bestie i zabi³ je. Tylko ty mo¿esz podj¹æ siê tego zadania.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth kaza³ mi siê zaj¹æ zêbaczami, które ju¿ od jakiegoœ czasu kr¹¿¹ w okolicach obozu.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //Moja misja jest wa¿niejsza. Nie mogê ci pomóc.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Oczywiœcie, o wielki. Odpowiem na wszystkie twoje pytania.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //Ale ja otrzyma³em ju¿ rozkazy i to od Garonda.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //I wype³nisz je. Ale dopiero po tym, jak ciê odprawiê.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Od tej chwili odzywasz siê tylko po to, ¿eby zapytaæ: 'Co mogê dla pana zrobiæ?' Jasne?!
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Wszystko ma swoj¹ cenê. Jeœli mi zap³acisz, mo¿e siê nad tym zastanowiê.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Nie jestem przyzwyczajony do ubijania interesów z najemnikami. Nie znoszê siê targowaæ.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Jednak na znak mojej przychylnoœci zap³acê ci za twoj¹ pracê 100 sztuk z³ota.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //Zgoda?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co mogê dla ciebie zrobiæ?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Nie, nie mam czasu...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //Nie, nie mam czasu zajmowaæ siê waszym problemem.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Gardzisz ³atwym zarobkiem? Nigdy bym siê tego nie spodziewa³ po najemniku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Ale skoro nie chcesz nam pomóc, to pytaj, o co chcesz, i wynoœ siê st¹d jak najszybciej.
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
	description	 =  "Zabi³em przywódcê stada.";
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
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Zabi³em przywódcê stada.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Dobrze. Pozbawione przywódcy bestie nie s¹ nawet w po³owie tak groŸne. Nie s¹dzê, ¿eby mia³y nas jeszcze zaatakowaæ.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Oto twoje z³oto, zgodnie z umow¹.
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
	description	 = 	"Zêbacze ju¿ nie sprawi¹ wam problemów.";
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
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //Zêbacze ju¿ nie sprawi¹ wam problemów.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Dobra robota. Powinniœmy poradziæ sobie z reszt¹ tych bestii.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Zas³ugujesz na nagrodê - oto 100 sztuk z³ota, tak jak siê umawialiœmy.
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
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Naprawdê chcesz wiedzieæ? S¹ tak przera¿eni, ¿e w ogóle nie nadaj¹ siê do pracy!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Za³atw jakoœ ten problem z zêbaczami albo czekaj¹ nas powa¿ne k³opoty!
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
	description	 = 	"Powiedz mi, ile rudy uda³o wam siê wydobyæ do tej pory.";
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
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Powiedz mi, ile rudy uda³o wam siê wydobyæ do tej pory.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Zamelduj Garondowi, ¿e uda³o nam siê wydobyæ jedynie DWIE skrzynie rudy.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Z powodu ci¹g³ych ataków ponios³em spore straty.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Jeœli Garond przyœle mi wiêcej ludzi, bêdziemy mogli dalej wydobywaæ rudê.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Rozumiem. Zawiadomiê go.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Dobrze. Reszta nale¿y do ciebie. My postaramy siê jak najd³u¿ej utrzymaæ pozycje.
	
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
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Nie za dobrze. Czynimy niewielkie postêpy.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Kiedy tu przybyliœmy, sz³o nam znacznie lepiej, jednak ostatnio moi ch³opcy wydobywaj¹ same od³amki. Nic, co mog³oby nam siê przydaæ.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Ale nie poddamy siê - przynajmniej dopóki ja tutaj dowodzê.
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
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //Ostatnio zrobi³o siê tu trochê ciszej. Zastanawiam siê dlaczego.
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Wszystkie smoki nie ¿yj¹.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //Mam nadziejê, ¿e wkrótce nas ktoœ zast¹pi. Powoli popadam tu w ob³êd.
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


