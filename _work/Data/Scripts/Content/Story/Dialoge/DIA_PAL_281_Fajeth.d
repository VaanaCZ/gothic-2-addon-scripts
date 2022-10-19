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
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Kdo jsi a co tady d�l�?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Jsem na cest� z rozkazu lorda Hagena.
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //V tom p��pad� by ses m�l pokusit dostat do hradu. Je tam velitel Garond. M� na povel celou na�i v�pravu.
	
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
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //Odkud jsi p�i�el?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //P�ich�z�m jm�nem Garonda.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //To je skv�l�. Dal�� mu�i se mi v�dycky hod�.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Nejsem zde proto, abych v�m pom�hal.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //Ne? A pro� jsi tedy p�i�el?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //M�m za �kol zjistit, kolik rudy jste u� vydolovali.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Ctihodn� m�gu. Tvoje p��tomnost dod�v� mn� a m�m mu��m jistotu.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Hodilo by se n�m, kdybys n�m n�jak pomohl prost�ednictv�m sv� s�ly darovan� Innosem.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co pro tebe m��u ud�lat?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Moje posl�n� je d�le�it�j��.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //A m�m �kolem je ud�lat v�echno pro to, abych vyt�il co nejv�c rudy a ochr�nil ji.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //To zahrnuje i verbov�n� mu��. Jsi v Innosov�ch slu�b�ch - bude� tedy poslouchat m� rozkazy.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co pro tebe m��u ud�lat?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"U� sv� p��kazy m�m, od Garonda.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //Poslouchej - netu��m, pro� ke mn� Garond poslal �old�ka. Ale ur�it� k tomu musel m�t dobr� d�vod.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Av�ak ne� t� pust�m zp�tky, n�co pro m� ud�l�.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"V�echno m� svou cenu.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ne, nem�m �as...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Co pro tebe m��u ud�lat?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //U� n�kolik dn� se kolem t�bora potuluje sme�ka ch�apavc�. Vypad� to, �e �ekaj� jen na ide�ln� p��le�itost k �toku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Nikdo nev�, kdy k tomu dojde - ale dokud jsou tady, nebude v t�bo�e klid.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Ten Fed, mimo jin�, je strachy �pln� bez sebe. Znepokojuje ostatn� odsouzence.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Tak koho m�m poslat? Bilgota? Ha - to je taky troska.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //A Tengron? Um� sice bojovat, ale moc se nevyzn�.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Jsi tedy jedin�, kdo to dok�e. Chci, aby ses na ty bestie vydal a pobil je.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth mi vysv�tlil, jak ��inn� lovit ch�apavce, kte�� se u� p�r dn� potuluj� kolem t�bora.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //M�m mnohem d�le�it�j�� �kol. Nem��u ti pomoci.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Pochopiteln�, ctihodnosti. Pod�m ti v�echny informace, kter� bude� cht�t.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //U� sv� p��kazy m�m, od Garonda.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //A tak� je spln�. Ale a� pot�, co t� propust�m.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Jedin�, co od tebe chci sly�et, je 'Co pro tebe m��u ud�lat?' Rozum�no?
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //V�echno m� svou cenu. Kdy� mi zaplat�, nech�m si to proj�t hlavou.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Nejsem zvykl� dohadovat se se �old�ky. Nesn��m smlouv�n� o lep�� cenu.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Ale pokud pro m� bude� pracovat, d�m ti na d�kaz sv� dobr� v�le 100 zlat�ch.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //Tak co, dohodnuto?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co pro tebe m��u ud�lat?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ne, nem�m �as...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //Ne, nem�m �as starat se o tvoje probl�my.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Odm�t� tak snadno vyd�lan� pen�ze? To bych od �old�ka nikdy ne�ekal.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Proto�e n�m nechce� pomoci, p�edpokl�d�m, �e bude� cht�t co nejrychleji z�skat odpov�di na sv� ot�zky a pak hned vypadne�.
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
	description	 =  "Zabil jsem v�dce sme�ky.";
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
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Zabil jsem v�dce sme�ky.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Dobr�. Bez v�dce u� nejsou zdaleka tak nebezpe�n�. Mysl�m, �e u� na n�s neza�to��.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Tady jsou tv� pen�ze - jak jsme se domluvili.
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
	description	 = 	"S ch�apavci jsem skoncoval.";
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
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //S ch�apavci jsem skoncoval.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Dobr� pr�ce. O zbytek bychom u� m�li b�t schopni se postarat sami.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Zaslou�il sis sv�j plat - tady m� 100 zlat�ch, jak jsme se domluvili.
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
	description  =  "Jak to vypad� s mor�lkou tv�ch mu��?";
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
	AI_Output (other, self, "DIA_Fajeth_Running_15_00"); //Jak to vypad� s mor�lkou tv�ch mu��?
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Chce� v�d�t, jak to vypad� s mor�lkou? Strachy sotva pracuj�!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Postarej se o ty ch�apavce, jinak to �patn� dopadne!
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
	description	 = 	"Pov�z mi, kolik rudy jste u� vydolovali.";
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
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Pov�z mi, kolik rudy jste u� vydolovali.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Nahlas Garondovi, �e zat�m se n�m poda�ilo z�skat jenom DV� bedny rudy.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Kv�li neust�l�m n�jezd�m jsem u� p�i�el o spoustu mu��.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Pokud by n�m Garond poslal v�ce mu��, m�li bychom rudy v�c.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Jasn�. Vy��d�m mu to.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Dobr�. Te� je to na tob�. Budeme dr�et pozice tak dlouho, jak to jen p�jde.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Fajethovi kop��i u� vydolovali DV� bedny rudy.");
	
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
	description  =  "Jak to vypad� s dolov�n�m rudy?";
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
	AI_Output (other, self, "DIA_Fajeth_Perm2_15_00"); //Jak to vypad� s dolov�n�m rudy?
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //�patn�. V�bec to nejde.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Kdy� jsme p�ijeli, bylo to v po��dku - ale pak m� ho�i nedok�zali vydolovat nic ne� zbytky. Nic po��dn�ho.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Ale nevzd�v�me se - alespo� ne dokud tomu tady vel�m j�.
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
	description	 = 	"Jak to vypad� s t�bou?";
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
	AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_00"); //Jak to vypad� s t�bou?
	
	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //N�jak se v�echno uklidnilo. ��m to je?
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Draci jsou mrtv�.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //No, v tom p��pad� douf�m, �e u� brzy bude po v�em. U� jsem si p�est�val d�lat nad�je.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_04"); //Vid� s�m. Nic moc.
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


