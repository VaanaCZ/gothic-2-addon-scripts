// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_EXIT(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 999;
	condition	= DIA_Addon_Greg_EXIT_Condition;
	information	= DIA_Addon_Greg_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Greg_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Greg_PICKPOCKET (C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 900;
	condition	= DIA_Addon_Greg_PICKPOCKET_Condition;
	information	= DIA_Addon_Greg_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Addon_Greg_PICKPOCKET_Condition()
{
	C_Beklauen (111, 666);
};
 
FUNC VOID DIA_Addon_Greg_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
	
func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
// ************************************************************
// 			  			Hallo - (Greg Is Back)
// ************************************************************
INSTANCE DIA_Addon_Greg_ImNew(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 1;
	condition	= DIA_Addon_Greg_ImNew_Condition;
	information	= DIA_Addon_Greg_ImNew_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_ImNew_Info()
{	
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(hroziv�) Hele! Co d�l� v m� boud�?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //J�...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(zu�iv�) Na p�r dn� si vodsko��m a ka�dej si hned mysl�, �e si tu m��e d�lat, co chce.
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //Co se to tu ksakru d�je?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //Palis�da e�t� nejni dostav�n�? Ka�on je plnej besti� a ka�dej se tu jen tak poflakuje a mysl� si, kdov�jak nejni dobrej?
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(nahlas) To jste toho v�c neud�lali, Francisi?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(nahlas) Vokam�it� vypadni z m� lavice!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //A TY? Cos ud�lal TY?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "Zat�m nic moc.", DIA_Addon_Greg_ImNew_nich );
	if (
			(Npc_IsDead(BeachLurker1))
			&& (Npc_IsDead(BeachLurker2))
			&& (Npc_IsDead(BeachLurker3))
			&& (Npc_IsDead(BeachWaran1))
			&& (Npc_IsDead(BeachWaran2))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (MIS_Addon_MorganLurker != 0 )
		)
		|| (C_TowerBanditsDead() == TRUE)
			{
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "Pracoval jsem.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //A nemysli si, �e jsem zapomn�l, �e mi je�t� p�r v�c� dlu��.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //Jsou to v�ci za p�r set zlatejch, kter� jsem zakopal po cel�m Khorinidu.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //Jsi je prost� sbalil, co?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Ka�dej kousek si ale tvrd� vodpracuje�.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //J� t� nau��m, jak se m� makat.
	};
	
	if (!Npc_IsDead (Francis))
	{
		Npc_ExchangeRoutine  (Francis,"GREGISBACK");
		AI_StartState (Francis, ZS_Saw, 1, "ADW_PIRATECAMP_BEACH_19"); //HACK - REDUNDANT!!!
		Francis_ausgeschissen = TRUE;
	};
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
};
// --------------------------------------------------------------------
func void DIA_Addon_Greg_ImNew_nich ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //Zat�m nic moc.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Nevad�, najdu ti n�co vhodn�ho, k�mo.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //Pracoval jsem.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //Fakt? A co?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //U� jsem se vypo��dal s bandity v t� v�i.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Na pl�i na severu u� nejsou ��dn� potvory.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //No, tak to je za��tek, po��t�m.
	
	B_UseRakeBilanz ();
};

// ************************************************************
// 			  				JoinPirates
// ************************************************************
INSTANCE DIA_Addon_Greg_JoinPirates(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_JoinPirates_Condition;
	information	= DIA_Addon_Greg_JoinPirates_Info;
	permanent	= FALSE;
	description = "Co to m�m d�lat?";
};                       
FUNC INT DIA_Addon_Greg_JoinPirates_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //Co m�te na pr�ci?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //Nap�ed se to tu mus� za��t trochu hejbat.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Morgan, to l�n� prase, mus� na�ezat prkna.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //A TY to vezme� za Morgana a vy�ist� ten zatracenej ka�on vode v�ech potvor.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg by cht�l, abych za Morgana vy�istil ka�on ode v�ech nestv�r.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Pak mysl�m, �e u� p�jdu.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"To to m�m v�ecko ud�lat s�m?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Jak� nestv�ry?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //Mysl�m, �e tedy p�jdu.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //A e�t� n�co. Te� se� jeden z n�s.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Tak si koukej vopat�it ��k� slu�n� vybaven�.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //Tady m� ��k� brn�n�, snad ti padne.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //A nikde se nefl�kej � hned se do toho pus�!
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //To to m�m v�ecko d�lat s�m nebo co?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //B� prost� dop�edu a vem si ��k� chlapy.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //A� si trochu zaslou�ej plat a furt jenom nekecaj.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg ��k�, �e s sebou m��u vz�t tlupu dal��ch chlap�.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //Jak� potvory?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //B�itovci z ka�onu se stahujou ��m d�l bl� k na�emu t�boru.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //Nebudu �ekat, a� n�kdo z mejch chlap� trochu p�ebere, p�iplete se t�m potvor�m do cesty a ty ho se�erou.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Nejsp� se jedn� o b�itovce.");
};

