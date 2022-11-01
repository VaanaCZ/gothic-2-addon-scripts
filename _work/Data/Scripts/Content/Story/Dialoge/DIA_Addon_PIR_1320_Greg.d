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
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(hrozivę) Hele! Co dęláš v mý boudę?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Já...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(zuâivę) Na pár dnů si vodskočím a každej si hned myslí, že si tu může dęlat, co chce.
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //Co se to tu ksakru dęje?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //Palisáda eštę nejni dostavęná? Kaŕon je plnej bestií a každej se tu jen tak poflakuje a myslí si, kdovíjak nejni dobrej?
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(nahlas) To jste toho víc neudęlali, Francisi?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(nahlas) Vokamžitę vypadni z mý lavice!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //A TY? Cos udęlal TY?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "Zatím nic moc.", DIA_Addon_Greg_ImNew_nich );
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
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //A nemysli si, že jsem zapomnęl, že mi ještę pár vęcí dlužíš.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //Jsou to vęci za pár set zlatejch, který jsem zakopal po celým Khorinidu.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //Jsi je prostę sbalil, co?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Každej kousek si ale tvrdę vodpracuješ.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //Já tę naučím, jak se má makat.
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
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //Zatím nic moc.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Nevadí, najdu ti nęco vhodnýho, kámo.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //Pracoval jsem.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //Fakt? A co?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //Už jsem se vypoâádal s bandity v té vęži.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Na pláži na severu už nejsou žádné potvory.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //No, tak to je začátek, počítám.
	
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
	description = "Co to mám dęlat?";
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
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //Co máte na práci?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //Napâed se to tu musí začít trochu hejbat.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Morgan, to líný prase, musí naâezat prkna.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //A TY to vezmeš za Morgana a vyčistíš ten zatracenej kaŕon vode všech potvor.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg by chtęl, abych za Morgana vyčistil kaŕon ode všech nestvůr.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Pak myslím, že už půjdu.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"To to mám všecko udęlat sám?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Jaké nestvůry?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //Myslím, že tedy půjdu.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //A eštę nęco. Teë seš jeden z nás.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Tak si koukej vopatâit ŕáký slušný vybavení.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //Tady máš ŕáký brnęní, snad ti padne.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //A nikde se neflákej – hned se do toho pusă!
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //To to mám všecko dęlat sám nebo co?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Bęž prostę dopâedu a vem si ŕáký chlapy.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Aă si trochu zasloužej plat a furt jenom nekecaj.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg âíká, že s sebou můžu vzít tlupu dalších chlapů.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //Jaké potvory?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //Bâitovci z kaŕonu se stahujou čím dál blíž k našemu táboru.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //Nebudu čekat, až nękdo z mejch chlapů trochu pâebere, pâiplete se tęm potvorám do cesty a ty ho sežerou.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Nejspíš se jedná o bâitovce.");
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
	description = "K tomu kańonu...";
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
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //Co se týče toho kaŕonu...
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //No, co je s ním?
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Kdo mi s tím může pomoct?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Jaké nestvůry mám zabíjet?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Pobil jsem všecky bâitovce.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //Kdo mi s tím pomůže?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //Vem si pár chlapů.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //Beztak si tu akorát válej šunky.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //Jaké potvory mám zabíjet?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //Zlikviduj bâitovce! Vostatní potvory jsou neškodný.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //Pobil jsem všechny bâitovce.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Dobâe, vypadá to, že v tobę nęco je.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Pobil jsem všecky bâitovce v kaŕonu, ale na Grega to moc dojem neudęlalo.");
	
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
	description = "Potâebuju zbroj banditů.";
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
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //Potâebuji zbroj banditů.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Napâed dokaž, že nejsi úplnej budižkničemu. Teprv pak se s tebou budu bavit.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //Napâed pobij všecky bâitovce v kaŕonu!
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg chce, abych mu pomohl tábor znovu oživit. Pak si s ním můžu promluvit o brnęní."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //Hele, v tobę vážnę nęco je!
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Tuhle zbroj si męl navlíct Bones a jít mezi bandity jako vyzvędač.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Ale TY se pro tu práci hodíš líp.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Možná se vocaë dostaneš i živej.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Promluv si s Bonesem a âekni mu, aă ti dá to brnęní. Pak si ho voblíkni a pal do tábora banditů.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //Musím vędęt, jak je možný, že ti parchanti pâišli do našeho údolí jako první.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //Rozkaz, kapitáne!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Až pobiju všecky bâitovce v táboâe a oznámím to Gregovi, můžu si u Bonese vyzvednout zbroj."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Musím pro Grega zjistit, proč bandité pâišli do tohoto údolí jako první.");
	
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

	description	 = 	"Máš pro mę ještę nęjakou další práci?";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //Máš pro mę ještę nęco jiného?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //Pláž na severu se ještę furt hemží potvorama.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Morgan se na to nejspíš vybodnul.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg chce, abych se postaral o pláž. Je na ní plno potvor, které je tâeba vyhubit.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //Ve vęži na jižním útesu jsou ještę furt banditi.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //Męl by to s nima vyâídit Francis.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg chce, abych z vęže jižnę od tábora vyhnal bandity.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Ale esli chceš, můžeš to zaâídit i ty.
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

	description	 = 	"Severní pláž je vyčištęná.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //Severní pláž už je vyčištęná.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Skvęlý, tady máš vodmęnu.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"Oznámil jsem Gregovi, že severní pláž je čistá.");
	
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

	description	 = 	"Už jsem se vypoâádal s tęmi bandity ve vęži.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //Už jsem se vypoâádal s tęmi bandity ve vęži.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //Výbornę, skvęlá práce, tady máš odmęnu.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Banditi ve vęži jsou mrtví. Na Grega to udęlalo dojem.");
	
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
	description = "Banditi objevili zlatý důl.";
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
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Banditi našli zlatý důl.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //Já to vędęl! Tak PROTO sem pâišli!
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Nikdo by jinak dobrovolnę nelez do takovýho močálu, kde se to hemží kdovíjakou havętí.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Prima, tady pro tebe nęco mám.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"Âekl jsem Gregovi o zlatém dole.");	
	
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
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Jsem Greg, velitel týhle líný sebranky.
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
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //Mę si nečekal, co?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //Tak abysme to uvedli na pravou míru. Jsem Greg a tady todle je můj tábor.
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
	description = "Ještę jedno bych rád vędęl.";
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
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //Ještę jedno bych rád vędęl.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //Co?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"Jak ses sem dostal?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"Kde máš svou loë?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"Co víš o Havranovi?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //Jak ses sem dostal?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //U starý pyramidy jsem vobjevil tunel, kterej hlídalo pár mágů.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Prostę jsem se kolem tęch slepejšů proplížil.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Napâed sem se dostal do starý pohâební komnaty. Tak jsem chtęl zjistit, esli by se mi tam nęco nehodilo.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //A dokážeš si pâedstavit to pâekvapení, když jsem se najednou vobjevil ve svým milovaným oudolí.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //Zrovna když jsem myslel, že až do smrti budu utíkat pâed domobranou.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //Kde máš loë?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Takový štęstí může potkat jenom mę. Už pár męsíců vodsuë na pevninu žádná loë nejela.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //Pár męsíců! A první loë, na kterou jsem narazil, byla po zuby vozbrojená válečná loë, co patâila králi.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //A byla plná paladinů, vod kýlu až po stęžeŕ.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Tak tomu âíkám smůla.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //To nemusíš âíkat dvakrát. Vokamžitę nás potopili a já byl jedinej, kdo se dostal na pobâeží.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //Co víš o Havranovi?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //Pokud vim, tak to bejval rudobaron. Ŕáký velký zvíâe z kolonie.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //Nemám tušáka, kde je teë a proč za nim lidi lozí.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //Ale určitę po nęčem jde. Nejni z tęch, co by se jen tak skovávali v bažinę.
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
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //No, hmm... to sem nečekal. Si ho nachytal na švestkách, co?
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //To mi stojí za 500 zlaăáků.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Ty máš fakt kuráž. Jen tak dál.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



