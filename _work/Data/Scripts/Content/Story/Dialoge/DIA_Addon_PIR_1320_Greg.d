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
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(droht) Sag mal. Was machst du in meiner Hütte?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Ich ...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(wütend) Kaum ist man mal ein paar Tage nicht da, da glaubt jeder, er kann mir auf der Nase rumtanzen.
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //Was ist eigentlich hier los?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //Die Palisade ist noch nicht fertig? Der Canyon quillt fast über vor Viechern und alle machen sich einen schönen Tag.
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(laut) Ist das etwa alles, was du zustande gebracht hast, Francis?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(laut) Verzieh dich sofort von meiner Bank!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //Und DU? Was hast DU gemacht?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "Bisher noch nicht viel.", DIA_Addon_Greg_ImNew_nich );
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
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "Gearbeitet.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //Glaub jetzt aber bloß nicht, ich hätte vergessen, dass du mir noch was schuldig bist.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //Es waren Sachen im Wert von mehreren hundert Goldmünzen, die ich überall in Khorinis vergraben habe.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //Die hast du dir alle eingesackt, was?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Das wirst du jetzt bei mir abarbeiten.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //Ab jetzt wirst du mal richtige Arbeit kennen lernen.
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
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //Bisher noch nicht viel.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Macht nichts. Ich werde schon das Passende für dich finden, mein Freundchen.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //Gearbeitet.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //So? Was denn?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //Ich habe die Banditen aus dem Turm erledigt.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Der Strand im Norden ist von Viechern gesäubert.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //Na ja. Das ist ja schon mal ein Anfang.
	
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
	description = "Was gibt's zu tun?";
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
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //Was gibt's zu tun?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //Als erstes müssen wir hier wieder ein bisschen Schwung in den Laden bringen.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Morgan, die faule Sau, schick ich zum Bretter sägen.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //DU wirst Morgans Job übernehmen und den verdammten Canyon von Viechern säubern.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg möchte, dass ich Morgans Job übernehme und den Canyon von Viechern säubere.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Dann werde ich mal aufbrechen.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Soll ich das etwa ganz alleine machen?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Welche Viecher?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //Dann werde ich mal aufbrechen.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //Noch was. Du bist jetzt einer von uns.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Also ziehst du dir erst mal vernünftige Klamotten für die Jagd an.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //Hier hast du eine von unseren Rüstungen. Ich schätze, die wird dir passen.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //Und trödel nicht so lange herum, klar?
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //Soll ich das etwa ganz alleine machen?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Am besten schanppst du dir ein paar von den Jungs.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Die sollen ihre Heuer verdienen, anstatt den ganzen Tag nur zu tratschen.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg meint, ich kann mir ein paar von den Jungs mitnehmen.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //Welche Viecher?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //Die Razor im Canyon kommen immer näher an's Lager.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //Ich habe keine Lust, dass einer meiner Männer im Suff von den Biester gefressen wird.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Es geht wohl aussschließlich um Razor.");
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
	description = "Wegen der Sache mit dem Canyon...";
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
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //Wegen der Sache mit dem Canyon ...
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //Ja, was ist damit?
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Wer kann mir dabei helfen?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Welche Viecher soll ich töten?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Ich habe alle Razor getötet.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //Wer kann mir dabei helfen?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //Nimm dir ein paar von den Jungs mit.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //Die hängen sonst die ganze Zeit nur herum.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //Welche Viecher soll ich töten?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //Du sollst die Razor beseitigen! Das andere Viehzeug ist harmlos.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //Ich habe alle Razor getötet.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Sehr gut. Du scheinst ja ganz brauchbar zu sein.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg schien sogar ein bisschen beeindruckt zu sein, dass ich alle Razor im Canyon getötet habe.");
	
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
	description = "Ich brauche die Banditenrüstung.";
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
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //Ich brauche die Banditenrüstung.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Mach dich erst mal nützlich. Dann können wir darüber reden.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //Töte erst mal alle Razor im Canyon!
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg will, dass ich ihm helfe wieder Schwung ins Lager zu bringen. Danach kann ich mich mit ihm über die Rüstung unterhalten."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //Hast mächtig was auf dem Kasten.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Eigentlich sollte Bones mit der Rüstung die Banditen ausspionieren.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Aber ich sollte besser DIR den Job überlassen.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Du hast vielleicht sogar 'ne Chance, da heil wieder rauszukommen.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Sprich mit Bones, er soll dir die Rüstung geben. Und dann gehst du damit zum Banditenlager.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //Ich muss wissen, warum die Drecksäcke überhaupt in unser Tal gekommen sind.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //Aye, Aye, Käpt'n!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Nachdem ich für Greg die Razor im Canyon erledigt habe, kann ich mir die Rüstung bei Bones abholen."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Ich soll für Greg rausfinden, warum die Banditen überhaupt in dieses Tal gekommen sind.");
	
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

	description	 = 	"Hast du sonst noch was zu tun für mich?";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //Hast du sonst noch was zu tun für mich?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //Der Strand im Norden ist immer noch voller Viecher.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Morgan hat auch wirklich gar nichts getan.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg will, dass ich mich um den Strand im kümmere. Er ist voller Viecher und muss gesäubert werden.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //Im südlichen Turm auf der Klippe sind immer noch Banditen.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //Francis hätte sich eigentlich darum kümmern sollen.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg will, dass ich die Banditen aus dem Turm südlich des Lagers vertreibe.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Wenn du willst, kannst du das auch noch erledigen.
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

	description	 = 	"Der Strand im Norden ist sauber.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //Der Strand im Norden ist sauber.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Sehr gut. Hier ist die Belohnung.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"Ich habe Greg unterrichtet, dass der Strand im Norden sauber ist.");
	
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

	description	 = 	"Die Banditen im Turm sind erledigt.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //Die Banditen im Turm sind erledigt.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //Alles klar. Das war gute Arbeit. Hier ist dein Lohn.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Die Banditen aus dem Turm sind tot. Greg war sehr zufrieden mit mir.");
	
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
	description = "Die Banditen haben eine Goldmine gefunden.";
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
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Die Banditen haben eine Goldmine gefunden.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //Ich wusste es! DESHALB sind sie hierhergekommen.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Kein Mensch lebt freiwillig in dem monsterverseuchten Sumpf.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Gute Arbeit. Hier, ich hab etwas für dich.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"Ich Greg über die Goldmine informiert.");	
	
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
	description = "Wer bist du?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //Wer bist du?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Ich bin Greg, der Anführer von diesem Sauhaufen hier.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //Reicht dir das?
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
	description = "Wie bist du eigentlich hier her gekommen?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Wie bist eigentlich hierher gekommen?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //Mit mir hast du wohl nicht gerechnet, was?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //Nur damit wir das mal klar stellen. Ich bin Greg und das hier ist mein Lager.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //Genügt dir das?
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
	description = "Eine Sache würde mich noch interesieren.";
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
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //Eine Sache würde mich noch interesieren.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //Was denn?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"Wie bist du hierher gekommen?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"Wo ist dein Schiff?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"Was weisst du über Raven?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //Wie bist du hierher gekommen.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //Ich habe einen Tunnel gefunden. Bei der alten Pyramide, war von ein paar Magiern bewacht.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Hab mich an den Blindfischen einfach vorbei geschlichen.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Zuerst dachte ich, das ist wär 'ne alte Grabkammer und wollte nur mal gucken, ob da was zu holen ist.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //Hab nicht schlecht gestaunt, als ich plötzlich in meinem geliebten Tal rauskam.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //Dachte schon, ich müsste den Rest meines Lebens vor der Miliz wegrennen.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //Wo ist dein Schiff?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Das glaubt mir kein Mensch. Da ist monatelang kein Schiff zwischen hier und dem Festland unterwegs.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //Monatelang! - Und das erste Schiff, dem man begegnet, ist ein vollbesetztes Kriegschiff des Königs.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //Vom Kiel bis zum Masttop voll mit Paladinen.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Das nennt man wohl Pech.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //Das kannst du laut sagen. Die haben uns kurzerhand versenkt. Ich bin der Einzige, der es bis zum Ufer geschafft hat.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //Was weißt du über Raven?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //Soweit ich weiß, war er früher Erzbaron. Eine ziemlich große Nummer in der Kolonie.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //Ich habe keine Ahnung, warum er hier ist und warum die Leute ihm folgen.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //Aber ich bin mir sicher, er brütet etwas aus. Er ist nicht der Typ, der sich im Sumpf versteckt.
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

	description	 = 	"Raven ist erledigt.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //Raven ist erledigt.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //Donnerwetter. Das hätte ich ja nicht gedacht. Hast ihn kalt erwischt, was?
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //Das ist mir doch glatt 500 Golstücke wert.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Du bist ein wahrer Teufelskerl. Weiter so.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