// ************************************************************
// 			  				Wegen dem Canyon...
// ************************************************************
INSTANCE DIA_Addon_Greg_AboutCanyon(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_AboutCanyon_Condition;
	information	= DIA_Addon_Greg_AboutCanyon_Info;
	permanent	= TRUE;
	description = "K tomu ka�onu...";
};                       
FUNC INT DIA_Addon_Greg_AboutCanyon_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //Co se t��e toho ka�onu...
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //No, co je s n�m?
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Kdo mi s t�m m��e pomoct?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Jak� nestv�ry m�m zab�jet?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Pobil jsem v�ecky b�itovce.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //Kdo mi s t�m pom��e?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //Vem si p�r chlap�.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //Beztak si tu akor�t v�lej �unky.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //Jak� potvory m�m zab�jet?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //Zlikviduj b�itovce! Vostatn� potvory jsou ne�kodn�.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //Pobil jsem v�echny b�itovce.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Dob�e, vypad� to, �e v tob� n�co je.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Pobil jsem v�ecky b�itovce v ka�onu, ale na Grega to moc dojem neud�lalo.");
	
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP (XP_ADDON_CLEARCANYON);
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};


// ************************************************************
// 			  				BanditArmor
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditArmor(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditArmor_Condition;
	information	= DIA_Addon_Greg_BanditArmor_Info;
	permanent	= TRUE;
	description = "Pot�ebuju zbroj bandit�.";
};                       
FUNC INT DIA_Addon_Greg_BanditArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditArmor_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //Pot�ebuji zbroj bandit�.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Nap�ed doka�, �e nejsi �plnej budi�kni�emu. Teprv pak se s tebou budu bavit.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //Nap�ed pobij v�ecky b�itovce v ka�onu!
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg chce, abych mu pomohl t�bor znovu o�ivit. Pak si s n�m m��u promluvit o brn�n�."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //Hele, v tob� v�n� n�co je!
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Tuhle zbroj si m�l navl�ct Bones a j�t mezi bandity jako vyzv�da�.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Ale TY se pro tu pr�ci hod� l�p.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Mo�n� se voca� dostane� i �ivej.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Promluv si s Bonesem a �ekni mu, a� ti d� to brn�n�. Pak si ho vobl�kni a pal do t�bora bandit�.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //Mus�m v�d�t, jak je mo�n�, �e ti parchanti p�i�li do na�eho �dol� jako prvn�.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //Rozkaz, kapit�ne!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"A� pobiju v�ecky b�itovce v t�bo�e a ozn�m�m to Gregovi, m��u si u Bonese vyzvednout zbroj."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Mus�m pro Grega zjistit, pro� bandit� p�i�li do tohoto �dol� jako prvn�.");
	
		MIS_Greg_ScoutBandits = LOG_RUNNING;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auftraege2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Auftraege2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Auftraege2_Condition;
	information	 = 	DIA_Addon_Greg_Auftraege2_Info;

	description	 = 	"M� pro m� je�t� n�jakou dal�� pr�ci?";
};

func int DIA_Addon_Greg_Auftraege2_Condition ()
{
	if (MIS_Greg_ScoutBandits != 0)
	&& (
		(C_TowerBanditsDead() == FALSE)
		|| (
				 (Npc_IsDead(BeachLurker1)== FALSE)
				&& (Npc_IsDead(BeachLurker2)== FALSE)
				&& (Npc_IsDead(BeachLurker3)== FALSE)
				&& (Npc_IsDead(BeachWaran1)== FALSE)
				&& (Npc_IsDead(BeachWaran2)== FALSE)
				&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
		   )
		)
				{
					return TRUE;
				};
};

func void DIA_Addon_Greg_Auftraege2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //M� pro m� je�t� n�co jin�ho?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //Pl� na severu se je�t� furt hem�� potvorama.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Morgan se na to nejsp� vybodnul.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg chce, abych se postaral o pl�. Je na n� plno potvor, kter� je t�eba vyhubit.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //Ve v�i na ji�n�m �tesu jsou je�t� furt banditi.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //M�l by to s nima vy��dit Francis.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg chce, abych z v�e ji�n� od t�bora vyhnal bandity.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Ale esli chce�, m��e� to za��dit i ty.
};

///////////////////////////////////////////////////////////////////////
//	Info Sauber2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Sauber2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Sauber2_Condition;
	information	 = 	DIA_Addon_Greg_Sauber2_Info;

	description	 = 	"Severn� pl� je vy�i�t�n�.";
};

func int DIA_Addon_Greg_Sauber2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_Sauber2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //Severn� pl� u� je vy�i�t�n�.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Skv�l�, tady m� vodm�nu.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"Ozn�mil jsem Gregovi, �e severn� pl� je �ist�.");
	
	MIS_Addon_MorganLurker = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);	
};

///////////////////////////////////////////////////////////////////////
//	Info BanditPlatt2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_BanditPlatt2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_BanditPlatt2_Condition;
	information	 = 	DIA_Addon_Greg_BanditPlatt2_Info;

	description	 = 	"U� jsem se vypo��dal s t�mi bandity ve v�i.";
};

