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
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //Ej, ty! Co robisz w mojej chacie?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Ja...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //Nie ma mnie par� dni, a ka�dy my�li, �e mo�e robi�, co mu si� �ywnie podoba?
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //Dobrze, ale co tu si� dzieje?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //A co, palisada jest sko�czona? A mo�e w kanionie nie roi si� ju� od potwor�w? Wszyscy maj� to gdzie� i le�� brzuchem do g�ry!
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //To wszystko, co uda�o ci si� zrobi�, Francis?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //Z�a� z mojej �awki! I to ju�!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //A ty? Co takiego zrobi�e�?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "Nie by�o tego zbyt wiele.", DIA_Addon_Greg_ImNew_nich );
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
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "Pracowa�em.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //Nie my�l, �e zapomn� o tym, co jeste� mi winien!
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //Na ca�ej wyspie zakopa�em rzeczy warte par� setek sztuk z�ota.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //A ty oczywi�cie wszystko sobie przyw�aszczy�e�, co?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //B�dziesz musia� odpracowa� sw�j d�ug.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //Teraz poznasz prawdziwe znaczenie s�owa "praca".
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
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //Nie by�o tego zbyt wiele.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Niewa�ne. Nied�ugo ci co� wynajd�, ch�opcze.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //Pracowa�em.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //Co takiego?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //Pozby�em si� bandyt�w z wie�y.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Pla�a na p�nocy jest ju� bezpieczna.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //Dobrze. Ale to i tak dopiero pocz�tek.
	
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
	description = "Co mam zrobi�?";
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
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //Co mam zrobi�?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //Najpierw musimy doprowadzi� to miejsce do porz�dku.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Morgan, ten obibok, b�dzie pi�owa� deski.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //A ty przejmiesz jego robot� i oczy�cisz kanion z tych cholernych stwor�w.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg chce, �ebym przej�� robot� po Morganie i oczy�ci� kanion z potwor�w.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"No to id�.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Mam tam p�j�� sam?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"O jakich stworach m�wi�e�?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //No to id�.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //Chwila. Od teraz jeste� jednym z nas.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Za�� jaki� porz�dny str�j, zanim ruszysz na polowanie.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //To jeden z naszych pancerzy. Powinien pasowa� na ciebie.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //I nie oci�gaj si� z robot�.
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //Mam tam p�j�� sam?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Mo�esz wzi�� paru ch�opak�w, je�li chcesz.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Powinni uczciwie popracowa�, zamiast si� leni�.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg powiedzia�, �e mog� wzi�� z sob� cz�� ch�opak�w.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //O jakich stworach m�wi�e�?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //O brzytwiakach. Co prawda siedz� w kanionie, ale czasami podchodz� pod nasz ob�z.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //Nie chc�, �eby kt�ry� z moich ludzi zosta� po�arty.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"�cigamy tylko brzytwiaki.");
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
	description = "W sprawie kanionu...";
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
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //W sprawie kanionu...
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //Tak, o co chodzi?
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Kto� mo�e mi w tym pom�c?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Jakich stwor�w mam si� pozby�?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Pozby�em si� wszystkich brzytwiak�w.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //Kto� mo�e mi w tym pom�c?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //We� paru ch�opak�w ze sob�.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //I tak tylko si� obijaj�.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //Jakich stwor�w mam si� pozby�?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //Przede wszystkim zabij brzytwiaki. Reszta mena�erii jest stosunkowo bezpieczna.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //Pozby�em si� wszystkich brzytwiak�w.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Dobrze, bardzo dobrze... Wida�, �e potrafisz to i owo.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg by� prawie pod wra�eniem, kiedy dowiedzia� si�, �e zabi�em wszystkie brzytwiaki w kanionie.");
	
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
	description = "Potrzebuj� pancerza, jaki nosz� bandyci.";
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
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //Potrzebuj� pancerza, jaki nosz� bandyci.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Musisz na niego zas�u�y�. Poka�, co potrafisz, to pogadamy.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //Najpierw za�atw wszystkie brzytwiaki.
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg chce, �ebym pom�g� mu wprowadzi� troch� wigoru do obozu. Potem mo�emy porozmawia� o zbroi."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //Nie�le ci idzie.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Chcia�em, �eby Bones za�o�y� bandycki pancerz i szpiegowa� tych psubrat�w...
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Ale s�dz�, �e ty si� lepiej nadasz do takiej roboty.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Mo�e nawet uda ci si� wyj�� stamt�d w jednym kawa�ku.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Pogadaj z Bonesem, to da ci pancerz. Na�� go i id� do obozu bandyt�w.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //Chcia�bym wiedzie�, po co te �winie sprowadzi�y si� do doliny.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //Tak jest, kapitanie!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Po zabiciu wszystkich brzytwiak�w w kanionie mog� odebra� moj� zbroj� od Bonesa."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Mam si� dowiedzie� dla Grega, dlaczego w�a�ciwie bandyci przybyli do doliny.");
	
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

	description	 = 	"Masz dla mnie jeszcze jakie� zadanie?";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //Masz dla mnie jeszcze jakie� zadanie?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //Pla�a na p�nocy wci�� jest pe�na stwor�w.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Morgan jak zwykle si� obija.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg chce, �ebym si� zaj�� pla��. Pe�no na niej r�nych stwor�w i trzeba j� oczy�ci�.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //W wie�y stoj�cej w�r�d po�udniowych klif�w wci�� gnie�d�� si� bandyci.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //W sumie to Francis mia� si� tym zaj��.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg chce, �ebym przep�dzi� bandyt�w z wie�y na po�udnie od obozu.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Ale je�li chcesz, to mo�esz za�atwi� i t� spraw�.
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

	description	 = 	"P�nocna pla�a jest ju� bezpieczna.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //P�nocna pla�a jest ju� bezpieczna.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Wspaniale. Oto twoja nagroda.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"Powiedzia�em Gregowi, �e oczy�ci�em p�nocn� pla��.");
	
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

	description	 = 	"Bandyci ju� nie wr�c� do wie�y.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //Bandyci ju� nie wr�c� do wie�y.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //Doskonale. �wietnie si� spisa�e�. Oto zap�ata za tw�j trud.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Bandyci w wie�y nie �yj�. Greg jest bardzo zadowolony.");
	
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
	description = "Bandyci odkryli kopalni� z�ota.";
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
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Bandyci odkryli kopalni� z�ota.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //Wiedzia�em! Dlatego tylu ich tu przylaz�o!
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Nikt nie mieszka�by w�r�d tych bagien roj�cych si� od potwor�w, je�li nie mia�by naprawd� solidnego powodu.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Dobra robota. Tu jest co� dla ciebie.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"Poinformowa�em Grega o kopalni z�ota.");	
	
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
	description = "Kim jeste�?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //Kim jeste�?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Mam na imi� Greg i jestem przyw�dc� tej garstki ludzi.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //Zadowolony?
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
	description = "Jak si� tu dosta�e�?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Jak si� tu dosta�e�?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //Nie spodziewa�e� si� mnie, co?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //�eby nie by�o niedom�wie� - ja jestem Greg, a to jest m�j ob�z.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //Wszystko gra?
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
	description = "Interesuje mnie jeszcze jedna rzecz.";
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
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //Interesuje mnie jeszcze jedna rzecz.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //Co znowu?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"Jak si� tu dosta�e�?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"Gdzie jest tw�j statek?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"Co wiesz o Kruku?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //Jak si� tu dosta�e�?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //Uda�o mi si� znale�� tunel. W starej piramidzie pilnowanej przez dw�ch mag�w.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Niby magowie, ale nawet nie zorientowali si�, �e tam by�em.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Najpierw my�la�em, �e to grobowiec. Chcia�em sprawdzi�, czy nie ma w nim czego� warto�ciowego.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //I tak sobie szed�em, a� nagle znalaz�em si� w mojej ukochanej dolinie.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //A ju� my�la�em, �e przez reszt� �ycia b�d� si� ukrywa� przed stra��.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //Gdzie jest tw�j statek?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Nie uwierzysz. Od miesi�cy nie widzia�em w okolicy �adnego statku.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //Od miesi�cy, wyobra�asz sobie? I kiedy wreszcie jaki� si� pojawi�, to kr�lewski okr�t wojenny!
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //Pe�en paladyn�w, od topu po kil.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Je�li ju� mie� pecha, to na ca�ego...
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //�atwo ci m�wi�. Roznie�li nas w drzazgi jak pust� skrzyni� po owocach. Z ca�ej za�ogi tylko ja dotar�em �ywy do brzegu.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //Co wiesz o Kruku?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //Z tego, co mi wiadomo, by� jednym z magnat�w. Wielka szycha w Kolonii.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //Nie mam poj�cia, co teraz porabia, ani czemu jego ludzie poszli za nim.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //Ale wierz mi, na pewno co� knuje. Nie nale�y do tych, co zaszywaj� si� na bagnach i chc�, �eby �wiat o nich zapomnia�.
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

	description	 = 	"Kruk jest histori�.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //Kruk jest histori�.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //Niech mnie diabli porw�! Nie spodziewa�em si� tego. Musia�e� go nie�le zaskoczy�!
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //Oto 500 sztuk z�ota. Nale�� ci si�.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Masz charakter. Podobasz mi si�.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



