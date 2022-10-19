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
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Kdo jsi a co tady dìláš?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Jsem na cestì z rozkazu lorda Hagena.
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //V tom pøípadì by ses mìl pokusit dostat do hradu. Je tam velitel Garond. Má na povel celou naši výpravu.
	
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
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //Odkud jsi pøišel?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Pøicházím jménem Garonda.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //To je skvìlé. Další muži se mi vždycky hodí.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Nejsem zde proto, abych vám pomáhal.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //Ne? A proè jsi tedy pøišel?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //Mám za úkol zjistit, kolik rudy jste už vydolovali.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Ctihodný mágu. Tvoje pøítomnost dodává mnì a mým mužùm jistotu.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Hodilo by se nám, kdybys nám nìjak pomohl prostøednictvím své síly darované Innosem.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co pro tebe mùžu udìlat?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Moje poslání je dùležitìjší.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //A mým úkolem je udìlat všechno pro to, abych vytìžil co nejvíc rudy a ochránil ji.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //To zahrnuje i verbování mužù. Jsi v Innosových službách - budeš tedy poslouchat mé rozkazy.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co pro tebe mùžu udìlat?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Už své pøíkazy mám, od Garonda.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //Poslouchej - netuším, proè ke mnì Garond poslal žoldáka. Ale urèitì k tomu musel mít dobrý dùvod.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Avšak než tì pustím zpátky, nìco pro mì udìláš.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Všechno má svou cenu.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ne, nemám èas...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Co pro tebe mùžu udìlat?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Už nìkolik dní se kolem tábora potuluje smeèka chòapavcù. Vypadá to, že èekají jen na ideální pøíležitost k útoku.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Nikdo neví, kdy k tomu dojde - ale dokud jsou tady, nebude v táboøe klid.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Ten Fed, mimo jiné, je strachy úplnì bez sebe. Znepokojuje ostatní odsouzence.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Tak koho mám poslat? Bilgota? Ha - to je taky troska.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //A Tengron? Umí sice bojovat, ale moc se nevyzná.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Jsi tedy jediný, kdo to dokáže. Chci, aby ses na ty bestie vydal a pobil je.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth mi vysvìtlil, jak úèinnì lovit chòapavce, kteøí se už pár dní potulují kolem tábora.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //Mám mnohem dùležitìjší úkol. Nemùžu ti pomoci.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Pochopitelnì, ctihodnosti. Podám ti všechny informace, které budeš chtít.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //Už své pøíkazy mám, od Garonda.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //A také je splníš. Ale až poté, co tì propustím.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Jediné, co od tebe chci slyšet, je 'Co pro tebe mùžu udìlat?' Rozumìno?
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Všechno má svou cenu. Když mi zaplatíš, nechám si to projít hlavou.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Nejsem zvyklý dohadovat se se žoldáky. Nesnáším smlouvání o lepší cenu.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Ale pokud pro mì budeš pracovat, dám ti na dùkaz své dobré vùle 100 zlatých.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //Tak co, dohodnuto?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Co pro tebe mùžu udìlat?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ne, nemám èas...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //Ne, nemám èas starat se o tvoje problémy.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Odmítáš tak snadno vydìlané peníze? To bych od žoldáka nikdy neèekal.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Protože nám nechceš pomoci, pøedpokládám, že budeš chtít co nejrychleji získat odpovìdi na své otázky a pak hned vypadneš.
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
	description	 =  "Zabil jsem vùdce smeèky.";
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
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Zabil jsem vùdce smeèky.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Dobrá. Bez vùdce už nejsou zdaleka tak nebezpeèní. Myslím, že už na nás nezaútoèí.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Tady jsou tvé peníze - jak jsme se domluvili.
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
	description	 = 	"S chòapavci jsem skoncoval.";
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
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //S chòapavci jsem skoncoval.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Dobrá práce. O zbytek bychom už mìli být schopni se postarat sami.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Zasloužil sis svùj plat - tady máš 100 zlatých, jak jsme se domluvili.
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
	description  =  "Jak to vypadá s morálkou tvých mužù?";
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
	AI_Output (other, self, "DIA_Fajeth_Running_15_00"); //Jak to vypadá s morálkou tvých mužù?
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Chceš vìdìt, jak to vypadá s morálkou? Strachy sotva pracují!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Postarej se o ty chòapavce, jinak to špatnì dopadne!
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
	description	 = 	"Povìz mi, kolik rudy jste už vydolovali.";
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
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Povìz mi, kolik rudy jste už vydolovali.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Nahlas Garondovi, že zatím se nám podaøilo získat jenom DVÌ bedny rudy.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Kvùli neustálým nájezdùm jsem už pøišel o spoustu mužù.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Pokud by nám Garond poslal více mužù, mìli bychom rudy víc.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Jasnì. Vyøídím mu to.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Dobrá. Teï je to na tobì. Budeme držet pozice tak dlouho, jak to jen pùjde.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Fajethovi kopáèi už vydolovali DVÌ bedny rudy.");
	
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
	description  =  "Jak to vypadá s dolováním rudy?";
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
	AI_Output (other, self, "DIA_Fajeth_Perm2_15_00"); //Jak to vypadá s dolováním rudy?
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Špatnì. Vùbec to nejde.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Když jsme pøijeli, bylo to v poøádku - ale pak mí hoši nedokázali vydolovat nic než zbytky. Nic poøádného.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Ale nevzdáváme se - alespoò ne dokud tomu tady velím já.
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
	description	 = 	"Jak to vypadá s tìžbou?";
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
	AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_00"); //Jak to vypadá s tìžbou?
	
	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //Nìjak se všechno uklidnilo. Èím to je?
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Draci jsou mrtví.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //No, v tom pøípadì doufám, že už brzy bude po všem. Už jsem si pøestával dìlat nadìje.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_04"); //Vidíš sám. Nic moc.
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