func int DIA_Addon_Greg_BanditPlatt2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (C_TowerBanditsDead() == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //U� jsem se vypo��dal s t�mi bandity ve v�i.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //V�born�, skv�l� pr�ce, tady m� odm�nu.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Banditi ve v�i jsou mrtv�. Na Grega to ud�lalo dojem.");
	
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);	
};



// ************************************************************
// 			  				BanditGoldmine
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditGoldmine(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditGoldmine_Condition;
	information	= DIA_Addon_Greg_BanditGoldmine_Info;
	permanent	= TRUE;
	description = "Banditi objevili zlat� d�l.";
};                       
FUNC INT DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if (SC_KnowsRavensGoldmine == TRUE)
	&& (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditGoldmine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Banditi na�li zlat� d�l.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //J� to v�d�l! Tak PROTO sem p�i�li!
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Nikdo by jinak dobrovoln� nelez do takov�ho mo��lu, kde se to hem�� kdov�jakou hav�t�.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Prima, tady pro tebe n�co m�m.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"�ekl jsem Gregovi o zlat�m dole.");	
	
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Greg_ScoutBandits);
};


// ************************************************************
// 			Wer bist du			  				
// ************************************************************
INSTANCE DIA_Addon_Greg_WhoAreYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 2;
	condition	= DIA_Addon_Greg_WhoAreYou_Condition;
	information	= DIA_Addon_Greg_WhoAreYou_Info;
	permanent	= FALSE;
	description = "Kdo jsi?";
};                       
FUNC INT DIA_Addon_Greg_WhoAreYou_Condition()
{
	if (PlayerTalkedToGregNW == FALSE)//Joly:WAR VOHER npc_gLOBAL -> GREG_NW
	&& (SC_MeetsGregTime == 0)//Joly:zur sicherheit
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //Kdo jsi?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Jsem Greg, velitel t�hle l�n� sebranky.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //Spokojenej?
};

// ************************************************************
// 			  	NiceToSeeYou			
// ************************************************************
INSTANCE DIA_Addon_Greg_NiceToSeeYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_NiceToSeeYou_Condition;
	information	= DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent	= FALSE;
	description = "Tak jak ses sem dostal?";
};                       
FUNC INT DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if (PlayerTalkedToGregNW	 == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_NiceToSeeYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Tak jak ses sem dostal?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //M� si ne�ekal, co?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //Tak abysme to uvedli na pravou m�ru. Jsem Greg a tady todle je m�j t�bor.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //Spokojenej?
};
	
// ************************************************************
// 			  	Story			
// ************************************************************
INSTANCE DIA_Addon_Greg_Story(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 99;
	condition	= DIA_Addon_Greg_Story_Condition;
	information	= DIA_Addon_Greg_Story_Info;
	permanent	= TRUE;
	description = "Je�t� jedno bych r�d v�d�l.";
};                       
FUNC INT DIA_Addon_Greg_Story_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Addon_Greg_WhoAreYou) == TRUE)
	|| (Npc_KnowsInfo (other,DIA_Addon_Greg_NiceToSeeYou) == TRUE))
	&& (MIS_Greg_ScoutBandits != 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_Story_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //Je�t� jedno bych r�d v�d�l.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //Co?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"Jak ses sem dostal?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"Kde m� svou lo�?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"Co v� o Havranovi?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //Jak ses sem dostal?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //U star� pyramidy jsem vobjevil tunel, kterej hl�dalo p�r m�g�.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Prost� jsem se kolem t�ch slepej�� propl�il.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Nap�ed sem se dostal do star� poh�ebn� komnaty. Tak jsem cht�l zjistit, esli by se mi tam n�co nehodilo.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //A dok�e� si p�edstavit to p�ekvapen�, kdy� jsem se najednou vobjevil ve sv�m milovan�m oudol�.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //Zrovna kdy� jsem myslel, �e a� do smrti budu ut�kat p�ed domobranou.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //Kde m� lo�?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Takov� �t�st� m��e potkat jenom m�. U� p�r m�s�c� vodsu� na pevninu ��dn� lo� nejela.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //P�r m�s�c�! A prvn� lo�, na kterou jsem narazil, byla po zuby vozbrojen� v�le�n� lo�, co pat�ila kr�li.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //A byla pln� paladin�, vod k�lu a� po st�e�.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Tak tomu ��k�m sm�la.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //To nemus� ��kat dvakr�t. Vokam�it� n�s potopili a j� byl jedinej, kdo se dostal na pob�e��.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //Co v� o Havranovi?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //Pokud vim, tak to bejval rudobaron. ��k� velk� zv��e z kolonie.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //Nem�m tu��ka, kde je te� a pro� za nim lidi loz�.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //Ale ur�it� po n��em jde. Nejni z t�ch, co by se jen tak skov�vali v ba�in�.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_RavenDead		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Greg_RavenDead_Condition;
	information	 = 	DIA_Addon_Greg_RavenDead_Info;

	description	 = 	"S Havranem je konec.";
};

func int DIA_Addon_Greg_RavenDead_Condition ()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //S Havranem je konec.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //No, hmm... to sem ne�ekal. Si ho nachytal na �vestk�ch, co?
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //To mi stoj� za 500 zla��k�.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Ty m� fakt kur�. Jen tak d�l.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



