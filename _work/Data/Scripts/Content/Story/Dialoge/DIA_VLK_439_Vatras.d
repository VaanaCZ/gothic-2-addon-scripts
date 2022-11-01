// *********************************************************
// 			  				EXIT
// *********************************************************
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int Vatras_MORE;

///////////////////////////////////////////////////////////////////////
//	Info KillerWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_KillerWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_KillerWarning_Condition;
	information	 = 	DIA_Addon_Vatras_KillerWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_KillerWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 3)
	&& (MadKillerCount < 7)
	&& (VatrasPissedOffForever == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Vatras_KillerWarning_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //V Khorinidu se o tobę hodnę povídá.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //Prý ses zapletl do vražd nevinných lidí.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //Jestli je to pravda, tak tę varuju, synu. 
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //Neopouštęj cestu rovnováhy a chraŕ tenhle svęt, jinak budeš muset nést následky.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //Povęz, mohu ti nęjak pomoci?
};

///////////////////////////////////////////////////////////////////////
//	Info LastWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_LastWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_LastWarning_Condition;
	information	 = 	DIA_Addon_Vatras_LastWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_LastWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 7)
	&& (VatrasPissedOffForever == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_LastWarning_Info ()
{
	B_LastWarningVatras ();
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_06"); //Co můžeš uvést na svou obhajobu?

	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Polib mi.", DIA_Addon_Vatras_LastWarning_Arsch );	 
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Je mi to líto. Nevędęl jsem, co dęlám.", DIA_Addon_Vatras_LastWarning_Reue );	 
};
func void DIA_Addon_Vatras_LastWarning_Arsch ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //Jdi se vycpat.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //V tvých slovech není ani špetka lítosti.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //Nedáváš mi na vybranou.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff ();
};

func void DIA_Addon_Vatras_LastWarning_Reue ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //Je mi to líto. Nevędęl jsem, co dęlám.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //Budu se za tebe modlit a doufat, že si pâíštę zachováš zdravý rozum.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //Będa ti, jestli se ještę doslechnu, že máš prsty v nęjaké další vraždę.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};

///////////////////////////////////////////////////////////////////////
//	Info PissedOf
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PissedOff		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_PissedOff_Condition;
	information	 = 	DIA_Addon_Vatras_PissedOff_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_PissedOff_Condition ()
{
	if (MadKillerCount > VatrasMadKillerCount)
	&& (Npc_KnowsInfo (other, DIA_Addon_Vatras_LastWarning))
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PissedOff_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //Tvá slova jsou falešná stejnę jako tvoje činy.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //Tím to bezdůvodné vraždęní neomluvíš.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //Nedáváš mi na vybranou. 
	B_VatrasPissedOff ();
};

// ----------------------------
instance DIA_Vatras_EXIT   (C_INFO)
{
	npc         = VLK_439_Vatras;
	nr          = 999;
	condition   = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Vatras_EXIT_Info()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (Vatras_LaresExit == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_00"); //Počkej!
		if (Vatras_GehZuLares == TRUE) 
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //Až uvidíš Larese...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //Potâeboval bych od tebe malou laskavost.
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //Bęž do pâístavu. Najdeš tam muže jménem Lares.
			Vatras_GehZuLares = TRUE;
		};	
			
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //Dej mu tento ornament a vyâië mu, že ho musí vrátit. On už bude vędęt, oč jde.
		CreateInvItems (self, ItMi_Ornament_Addon_Vatras, 1);									
		B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);	
		
		Vatras_LaresExit = TRUE;
	};
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
	
	if (Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine  (VLK_455_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_454_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_428_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_450_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_426_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_421_Valentino,"VATRASAWAY");	
		
		Vatras_SchickeLeuteWeg = FALSE;
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Vatras_PICKPOCKET (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 900;
	condition	= DIA_Vatras_PICKPOCKET_Condition;
	information	= DIA_Vatras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       
func INT DIA_Vatras_PICKPOCKET_Condition()
{
	C_Beklauen (91, 250);
};
func VOID DIA_Vatras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vatras_PICKPOCKET);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_BACK 		,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vatras_PICKPOCKET_DoIt);
};
func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};
func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};



// *********************************************************
// 			  				Hallo
// *********************************************************
instance DIA_Vatras_GREET		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Vatras_GREET_Condition;
	information	 = 	DIA_Vatras_GREET_Info;

	important	 =  TRUE;
};
func int DIA_Vatras_GREET_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GREET_Info ()
{
	AI_Output (self, other, "DIA_Vatras_GREET_05_00"); //Adanos tę provázej.
	AI_Output (other, self, "DIA_Vatras_GREET_15_01"); //Kdo jsi?
	AI_Output (self, other, "DIA_Vatras_GREET_05_02"); //Jsem Vatras, služebník Adanův, strážce božské i pozemské rovnováhy.
	AI_Output (self, other, "DIA_Vatras_GREET_05_03"); //Co pro tebe mohu udęlat?
};



// *********************************************************
// 		  				Brief abgeben
// *********************************************************
instance DIA_Addon_Vatras_Cavalorn		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Cavalorn_Condition;
	information	= DIA_Addon_Vatras_Cavalorn_Info;

	description	= "Mám tady pro tebe dopis.";
};
func int DIA_Addon_Vatras_Cavalorn_Condition ()
{
	if 	(
			(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon_Sealed) >=1)
			&& (MIS_Addon_Cavalorn_Letter2Vatras == LOG_RUNNING)
		)
		||	(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon)>=1) 
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Cavalorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Cavalorn_15_00"); //Tady, mám pro tebe dopis.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_01"); //Pro mę?
	
	if (SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon,1);
		AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //Ano, ale... ale už je otevâený. Doufám, že nepadl do nesprávných rukou.
	};

	B_UseFakeScroll();
	
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //Určitę. Je to velice důležitá zpráva.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //To by mę zajímalo, jak ses k tomu dopisu dostal.
	
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Vzal jsem to nęjakým banditům.", DIA_Addon_Vatras_Cavalorn_Bandit );

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Od lovce Cavalorna.", DIA_Addon_Vatras_Cavalorn_Cavalorn );
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};
func void DIA_Addon_Vatras_Cavalorn_Bandit ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //Sebral jsem ho nęjakým banditům.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //(znepokojenę) Pâi Adanovi! To není dobré. To vůbec není dobré.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //Jestli mluvíš pravdu, pak tu máme obrovský problém.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //Musím se o to co nejdâíve postarat.
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};
func void DIA_Addon_Vatras_Cavalorn_Cavalorn ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //Sebral jsem jej lovci Cavalornovi?
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //(pâekvapenę) Cavalornovi? Kde je?
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //Vzkazuje ti, že to nezvládl a teë že míâí na místo srazu. Co tím myslel, to netuším.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //Vidím, že jsi získal Cavalornovu důvęru. To hovoâí ve tvůj prospęch.
	
	B_GivePlayerXP (XP_Addon_CavalornTrust);
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};

// ************************************************************
// 		Cavalorn Sent Me
// ************************************************************
var int Vatras_Why;
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CavalornSentMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_CavalornSentMe_Condition;
	information	= DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent	= FALSE;
	description	= "Posílá mę k tobę Cavalorn.";
};
func int DIA_Addon_Vatras_CavalornSentMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	&& (Vatras_Why == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CavalornSentMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_00"); //Posílá mę za tebou Cavalorn!
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_01"); //(vychytrale) A copak ti povędęl?
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_02"); //Tvrdil, že zoufale potâebujete dobré lidi.
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_03"); //(usmívá se) Aha - takže ty se k nám chceš PÂIDAT, synu?
};

// ************************************************************
// 		Tell Me About RING 		(Trigger für MIS_Waffenhändler)
// ************************************************************
instance DIA_Addon_Vatras_TellMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_TellMe_Condition;
	information	= DIA_Addon_Vatras_TellMe_Info;
	permanent	= TRUE;

	description	= "Povęz mi nęco o tom 'kruhu vody'.";
};
func int DIA_Addon_Vatras_TellMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_TellMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_15_00"); //Vyprávęj mi o kruhu vody.

	if (!Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_01"); //(netrpęlivę) A proč bych to męl dęlat?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_02"); //Jelikož ještę nepatâíš k naší komunitę, samozâejmę ti nemůžu âíct VŠECHNO.
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_03"); //Ale povím ti, kolik budu moci.
		
		Info_ClearChoices (DIA_Addon_Vatras_TellMe);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Co tu vlastnę pâesnę dęláte?", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Kde jsou ostatní vodní mágové?", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "A kdo jsou tedy členové 'kruhu vody'?", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};
func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_TellMe);
};
func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //Co konkrétnę je vaším úkolem?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //Dohlížíme na rovnováhu mezi âádem, který ztęlesŕuje Inos, a chaosem, jehož původcem je Beliar.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //Pokud nękdo z nich bude mít navrch, bude to znamenat buë naprostou ztrátu svobody, nebo smrtonosný chaos.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //A proto dohlížíme na to, aby obę tyto síly zůstaly v rovnováze. Jinak by se tu nedalo vůbec žít.
	
	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "A co to konkrétnę znamená?", DIA_Addon_Vatras_TellMe_Konkret);
	};
};
func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //(zamračenę) A co to konkrétnę znamená?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //Pád bariéry zapâíčinil vznik âady obtíží.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //A banditi jsou pravdępodobnę to nejmenší.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //Nejenže už se nedá dostat na ostrov, aniž by tę cestou pâepadli,
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //ale ty bandity podporuje pâímo nękdo z męsta!
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //Zjistili jsme, že nęjaký khorinidský kupec banditům pravidelnę posílá dodávky zbraní. 
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //Snažíme se zjistit, kdo to je, a zajistit, aby podobní lidé pâestali ohrožovat męsto.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //Pokud v té vęci nęco zjistíš, dej mi vędęt.
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Nęjaký khorinidský obchodník se zbranęmi zásobuje bandity. Vatras po mnę chce, abych to celé poâádnę prošetâil."); 
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin, skladník od paladinů, se chce tomu dodavateli zbraní dostat na kobylku. Najdu ho u pâístavu, kde paladinové skladují své zásoby."); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"'Kruh vody' se zajímá o problémy s bandity, které mají občané Khorinidu."); 
};
func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //Kde jsou ostatní mágové vody?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //Severovýchodnę od Khorinidu. Prozkoumávají tam pozůstatky nęjaké staré kultury.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //Domníváme se, že v tęch ruinách se nachází cesta do dosud nezmapované části našeho ostrova.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Ostatní vodní mágové prozkoumávají pozůstatky staré kultury, které leží severovýchodnę od Khorinidu. Mohl by tam být vchod do dosud nezmapované části męsta."); 

	Info_AddChoice (DIA_Addon_Vatras_TellMe, "Povęz mi nęco o té neznámé oblasti.", DIA_Addon_Vatras_TellMe_Unexplored);
};
func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //Povíš mi o té nezmapované části nęco víc?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //Pokud by ses chtęl pâidat k expedici, můžu ti dát dopis pro Saturase.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //Ale pâipojit se pochopitelnę můžeš, jen když se staneš jedním z nás.
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //Samozâejmę.
	B_LogEntry (TOPIC_Addon_KDW,"Vatras chce, abych se napâed pâidal ke 'kruhu vody' a teprve pak se pâidal k výpravę vodních mágů."); 
};
func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //Kdo jsou tedy členové kruhu vody?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //To ti nemohu âíci, dokud se k nám nepâipojíš.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //Ale nękteré z nich už jsi určitę potkal.
};

// *********************************************************
// 		  				Wanna JOIN (+ Ex-Segen)
// *********************************************************
instance DIA_Addon_Vatras_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_WannaBeRanger_Condition;
	information	= DIA_Addon_Vatras_WannaBeRanger_Info;

	description	= "Chci se pâidat ke 'kruhu vody'!";
};
func int DIA_Addon_Vatras_WannaBeRanger_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //Chci vstoupit do kruhu vody!
	
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //Opravdu? To znamená, že první podmínku už jsi splnil.
		AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //Co tím myslíš?
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //Tím myslím, že nękdo z nás ti musí vęâit, jinak by ses o našem kruhu nedozvędęl.
	};
	
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //Ale já o nęm nevím vůbec nic...
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_03"); //Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erzähle mir was über dich.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_04"); //Co bys rád vędęl?
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_05"); //No, mohl bys mi prozradit, odkud pâicházíš a proč jsi vešel do męsta.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_06"); //Nesu důležitou zprávu veliteli paladinů.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_07"); //Co je to za zprávu?
		
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Objevili se tu draci...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou hrozné vęci.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //Zatímco tu spolu hovoâíme, sbírá se proti nám obrovská armáda, kterou vedou draci a která si chce podmanit celou zemi.
	
	if (Vatras_First == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //Pokud je to skutečnę pravda, pak by to mohlo narušit rovnováhu celé zemę. Kdo ti to âekl?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //(pâemýšlivę) Draci? Myslíš ty tvory, o kterých se vyprávęjí legendy? Jak jsi na to pâišel?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"No, nękde jsem nęco zaslechl...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Povędęl mi to mág Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //Brzy se stanou hrozné vęci.
	
	if (Vatras_First == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //(rozlícenę) Aha. A kdo ti to âekl?
	}
	else 
 	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //Hrozné vęci, hmmm... a jak to víš?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"No, nękde jsem nęco zaslechl...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Povędęl mi to mág Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = 2;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //Povędęl mi to mág Xardas a také mi nakázal, abych varoval paladiny.
	
	if (Vatras_Second == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //Vím, že tento muž je moudrý a mocný mistr magických vęd. A odkud pâicházíš ty?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //Nekromant... takže žije... (pâemýšlivę) a poslal tę sem? Kdo doopravdy jsi?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Jsem pouhým dobrodruhem z jihu...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Jsem bývalý trestanec...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //No, nękde jsem nęco zaslechl.
	
	if (Vatras_Second == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //(otrávenę) Pamatuješ si alespoŕ, odkud pâicházíš?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //Aha. A právę proto jsi podnikl tuhle cestu. Kdo doopravdy jsi?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Jsem dobrodruhem z dalekého jihu.",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Jsem bývalý trestanec...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = 2;
};
func VOID B_Vatras_INFLUENCE_REPEAT()
{
	//RAUS wegen ADDON
	//AI_Output (other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); //Und, gibst du mir jetzt deinen Segen?	
	
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); //Dobâe, tak si to shrŕme:
	
	if (Vatras_Third == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //Jsi bývalý trestanec,
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //Jsi dobrodruhem z dalekého jihu,
	};
	if (Vatras_Second  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //kterého sem poslal nekromant Xardas,
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //který se nękde doslechl,
	};
	if (Vatras_First  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //že naši zemi napadnou draci.
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //že se v brzké dobę stanou hrozné vęci.
	};
		
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //A tak jsi to pâišel ohlásit paladinům.
	if (Vatras_First   == TRUE)
	&& (Vatras_Second  == TRUE)
	&& (Vatras_Third   == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //To zní sice fantasticky, ale nezdá se mi, že bys mi lhal.
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //Proto musím uznat, že tvé pohnutky jsou ušlechtilé.
		
		AI_Output (self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //Chci ti dát šanci vstoupit do 'kruhu vody'.
		
		Info_ClearChoices  (DIA_Addon_Vatras_WannaBeRanger);
	}
	else 
	{
		AI_Output (self, other, "DIA_Vatras_Add_05_00"); //Myslím, že jsi mi neâekl úplnę všechno.
		AI_Output (self, other, "DIA_Vatras_Add_05_01"); //Jestli se bojíš, že bych mohl tvá slova nękomu vyzradit, pak nemęj strach.
		AI_Output (self, other, "DIA_Vatras_Add_05_02"); //Pâísahal jsem, že všechna tajemství, která mi nękdo svęâí, si ponechám pro sebe.
		if (Wld_IsTime(05,05,20,10))
		{
			AI_Output (other, self, "DIA_Vatras_Add_15_03"); //A co zdejší lidé?
			AI_Output (self, other, "DIA_Vatras_Add_05_04"); //Ti rozumí pouze polovinę toho, co jim KÁŽU, takže nemęj obavy.
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_05"); //Začnęme tedy znovu od začátku. Co je to za zprávu?
		
		//ADDON - SC kann nicht mehr versagen!
		//Vatras_Chance = TRUE; 
		Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Objevili se tu draci...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou hrozné vęci.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
	
	//else-Fall raus - Addon
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); //Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //Jsem bývalý vęzeŕ z trestanecké kolonie v Khorinidu.
	Vatras_Third = TRUE;
	
	B_Vatras_INFLUENCE_REPEAT();
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //Jsem dobrodruh z dalekého jihu.
	Vatras_Third = FALSE;
		
	B_Vatras_INFLUENCE_REPEAT();
}; 
// ************************************************************
// 			  			How to JOIN
// ************************************************************
// ------------------------------------------------------------
// Was muß ich tun?
// ------------------------------------------------------------
instance DIA_Addon_Vatras_HowToJoin	(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_HowToJoin_Condition;
	information	= DIA_Addon_Vatras_HowToJoin_Info;

	description	= "Co musím udęlat, abych se mohl stát členem 'kruhu vody'?";
};
func int DIA_Addon_Vatras_HowToJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_HowToJoin_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //Jak bych mohl vstoupit do toho vašeho kruhu?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //Vęz, že vstupem do kruhu na sebe bereš velkou zodpovędnost.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //Protože mezi nás nepustím jen tak každého, kdo o to požádá.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //Chceš-li vstoupit do kruhu, pak musíš dokázat, že jednáš jako jeden z nás.
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //A co to znamená?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //Než mezi nás pâijmeme nęjakého mladíka, musí pro kruh vykonat nęco velkého.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //Teprve pak možná začnu uvažovat o tom, zda ti svęâím udržování rovnováhy na tomto ostrovę.
	
	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "A jak bych tę tedy mohl nejlépe pâesvędčit?", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Osvobodil jsem spoustu lidí. Bariéra padla.", DIA_Addon_Vatras_HowToJoin_FreedMen );
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Pâemohl jsem Spáče, copak ti to nestačí?", DIA_Addon_Vatras_HowToJoin_Sleeper );
};
func void DIA_Addon_Vatras_HowToJoin_Sleeper ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //Pâemohl jsem Spáče, copak ti to nestačí?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //Poslední dobou slýchám spoustu povídaček.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //Včetnę pohádek o zahnání zrůdy zvané Spáč.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //Ale neslyšel jsem, že by to bylo dílem jednoho muže, i když ti z očí hledí pâesvędčení, že jsi to skutečnę udęlal.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //To mę trochu mate, ale smysly mohou občas klamat, takže jim nemohu úplnę vęâit.
};
func void DIA_Addon_Vatras_HowToJoin_FreedMen ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //Osvobodil jsem spoustu lidí. Bariéra padla.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //Když se k tomu SKUTEČNĘ pâiznáváš...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //Ta událost v Hornickém údolí osvobodila nejen mágy vody i jiné slušné lidi.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //Ale taky způsobila, že se po Khorinidu teë potulují bandy kriminálníků a sužují zdejší obyvatele.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //Za męstem už velkou část zemę obsadili banditi. Skoro už nemůžeš vyjít z bran a vrátit se bez úhony.
};
func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //Tak jakým skutkem bych tę mohl pâesvędčit?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //Khorinis nyní čelí velké záhadę.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //Spousta lidí z męsta se pohâešuje a jejich počet den ode dne roste.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //Jestliže vypátráš, co se s nimi stalo, pak tę pâijmu do kruhu vody.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras mę pâijme do 'kruhu vody', teprve až zjistím, kam se podęli pohâešovaní lidé."); 

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //I když...
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //Ano?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //...napâed bys męl doručit svou zprávu paladinům.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //To považuji za nejdůležitęjší vęc!
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //Promluv si s lordem Hagenem.
	
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras chce, abych lordu Hagenovi doručil důležitou zprávu."); 

	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
};
// ------------------------------------------------------------
// Hilf mir bei GILDE!
// ------------------------------------------------------------
instance DIA_Addon_Vatras_GuildBypass (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_GuildBypass_Condition;
	information	= DIA_Addon_Vatras_GuildBypass_Info;

	description	= "Jenže lord Hagen mę nepâijme!";
};
func int DIA_Addon_Vatras_GuildBypass_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_GuildBypass_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //Ale lord Hagen mę nepâijme!
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //Ale pâijme, nepochybuj o tom. POKUD se napâed staneš členem nękteré ze zdejších komunit.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //Náš kruh má dlouhé prsty.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //Pomůžeme ti doručit tu zprávu co nejdâív.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //Męl by sis o tom promluvit s Laresem, kterému vęâím. Pomůže ti.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Mám-li se dostat k lordu Hagenovi, musím se napâed pâipojit k nękteré khorinidské komunitę."); 
	

	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Udęlám to.", DIA_Addon_Vatras_GuildBypass_BACK );
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Ke komu bych se męl pâidat?", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};
func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //Udęlám to.
	Vatras_GehZuLares = TRUE;
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
};
func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //K jaké komunitę bych se męl pâidat?
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //Máme tu pouze tâi komunity, které mají nęjakou moc.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //Je to męstská domobrana, klášter mágů ohnę a banda žoldnéâů, která sídlí u statkáâe.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //Volba je na tobę, synu.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //Lares ti v tom obtížném rozhodování jistę pomůže. Promluv si s ním o tom.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Nejsilnęjšími komunitami jsou OHNIVÍ MÁGOVÉ, DOMOBRANA a ŽOLDNÉÂI, kteâí sídlí na statkáâovę farmę."); 
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Udęlám to.", DIA_Addon_Vatras_GuildBypass_BACK );
};
// ------------------------------------------------------------
// Ranger NOW 	(MissingPeople ist hier schon Succes!!!)
// ------------------------------------------------------------
instance DIA_Addon_Vatras_NowRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_NowRanger_Condition;
	information	= DIA_Addon_Vatras_NowRanger_Info;
	permanent	= TRUE;

	description	= "Jsem pâipraven vstoupit do 'kruhu vody'!";
};
func int DIA_Addon_Vatras_NowRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (SC_IsRanger == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_NowRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //Jsem pâipraven vstoupit do kruhu vody!
	AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //Takže jsi doručil zprávu lordu Hagenovi?
	
	if (Kapitel >= 2) //Pass-Schlüssel von Hagen
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //Ano.
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //Ale poslal mę do Hornického údolí, abych mu pâinesl nęjaký důkaz!
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //TY se musíš rozhodnout, co dęlat dál.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //Já považuji za důležité, že dostal tu zprávu. Zda podnikne nęjaké kroky, nebo počká na důkazy od tebe, to už záleží na nęm.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //A co se týče tebe...
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //Dobrá.
		};
		
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //Dokázal jsi, že jsi pro nás nepostradatelný. Staneš se jedním z našich dętí a budeš naším jménem plnit vůli Adanovu.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //Nyní ti svęâuji tento prsten kruhu vody. Kéž ti pomůže najít spojence a společnę nechă zachováte rovnováhu na tomto svętę.
		CreateInvItems (self, ItRi_Ranger_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Addon, 1);		
		if (hero.guild == GIL_KDF)
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //Jsi prvním ohnivým mágem v našich âadách, což mę dvojnásob tęší.
		};
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //Kéž tę Adanos provází. A teë jdi a setkej se se svými bratry.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //Budou na tebe čekat v hospodę U Mrtvé harpyje a pâijmou tę mezi sebe.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //Tu krčmu určitę znáš. Leží na cestę na Onarův statek.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //A nezapomeŕ nosit ten prsten, aby tví bratâi poznali, že patâíš mezi nę.
		
		B_LogEntry (TOPIC_Addon_RingOfWater,"Nyní patâím ke 'kruhu vody'. Se svými bratry se setkám v hospodę U Mrtvé harpyje."); 

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP (XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //Ne, ještę ne.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //Tak si pospęš a bęž za ním. Myslím, že tvá zpráva je velice důležitá!
	};
};
// ------------------------------------------------------------
// NACH RangerMeeting
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CloseMeeting		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_CloseMeeting_Condition;
	information	= DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Posílají mę k tobę bratâi z 'kruhu'.";
};
func int DIA_Addon_Vatras_CloseMeeting_Condition ()
{
	if (Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CloseMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //Posílají mę za tebou bratâi z kruhu vody.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //Dobâe! Čekal jsem na tebe!
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //Pošlu tę i s ostatními mágy vody skrz portál.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //Musíš vystopovat bývalého rudobarona Havrana a zjistit, proč unášel lidi z Khorinidu.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //My tu zatím budeme pokračovat v boji s hrozbou, kterou pâedstavují bandité.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //Zanes tento dopis Saturasovi. Další úkoly už ti zadá on.
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //Lares tę k nęmu zavede, pokud mu tedy už nedoručil ten ornament.
	};
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven, 1);									
	B_GiveInvItems (self, other, ItWr_Vatras2Saturas_FindRaven, 1);	
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //Kéž tę Adanos provází.
		
	B_LogEntry (TOPIC_Addon_KDW,"Vatras mi dal dopis pro Saturase. S ostatními mágy vody mám projít portálem a sledovat stopu bývalého rudobarona Havrana."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Sklaven,"Musím zjistit, proč Havran unášel khorinidské občany."); 


	RangerMeetingRunning = LOG_SUCCESS; //Joly:Muss hier stehen!Sonst Chaos mit Rangern! -> Meeting
	B_SchlussMitRangerMeeting ();
	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// 			  			Missing People
// ************************************************************
// ------------------------------------------------------------
// MissingPeople PERM
// ------------------------------------------------------------
var int MISSINGPEOPLEINFO[20];
// ------------------------------------------------------------
instance DIA_Addon_Vatras_MissingPeople (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_MissingPeople_Condition;
	information	= DIA_Addon_Vatras_MissingPeople_Info;
	permanent	= TRUE;
	description	= "K tęm pohâešovaným lidem...";
};
func int DIA_Addon_Vatras_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};
var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;
func void DIA_Addon_Vatras_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //Co se týče tęch pohâešovaných lidí...
	AI_Output (self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //Ano?
	
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice (DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Já vím, kde jsou!", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Dovol mi povędęt, co vím...", DIA_Addon_Vatras_MissingPeople_Report);
	};
	
	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Kde bychom je męli začít hledat?", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};
func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
};
func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //Kde bych męl začít s pátráním?
	AI_Output (self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //Nejvíce lidí zmizelo dole v pâístavu, takže tam bys męl nejspíš začít.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Vętšina pohâešovaných lidí bydlela v khorinidském pâístavu. Tam bych možná męl se svým pátráním začít."); 
	
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};
func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //Dovol mi povędęt, co vím...
	
	 if ((MIS_Akil_BringMissPeopleBack != 0)
	 || (MIS_Bengar_BringMissPeopleBack != 0))
	 &&	(MISSINGPEOPLEINFO[1] == FALSE)
	 {
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //O pár lidí pâišli i zdejší sedláci.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	 };
	
	if ((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //Zjistil jsem, že všechna ta zmizení lidí mají na svędomí bandité.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //Elvrich, učedník mistra Thorbena, mi âekl, že bandité ty lidi unášeli z Khorinidu po moâi.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	
	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //Takže jsou v tom zapletení i piráti, ale ještę jsem pâesnę nezjistil, jakou roli v té vęci hráli.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};	
	
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //Zachránil jsem Elvricha z rukou banditů.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //Bandité odvlekli i dęvče jménem Lucia.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	
	if ((Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //Lucia, kterou bandité unesli, se rozhodla k nim pâidat.
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //Vážnę to vypadá, že to udęlala dobrovolnę.
		};
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};
		
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //Velitel banditů se jmenuje Dexter. To on má na svędomí ty únosy.
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //Dextera znám ještę z trestanecké kolonie. Pracoval tam pro rudobarona Gomeze.
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //Určitę se na tebe taky pamatuje. Buë opatrný.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //Myslím, že jsi na správné stopę. Jen tak dál.
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports );
		B_GivePlayerXP (XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //Co jsi zjistil?
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //Zatím nic důležitého.
	};
};
func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //Vím, kde jsou ti pohâešovaní lidé.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //Co jsi zjistil?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //Jistý Havran je unášel do vzdálené části Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //A z čeho tak soudíš?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //Četl jsem jeho rozkazy. Pâesvędčil místní bandity, aby pro nęho pracovali.
	if (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	{	
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //Tady.
		B_UseFakeScroll ();
	};
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //Dobâe. Odvedls pękný kus práce. Už jsem se bál, že to budeme muset vzdát a pravdu se nikdy nedozvíme.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Vatras_WhereAreMissingPeople);
};
// ------------------------------------------------------------
// Gefangene befreit
// ------------------------------------------------------------
instance DIA_Addon_Vatras_Free (C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Vatras_Free_Condition;
	information	 = 	DIA_Addon_Vatras_Free_Info;
	permanent	 =  FALSE;
	description	 = 	"Zmizelí lidé se zase vrátili!";
};
func int DIA_Addon_Vatras_Free_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Free_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Free_15_00"); //Ti pohâešovaní lidé už jsou zpátky.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_01"); //Ano, zvládl jsi to. Jejich cesta došla ke šăastnému konci.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_02"); //Avšak naše vlastní cesta ještę zdaleka neskončila. Tak nechă tę Adanos provází.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_03"); //(modlí se) Adane, požehnej tomuto muži. Osvętluj mu cestu a dej mu sílu, aby pâestál všechna nebezpečí.
	
	B_RaiseAttribute (other, ATR_MANA_MAX, 3);
	other.attribute[ATR_MANA]	   = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	
	Snd_Play ("Levelup");
	
	// ***Mike** Auskommentiert, weil FALSCHE funktion - bitte Rücksprache, bevor du's wieder änderst
	//var string concatText;
	//concatText = ConcatStrings (NAME_Bonus_ManaMax,IntToString (4));
	//PrintScreen (concatText, -1,-1,FONT_ScreenSmall,2); 
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_Waffen (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Waffen_Condition;
	information	= DIA_Addon_Vatras_Waffen_Info;
	permanent 	= TRUE;
	description = "K tomu obchodníkovi se zbranęmi...";
};
func int DIA_Addon_Vatras_Waffen_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_15_00"); //Co se týče toho obchodníka se zbranęmi...
	
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
	Info_AddChoice (DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if (Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Už vím, kdo banditům prodával ty zbranę!", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Co o tom obchodníkovi se zbranęmi zatím víš?", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};
func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
};
func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //Co už ses o tom obchodníkovi se zbranęmi dozvędęl?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //Tak na tohle se zeptej Martina, skladníka paladinů. Ten ti v téhle vęci poví víc.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //To on má vypátrat toho obchodníka se zbranęmi.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //Martina najdeš v pâístavní čtvrti. Až uvidíš hromadu beden, potravin a paladinů, Martin nebude daleko.
		
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //Už vím, kdo banditům prodával zbranę!
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //Jmenuje se Fernando.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //Výbornę. Podnikl Martin potâebné kroky, aby zamezil dalším dodávkám?
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //Ano. Martin dohlédne, aby ten chlápek nęjakou dobu nevylezl z basy.
		AI_Output	(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //Výbornę, synu.

		if (Npc_KnowsInfo (other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //(drze) Znamená to, že mę teë pâijmeš do kruhu vody?
			AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //(usmívá se) TAKHLE jsme se nedohodli - a ty to moc dobâe víš.
		};
		
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //Kéž ti Adanos osvętluje cestu.
		
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //Ještę ne.
		AI_Output	(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //Pak si pospęš a hned ho bęž ohlásit. Musíme ho co nejdâív zastavit.
	};
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_WISP (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_WISP_Condition;
	information	= DIA_Addon_Vatras_WISP_Info;

	description = "Nevíš o nęčem, co by mi to pátrání mohlo usnadnit?";
};
func int DIA_Addon_Vatras_WISP_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WISP_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //Nevíš o nęčem, co by mi to pátrání usnadnilo?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //Jsi velmi neodbytný, mladíku. Ale vlastnę bych vędęl o nęčem, co by ti mohlo tvé úkoly usnadnit.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //Dám ti tento amulet z rudy. Určitę se ti bude hodit.
	CreateInvItems (self, ItAm_Addon_WispDetector, 1);									
	B_GiveInvItems (self, other, ItAm_Addon_WispDetector, 1);
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //Je to amulet pátrací bludičky.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //Takových amuletů je na svętę jen nękolik. Bludička, která v každém z nich sídlí, má velice zvláštní schopnosti.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //Pomůže ti hledat vęci, které bys prostým okem nezahlédl.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //Vyvoláš ji velice jednoduše - stačí si nasadit amulet.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //Pokud ztratí svou moc nebo když ji nebudeš moci najít, znovu si nasaë amulet a bludička se znovu objeví.
	
	B_LogEntry (TOPIC_Addon_BanditTrader,"Vatras mi dal 'amulet pátrací bludičky', který by mi męl to pátrání po obchodníku se zbranęmi trochu ulehčit."); 
	Log_CreateTopic (TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned); 
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned_NF); 

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //Bludička dokáže hledat zbranę.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //To se ti hodí, až budeš pátrat po tęch dodávkách výzbroje pro bandity.
	};

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //Když budeš svou bludičku dobâe opatrovat, nikdy tę nezklame.

	Info_ClearChoices (DIA_Addon_Vatras_WISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Díky! Budu ho opatrovat jako oko v hlavę!", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Dokáže ta bludička i nęco jiného?", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Bludička v amuletu?", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;	
};
func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //Díky! Budu jej stâežit jako oko v hlavę.
	Info_ClearChoices (DIA_Addon_Vatras_WISP);
};
func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //Dokáže ta bludička i nęco jiného?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //Víc než hledat chladné zbranę? Ne, pokud ji to nenaučíš.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //Myslím, že v tęchto vęcech se nejlépe vyzná Riordan. Je jedním z nás - zrovna na cestę provází Saturase.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //Snad ti poví více.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"Bludička dokáže hledat nejen zbranę nablízko. Vodní mág Riordian ji může naučit pátrat i po jiných vęcech."); 
	};
};
func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //Bludičku v amuletu?
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //Bludičky jsou obdivuhodná stvoâení. Jsou stvoâeny z čisté magické energie.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //Na tomto svętę jsou spjaty s magickou rudou. Z ní pocházejí a zní čerpají svou sílu.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //Nepâekvapuje mę, že jsi o nich nikdy neslyšel. Zjeví se totiž pouze tomu, kdo má u sebe rudu, k níž patâí.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //Divoké bludičky byly násilím oddęleny od svých zdrojů, a proto napadnou každého, kdo se k nim pâiblíží.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //Takovým ubohým bytostem už se nedá pomoci. Spíš by ses męl od nich držet dál.
};

// ********************************************************
// 			  			  STONEPLATES
// *********************************************************
// ---------------------------------------------------------
// About Stoneplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_Stoneplate (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_Stoneplate_Condition;
	information	= DIA_Addon_Vatras_Stoneplate_Info;

	description	= "Našel jsem tuhle kamennou tabulku...";
};

func int DIA_Addon_Vatras_Stoneplate_Condition ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //Získal jsem tuhle kamennou tabulku. Můžeš mi o ní âíct nęco bližšího?
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //Jsou to artefakty jedné staré kultury, kterou už nęjakou dobu studujeme.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //Rozlišujeme nękolik typů. Nękteré obsahují informace o historii dávného lidu.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //A právę ty mne nejvíce zajímají. Pâines mi všechny, které najdeš.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //Dám ti za nę náležitou odmęnu.

	Log_CreateTopic (TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Stoneplates, LogText_Addon_VatrasTrade); 
	
	Log_CreateTopic (TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, LogText_Addon_VatrasTrade);

};
// ---------------------------------------------------------
// Sell Stonplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_SellStonplate		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_SellStonplate_Condition;
	information	= DIA_Addon_Vatras_SellStonplate_Info;
	permanent 	= TRUE;
	description	= "Mám pro tebe další kamenné tabulky...";
};
func int DIA_Addon_Vatras_SellStonplate_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_Stoneplate))
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_SellStonplate_Info ()
{
	var int anzahl; anzahl = Npc_HasItems (other, ItWr_StonePlateCommon_Addon);
	
	if (anzahl == 1)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //Mám pro tebe další kamennou tabulku.
	}
	else 
	{
		//Fixme Joly --> Hier SC-output "Hier.." oder ähnliche --Mike
	};
	
	B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, anzahl);
		
	AI_Output	(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //Výbornę!
	
	if (anzahl >= 10)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //Zvýším ti magickou energii!
		B_RaiseAttribute	(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute	(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //Tumáš, za odmęnu si vezmi pár magických svitků.
		B_GiveInvItems (self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tränke
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //Tumáš, za odmęnu si vezmi pár lektvarů.
		B_GiveInvItems (self, other, ItPo_Health_03, anzahl+1);
	};
	
	B_GivePlayerXP (XP_Addon_VatrasStonplate);
};

// *********************************************************
// 			  			KLOSTER BYPASS
// *********************************************************
var int Vatras_SentToDaron;
// -----------------------------
instance DIA_Addon_Vatras_GuildHelp		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_GuildHelp_Condition;
	information	 = 	DIA_Addon_Vatras_GuildHelp_Info;

	description	 = 	"Lares tvrdí, že prý mi můžeš pomoci dostat se do kláštera ohnivých mágů.";
};

func int DIA_Addon_Vatras_GuildHelp_Condition ()
{
	if (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //Lares âíkal, že mi dokážeš pomoci vstoupit do kláštera mágů ohnę.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //To je tedy tvá volba? Cesta ohnę?
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //Ano. Chci se stát ohnivým mágem.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //Pokud vím, v klášteâe je každý novic vítán. Proč tedy potâebuješ mou pomoc?

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //Novic pâed klášterem mne dovnitâ pustí, teprve až mu zaplatím za vstup. Chce po mnę ovci a hromadu zlata.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //Lares se zmiŕoval, že každý, kdo chce vstoupit do kláštera, musí napâed zaplatit.
	};	
	
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //Já sám ti ale vstup do kláštera zaručit nemohu. Jak víš, patâím k mágům vody. Ale velmi dobâe se znám s ohnivým mágem Daronem.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //Ten se zdržuje hlavnę tady na tržišti, kde vybírá milodary pro svůj chrám.
	Vatras_SentToDaron = TRUE;
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //Ale doslechl jsem se, že to není jediný důvod, proč tady ve męstę pobývá.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //Vyprávęl mi, že mu pâed časem ukradli nęjakou sošku.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //Je pro nęho velice důležitá. Když mu ji pâineseš, určitę ti zjedná pâístup do kláštera.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //A nezapomeŕ - i když se rozhodneš pâipojit ke kruhu ohnę, nebude ti vstup do kruhu vody odepâen.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //Dokázal jsi svou cenu, to je pravda.
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Ohnivý mág Daron, který stojí na tržišti, mi pomůže proniknout do kláštera, pokud mu najdu ztracenou sošku."); 
};


// ************************************************************
// ***														***
//							Gothic II 
// ***														***
// ************************************************************

// ============================================================
// MORE 	(Wegen der alten Scheiße...)
// ============================================================
instance DIA_Vatras_MORE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	998;
	condition	 = 	DIA_Vatras_MORE_Condition;
	information	 = 	DIA_Vatras_MORE_Info;
	permanent    =  TRUE;
	description	 = 	"(Více)";
};
func int DIA_Vatras_MORE_Condition ()
{
	if (Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MORE_Info ()
{
	Vatras_MORE = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info INFLUENCE (SEGEN)
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INFLUENCE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	92;
	condition	 = 	DIA_Vatras_INFLUENCE_Condition;
	information	 = 	DIA_Vatras_INFLUENCE_Info;
	permanent    =  FALSE;
	description	 = 	"Dej mi prosím své požehnání.";
};
func int DIA_Vatras_INFLUENCE_Condition ()
{
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	}; 
};
func void DIA_Vatras_INFLUENCE_Info ()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_00"); //Dej mi prosím své požehnání.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_01"); //A proč bych ti męl požehnat, cizinče?
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_02"); //Chci se stát učedníkem u jednoho z mistrů v dolní části męsta.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //Jdi s Adanovým požehnáním, synu!
	Snd_Play ("LevelUp");
	B_GivePlayerXP (XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry (TOPIC_Thorben,"Mág vody Vatras mi požehnal.");
};

///////////////////////////////////////////////////////////////////////
//	Info WoKdF
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_WoKdF (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  93;
	condition	 = 	DIA_Vatras_WoKdF_Condition;
	information	 = 	DIA_Vatras_WoKdF_Info;
	permanent    =  FALSE;
	description	 = 	"Kde bych našel Innosova knęze?";		
};

func int DIA_Vatras_WoKdF_Condition ()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Vatras_Segen == TRUE)
	&& (Vatras_SentToDaron == FALSE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_WoKdF_Info ()
{
	AI_Output (other, self, "DIA_Vatras_WoKdF_15_00"); //Kde bych našel Innosova knęze?
	AI_Output (self, other, "DIA_Vatras_WoKdF_05_01"); //Nejlépe bude, když se rozhlédneš po tržišti. Tam na nękoho z kláštera jistę narazíš.
};

///////////////////////////////////////////////////////////////////////
//	Info Spende
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Spende (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  94;
	condition	 = 	DIA_Vatras_Spende_Condition;
	information	 = 	DIA_Vatras_Spende_Info;
	permanent    =  TRUE;
	description	 = 	"Rád bych Adanovi poskytl milodar!";
};

func int DIA_Vatras_Spende_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Spende_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Spende_15_00"); //Rád bych Adanovi poskytl dar!
	AI_Output (self, other, "DIA_Vatras_Spende_05_01"); //Darem Adanovu chrámu smyješ část hâíchů, které jsi možná spáchal, synu.
	AI_Output (self, other, "DIA_Vatras_Spende_05_02"); //Kolik můžeš vęnovat?
	
	Info_ClearChoices   (DIA_Vatras_Spende);
	Info_AddChoice 		(DIA_Vatras_Spende, "Zrovna teë nemám penęz nazbyt...", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Mám u sebe 50 zlaăáků...", DIA_Vatras_Spende_50);
	};
	if (Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Mám u sebe 100 zlaăáků...",	DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output (other, self, "DIA_Vatras_Spende_BACK_15_00"); //Zrovna teë nemám penęz nazbyt.
	AI_Output (self, other, "DIA_Vatras_Spende_BACK_05_01"); //To nevadí, své dobré úmysly můžeš vyjádâit pozdęji, synu.
	Info_ClearChoices   (DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output (other, self, "DIA_Vatras_Spende_50_15_00"); //Mám u sebe 50 zlaăáků.
	AI_Output (self, other, "DIA_Vatras_Spende_50_05_01"); //Dękuji ti ve jménu Adana, synu. Tvé zlato bude rozdęleno mezi potâebné.
	B_GiveInvItems (other, self, Itmi_Gold, 50);
	Info_ClearChoices   (DIA_Vatras_Spende);
};
	
func void DIA_Vatras_Spende_100()
{
	AI_Output (other, self, "DIA_Vatras_Spende_100_15_00"); //Mám u sebe 100 zlaăáků.
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_01"); //Za tento šlechetný čin ti ve jménu Adana žehnám!
	Snd_Play ("LevelUp");
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_02"); //Nechă ti Adanos na tvé cestę požehná!
	B_GiveInvItems (other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices   (DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Thorben,"Mág vody Vatras mi požehnal.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_CanTeach		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  95;
	condition	 = 	DIA_Vatras_CanTeach_Condition;
	information	 = 	DIA_Vatras_CanTeach_Info;
	permanent    =  FALSE;
	description	 = 	"Můžeš mę naučit nęco o magii?";
};

func int DIA_Vatras_CanTeach_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_CanTeach_15_00"); //Můžeš mę naučit nęco o magii?
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_01"); //Pouze vyvoleným Innose nebo Adana je dovoleno používat runovou magii.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_02"); //Ale obyčejní smrtelníci mohou používat magii za pomoci kouzelných svitků.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_03"); //Mohu ti ukázat, jak lze získat a rozšiâovat magické schopnosti.
	
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Mág vody Vatras mi pomůže zvýšit magickou moc.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Teach		(C_INFO)
{
	npc		  	 = 	VLK_439_Vatras;
	nr			 = 	100;
	condition	 = 	DIA_Vatras_Teach_Condition;
	information	 = 	DIA_Vatras_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtęl bych posílit svoji magickou moc.";
};
func int DIA_Vatras_Teach_Condition ()
{	
	if (Vatras_TeachMANA == TRUE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Teach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Teach_15_00"); //Chtęl bych posílit svoji magickou moc.
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
};
func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output (self, other, "DIA_Vatras_Teach_05_00"); //Tvá magická moc pâesáhla mé schopnosti.
	};
	Info_ClearChoices (DIA_Vatras_TEACH);
};
func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_TEACH_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info GODS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_GODS		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	98;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_GODS_Condition;
	information	 = 	DIA_Vatras_GODS_Info;
	permanent	 =  TRUE;
	description	 = 	"Povęz mi nęco o bozích.";
};

func int DIA_Vatras_GODS_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GODS_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_15_00"); //Âekni mi nęco o bozích.
	AI_Output			(self, other, "DIA_Vatras_GODS_05_01"); //Co pâesnę bys chtęl vędęt?
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK);
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Innosovi.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Adanovi.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Beliarovi.",DIA_Vatras_GODS_BELIAR); 		 
	 		 
};
FUNC VOID DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices (DIA_Vatras_GODS); 
};
FUNC VOID DIA_Vatras_GODS_INNOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_INNOS_15_00"); //Âekni mi nęco o Innosovi.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //Velmi dobâe. (káže) Innos je prvním a nejvyšším bohem. Stvoâil slunce a svęt.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //Ovládá svętlo a oheŕ, své dary lidstvu. Je ztęlesnęním âádu a spravedlnosti.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //Jeho knęží jsou ohniví mágové, paladinové jsou jeho válečníky.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Innosovi.",DIA_Vatras_GODS_INNOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Adanovi.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Beliarovi.",DIA_Vatras_GODS_BELIAR); 	
	
};
FUNC VOID DIA_Vatras_GODS_ADANOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //Âekni mi nęco o Adanovi.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //Adanos je bůh stâedu. Vymezuje právo a je strážcem rovnováhy mezi Innosem a Beliarem.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //Ovládá sílu pâemęn, jeho darem je voda všech oceánů, jezer a âek.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //Jeho knęží jsou vodní mágové, stejnę jako já jsem služebníkem a knęzem Adanovým.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 	
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Innosovi.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Beliarovi.",DIA_Vatras_GODS_BELIAR); 	

};
FUNC VOID DIA_Vatras_GODS_BELIAR()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //Âekni mi nęco o Beliarovi.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //Beliar je temný bůh smrti, zkázy a všech nepâirozených vęcí.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //Vede vęčnou válku s Innosem, ale Adanos bdí nad tím, aby byly jejich síly stále vyrovnané.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //Pouze nękolik málo lidí následuje volání Beliara - nicménę on tęm, kdo tak činí, zajistí velkou moc.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Innosovi.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Adanovi.",DIA_Vatras_GODS_ADANOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Povęz mi nęco o Beliarovi.",DIA_Vatras_GODS_BELIAR); 			 
	
};
///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HEAL		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	99;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_HEAL_Condition;
	information	 = 	DIA_Vatras_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Můžeš mę vyléčit?";
};

func int DIA_Vatras_HEAL_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HEAL_15_00"); //Můžeš mę vyléčit?
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_01"); //(zbožnę) Adane požehnej tomuto tęlu. Vyzdrav jeho zranęní a posil ho novým životem.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_02"); //Právę teë nepotâebuješ žádné magické léčení.
	};	
};

// ********************************************************************
// 							Isgaroth Mission
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MISSION		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MISSION_Condition;
	information	= DIA_Vatras_MISSION_Info;
	
	important	= TRUE;
};
func int DIA_Vatras_MISSION_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
func void DIA_Vatras_MISSION_Info ()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_10"); //Mám zprávu pro mistra Isgarotha. Stâeží svatyni pâed klášterem.
	AI_Output (self, other, "DIA_Vatras_MISSION_05_01"); //Když mu ji doručíš, získáš odmęnu podle vlastního výbęru.
	
	Info_ClearChoices   (DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Teë ne.",DIA_Vatras_MISSION_NO);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Jasnę.",DIA_Vatras_MISSION_YES);
};
FUNC VOID B_SayVatrasGo()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_13"); //Dobâe. Tak teë pokračuj ve své cestę k mistru Isgarothovi.
};
func VOID DIA_Vatras_MISSION_YES()
{
	AI_Output (other, self, "DIA_Vatras_MISSION_YES_15_00"); //Udęlám to.
	AI_Output (self, other, "DIA_Vatras_Add_05_11"); //Dobrá, tak si vezmi tu zprávu a vyber si jeden z tęchto kouzelných svitků.
	AI_Output (self, other, "DIA_Vatras_Add_05_12"); //Až doručíš tu zprávu, čeká tę náležitá odmęna.
	
	B_GiveInvItems (self, hero, ItWr_VatrasMessage,1); 
	MIS_Vatras_Message = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Botschaft,LOG_RUNNING);
	B_LogEntry (TOPIC_Botschaft,"Vatras mi pâedal zprávu pro mistra Isgarotha, kterého najdu ve svatyni naproti klášteru.");
	
	Info_ClearChoices 	(DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Vezmu si kouzlo svętla.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Vybral jsem si léčivý svitek.",DIA_Vatras_MISSION_HEAL);	
	Info_AddChoice 		(DIA_Vatras_MISSION,"Dej mi kouzlo 'ledový šíp'.",DIA_Vatras_MISSION_ICE);	
};
FUNC VOID DIA_Vatras_MISSION_NO ()
{	
	//AI_Output	(other, self, "DIA_Vatras_MISSION_NO_15_00"); //Such dir einen anderen Laufburschen, alter Mann!
	AI_Output (other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //Teë ne!
	AI_Output (self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //V poâádku, pošlu tedy nękoho jiného.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_HEAL()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //Vybral jsem si léčivý svitek.
	 B_SayVatrasGo();
	 
	B_GiveInvItems (self, hero,ItSc_LightHeal ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_ICE()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //Dej mi ledový šíp.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Icebolt ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_LIGHT()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //Vezmu si kouzlo svętla.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Light ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MESSAGE_SUCCESS		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information	= DIA_Vatras_MESSAGE_SUCCESS_Info;
	
	description	= "Doručil jsem tvou zprávu.";
};

func int DIA_Vatras_MESSAGE_SUCCESS_Condition ()
{	
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& (Vatras_Return == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MESSAGE_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //Doručil jsem tvou zprávu.
	AI_Output (self, other, "DIA_Vatras_Add_05_14"); //Pâijmi mé díky. A teë si vezmi svou odmęnu.
	
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	
	Info_ClearChoices (DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 královský šăovík",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"Prsten dovednosti",DIA_Vatras_MESSAGE_SUCCESS_Ring);	
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 hrudka rudy",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems (self, hero,ItPl_Perm_Herb ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems (self, hero,ItRi_Dex_01 ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems (self, hero,ItMI_Nugget ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

////////////////////////// Geht weg //////////////////////////////////
const int kurz = 0;
const int lang = 1;

var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg (var int dauer)
{
	// EXIT IF
	
	if (Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	
	//FUNC
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500)
	&& (Npc_WasInState (self, ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP (self);
		
		AI_Output (self, other, "DIA_Vatras_Add_05_06"); //Slyšte, lidé! Je mę potâeba nękde jinde.
		if (dauer == kurz)
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_07"); //Nebude to mít dlouhého trvání. Až se vrátím, dopovím vám zbytek pâíbęhu.
		}
		else //lang
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_08"); //Nevím, jestli se ještę vrátím. Pokud chcete znát konec, pâečtęte si ten pâíbęh v Písmu.
			
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_09"); //Adanos s vámi!
		
		B_TurnToNpc (self, other);
	};
	
	Vatras_SchickeLeuteWeg = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AbloesePre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AbloesePre		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AbloesePre_Condition;
	information	 = 	DIA_Addon_Vatras_AbloesePre_Info;

	description	 = 	"Mám tenhle problém s Innosovým okem.";
};

func int DIA_Addon_Vatras_AbloesePre_Condition ()
{
	if ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE))
	&& (Kapitel == 3)
	&& (VatrasCanLeaveTown_Kap3 == FALSE)
	&& (RavenIsDead == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Vatras_AbloesePre_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //Mám problém s Innosovým okem. Potâebuji pomoc.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //A budu kvůli tomu muset odejít z męsta?
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //Nevím, je to možné.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //Už nękolik dní čekám, až mne tu nękdo vystâídá. Ostatní vodní mágové se do Khorinidu męli vrátit už pâed časem.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //Jestli dokážeš zaâídit, aby se aspoŕ jeden z nich ujal mých povinností tady ve męstę, rád ti pomohu tvůj problém vyâešit.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Ve vęci s Innosovým okem mi Vatras nepomůže, dokud za nęj nęjaký jiný vodní mág nepâevezme povinnosti ve męstę."); 
};

///////////////////////////////////////////////////////////////////////
//	Info AddonSolved
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AddonSolved		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AddonSolved_Condition;
	information	 = 	DIA_Addon_Vatras_AddonSolved_Info;

	description	 = 	"Nękdo tę pâišel vystâídat.";
};

func int DIA_Addon_Vatras_AddonSolved_Condition ()
{
	 if (RavenIsDead == TRUE)
	 {
		return TRUE;
	 };
};

func void DIA_Addon_Vatras_AddonSolved_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //Nękdo tę pâišel vystâídat.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //Už se ty záležitosti v horách na severovýchodę urovnaly?
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //Ano, urovnaly. Havran je mrtvý. Už nám odtud nic nehrozí.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //To je vážnę dobrá zpráva. Doufejme, že se nic podobného už nestane.

	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //A TEË se podíváme na ten tvůj malý problém.
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //Myslím, že se týká Innosova oka, že?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info InnoseyeKaputt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INNOSEYEKAPUTT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information	 = 	DIA_Vatras_INNOSEYEKAPUTT_Info;

	description	 = 	"Innosovo oko je rozbité.";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition ()
{
		if 	(	(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)	)
		&& (Kapitel == 3)
		&& (VatrasCanLeaveTown_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info ()
{
	if (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //Posílá mę Pyrokar.
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //Posílá mę Xardas.
	};

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);

	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //Innosovo oko je rozbité.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //Já vím. Slyšel jsem o tom od nęjakých velmi rozrušených noviců.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //Pátrači zneužili kruh slunce mágů ohnę ke zničení Oka.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //Âekl bych, že jsou ovládáni nepâítelem.

	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Po tomhle męstę se novinky šíâí rychle.", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten );

	if (hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Proč si Pyrokar ze všech lidí vybral právę tebe?", DIA_Vatras_INNOSEYEKAPUTT_warumdu );
	};
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Co se stane s Okem teë?", DIA_Vatras_INNOSEYEKAPUTT_Auge );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //Co se stane s Okem teë?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //Musíme ho znovu spravit. Ale bojím se, že to nebude jen tak.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //Objímka se rozbila na dva kusy. Zručný kováâ by si s tím męl umęt poradit.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //Ale tohle není ten problém. Co mi dęlá starosti, je samotný drahokam.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //Je matný a bez moci. Zdá se, že nepâítel pâesnę vędęl, jak ho oslabit.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Kde bych našel kováâe, který by to dokázal opravit?", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Jak může drahokam získat zpęt svoji sílu?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //Jak může drahokam získat zpęt svoji sílu?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //Vidím jen jedinou cestu. Spojení tâí vládnoucích bohů by mohlo zajistit potâebný efekt.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //Dobâe pâipravený rituál zvratu provedený na místę zničení vrátí drahokamu jeho sílu.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //Nicménę problém je, že na to místo musíš dostat pozemské zástupce každého ze tâí bohů.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //Navíc je potâeba mnoho trávy z bažin. Odhaduju, že to budou nejménę tâi rostlinky.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Kdo by męli být ti tâi pozemští zástupci bohů?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Kde najdu tu trávu z bažin?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //Kde najdu tu trávu z bažin?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //Slyšel jsem o staré mastičkáâce v lesích, co si âíká Sagitta. Mohla by ti ty rostliny prodat.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //Ale taky bys mohl zkusit štęstí dole v pâístavu.
	

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //Kdo by męli být ti tâi pozemští zástupci bohů?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //Adana bych męl zastupovat já sám.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //Pyrokar, nejvyšší ohnivý mág, bude ten pravý pâedstavitel boha Innose.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //Ale pro Beliara nevím, koho vybrat. Musí to být nękdo, kdo ovládá černou magii.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Temnou magii? Co Xardas?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //Černou magii? Co Xardas?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //To je ono. To by mohlo fungovat.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //Ale ptám se sám sebe, jak ty tâi dostat k sobę.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //Dokážu si pâedstavit, jak se Pyrokar bude tváâit, až se dozví, že musí spolupracovat s Xardasem.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Už musím jít.", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter );
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //Kde najdu kováâe schopného opravit objímku Oka?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //Poptej se tady po okolí po nękom, kdo umí opravit šperk.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //Proč si Pyrokar ze všech lidí vybral právę tebe?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //Męl jsem podezâení, že se dâíve či pozdęji nęco podobného pâihodí.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //Pyrokar se vždycky považoval za tak nezranitelného a mocného, že to skoro hraničilo s nerozvážností.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //Proto byla jeho opatâení na ochranu Oka také tak... ehm, lajdácká.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //Prostę si myslím, že mimovolnę spoléhal na schopnosti, jež mi Adanos propůjčil.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //Radęji ani nemyslím na to, co by se mohlo stát, kdybych teë nebyl k dispozici.

};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //Po tomhle męstę se novinky šíâí rychle.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //Taky dobâe. Nepâítel se stejnę bude mít na pozoru.

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //Už musím jít.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //Musím vyrazit a pâipravit v kruhu slunce ten rituál.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //Pošli tam Xardase a Pyrokara. A nezapomeŕ pâinést trávu z bažin. Spoléhám na tebe.
	
	B_LogEntry (TOPIC_INNOSEYE, "Podle Vatrase mohu Oku navrátit moc pouze tak, že vykonám rituál v kruhu Slunce. Musím ovšem pâimęt Xardase a Pyrokara, aby se ho také zúčastnili, a zároveŕ najít kováâe, který dokáže rozbitý amulet opravit.");

	MIS_RitualInnosEyeRepair = LOG_RUNNING;
	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine	(self,"RITUALINNOSEYEREPAIR");

	
	// ------ Zuhörer weg -------
		B_Vatras_Geheweg (kurz);
	// --------------------------
	
	//Joly: Weg mit den Ritualdementoren!!!!!

	DMT_1201.aivar[AIV_EnemyOverride] = TRUE;	//Joly: Damit sie erstmal nicht die Welt entvölkern, ohne Zutun des Spielers!!!!!
	DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1203.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1205.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1208.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1211.aivar[AIV_EnemyOverride] = TRUE;

	B_StartOtherRoutine (DMT_1201 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1202 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1203 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1204 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1205 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1206 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1207 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1208 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1209 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1210 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1211 ,"AfterRitual");
};
///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_RitualInnosEyeRepair		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_RitualInnosEyeRepair_Condition;
	information	 = 	DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak se to má s Innosovým okem?";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_RitualInnosEyeRepair_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_RitualInnosEyeRepair_15_00"); //Jak se to má s Innosovým okem?
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //Pamatuj: jedinę rituál zvratu v kruhu slunce, jehož se zúčastní i Xardas a Pyrokar, může Oku navrátit sílu.
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //A nezapomeŕ pâinést Oko s opravenou objímkou.
};

///////////////////////////////////////////////////////////////////////
//	Info Beginn
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_BEGINN		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	31;
	condition	 = 	DIA_Vatras_BEGINN_Condition;
	information	 = 	DIA_Vatras_BEGINN_Info;

	description	 = 	"Už jsem udęlal všechno, jak jsi chtęl.";
};

func int DIA_Vatras_BEGINN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_GetDistToWP(self,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Xardas,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Pyrokar,	"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
		&& (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Vatras_BEGINN_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_00"); //Udęlal jsem vše, co jsi âekl. Tady je opravené Oko.
	B_GivePlayerXP (XP_RitualInnosEyeRuns);

	B_GiveInvItems 		(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem 	(self, ItMi_InnosEye_Broken_MIS);

	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_01"); //Teë už nic nebrání provedení rituálu.
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_02"); //A co tráva z bažin?
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_03"); //Á, ano. Tak máš ty tâi rostlinky?
	
	if (B_GiveInvItems (other, self, ItPL_SwampHerb,3))
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_04"); //Ahem. Ano. Tady jsou ty tâi rostlinky.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_05"); //Výbornę.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_06"); //Ne. Bohužel ne.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_07"); //Dobrá. Tak to budeme muset udęlat bez nich.
	};
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_08"); //Udęlals to dobâe, ale teë se postav kousek stranou, aă můžeme začít s rituálem. Nechă se naše duše spojí.
 	
	Info_ClearChoices	(DIA_Vatras_BEGINN);
	Info_AddChoice	(DIA_Vatras_BEGINN, DIALOG_ENDE, DIA_Vatras_BEGINN_los );

};
func void DIA_Vatras_BEGINN_los ()
{
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 	
 	Npc_ExchangeRoutine	(self,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk (self,60);

	RitualInnosEyeRuns = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info augeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_AUGEGEHEILT_Condition;
	information	 = 	DIA_Vatras_AUGEGEHEILT_Info;
	important	 = 	TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition ()
{
	if (Kapitel == 3)
		&& (RitualInnosEyeRuns == LOG_RUNNING)
		&& (Npc_RefuseTalk(self) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Vatras_AUGEGEHEILT_Info ()
{
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //Hotovo. Podaâilo se nám pâekazit nepâíteli plány a opravit Oko.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //Aă ti Pyrokar vysvętlí, jak používat jeho sílu.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //Doufám, že se ještę uvidíme, až dokončíš své poslání. Sbohem.
 	
 	B_LogEntry (TOPIC_INNOSEYE, "Oko je již v poâádku. Pyrokar mi je vydá.");
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 
 	RitualInnosEyeRuns = LOG_SUCCESS;
 	MIS_RitualInnosEyeRepair = LOG_SUCCESS;	
 
	B_StartOtherRoutine   (Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine   (Xardas, "RitualInnosEyeRepair");
	
	B_StartOtherRoutine  (VLK_455_Buerger,"START");
	B_StartOtherRoutine  (VLK_454_Buerger,"START");
	B_StartOtherRoutine  (VLK_428_Buergerin,"START");
	B_StartOtherRoutine  (VLK_450_Buerger,"START");
	B_StartOtherRoutine  (VLK_426_Buergerin,"START");
	B_StartOtherRoutine  (VLK_421_Valentino,"START");
};



///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_PERMKAP3		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_PERMKAP3_Condition;
	information	 = 	DIA_Vatras_PERMKAP3_Info;

	description	 = 	"Díky za pomoc pâi obnovení síly Innosova oka.";
};

func int DIA_Vatras_PERMKAP3_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_PERMKAP3_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_PERMKAP3_15_00"); //Díky za pomoc pâi obnovení síly Innosova oka.
	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_01"); //Neplýtvej tak svými díky. Tvůj nejvętší úkol na tebe ještę čeká.

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_02"); //Promluv si s Pyrokarem, vysvętlí ti všechno ostatní.
	};

	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_03"); //Doufám, že tę ještę uvidím živého a zdravého, můj synu.

};

///////////////////////////////////////////////////////////////////////
//	Info HildaKrank
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HILDAKRANK		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	34;
	condition	 = 	DIA_Vatras_HILDAKRANK_Condition;
	information	 = 	DIA_Vatras_HILDAKRANK_Info;

	description	 = 	"Lobartovę ženę Hildę je špatnę.";
};

func int DIA_Vatras_HILDAKRANK_Condition ()
{
	if (MIS_HealHilda == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Vatras_GREET))
		{
				return TRUE;
		};
};

func void DIA_Vatras_HILDAKRANK_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //Lobartovę ženę Hildę je špatnę.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //Co? Už zase? Ta dobrá žena by na sebe męla dávat vętší pozor.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //Jedna tuhá zima a už tu s námi nebude. Dobrá, dám ti pro ni medicínu, co potlačí horečku.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //A víš, když už jsi v tom, męl bys na sebe taky dávat pozor.
	CreateInvItems (self, ItPo_HealHilda_MIS, 1);									
	B_GiveInvItems (self, other, ItPo_HealHilda_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_OBSESSION		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	35;
	condition	 = 	DIA_Vatras_OBSESSION_Condition;
	information	 = 	DIA_Vatras_OBSESSION_Info;

	description	 = 	"Mám podivné pocity úzkosti.";
};

func int DIA_Vatras_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
		{
				return TRUE;
		};
};

func void DIA_Vatras_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_OBSESSION_15_00"); //Mám podivné pocity úzkosti.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_01"); //Taky nevypadáš moc dobâe. Byl jsi vystaven černému pohledu Pátračů pâíliš dlouhou dobu.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_02"); //Všechno, co svedu léčit, je tvoje tęlo, ale jedinę v klášteâe mohou očistit tvou duši. Promluv si s Pyrokarem. Pomůže ti.
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_Vatras_AllDragonsDead(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 59;
	condition	= DIA_Vatras_AllDragonsDead_Condition;
	information	= DIA_Vatras_AllDragonsDead_Info;
	description = "Ti draci už žádnou spoušă nezpůsobí.";
};                       
FUNC INT DIA_Vatras_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vatras_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_00"); //Ti draci už žádnou spoušă nezpůsobí.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_01"); //Vędęl jsem, že se vrátíš živý a zdravý. Nicménę ještę poâád máš tu nejvętší pâekážku pâed sebou.
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_02"); //Já vím.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_03"); //Tak se poâádnę pâiprav a pâijë za mnou, kdykoli budeš nęco potâebovat. Také u sebe poâád nos Innosovo oko, slyšíš? Nechă ti Adanos žehná.
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_KnowWhereEnemy_Condition;
	information	 = 	DIA_Vatras_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Vím, kde jsou naši nepâátelé.";
};
func int DIA_Vatras_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Vatras_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Vatras_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //Vím, kde jsou naši nepâátelé.
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //Tak to už nesmíme ztrácet čas. Musíme je vyhledat dâív, než si pro nás pâijdou.
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //Chceš se ke mnę pâidat?
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //Dlouho jsem o tom pâemýšlel a nikdy jsem si nebyl ničím tak jistý, pâíteli.
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                    	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                    	
	B_LogEntry (TOPIC_Crew,"Vatras mi pâekvapivę nabídl, že mę na cestę doprovodí. Muž s jeho dovednostmi a zkušenostmi pro mę bude jistę velmi cenný.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Vatras_KnowWhereEnemy_15_04"); //Už mám skupinu plnou. Obávám se, že pro tebe nezbylo místo.
		AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //Tak ho nęjak udęlej. Potâebuješ mę.
	}
	else 
	{
		Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Ještę o tom popâemýšlím.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Bude mi ctí mít tę po boku.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //Považuju za velkou poctu mít tę po svém boku. Uvidíme se v pâístavu.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //Aă ti to netrvá moc dlouho. Nepâítel nikdy nespí, pâíteli.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_No_15_00"); //Ještę o tom popâemýšlím.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_No_05_01"); //Jak je libo. Vraă se, jestli si to rozmyslíš.

	Vatras_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_LeaveMyShip_Condition;
	information	 = 	DIA_Vatras_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Radęji bys męl zůstat tady. Męsto tę potâebuje.";
};
func int DIA_Vatras_LeaveMyShip_Condition ()
{	
	if (Vatras_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //Radęji bys męl zůstat tady. Męsto tę potâebuje.
	AI_Output			(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //Možná máš pravdu. Ale stejnę se k tobę pâidám, jestli máš zájem. To snad víš.
	
	Vatras_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"PRAY"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_StillNeedYou_Condition;
	information	 = 	DIA_Vatras_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pojeë se mnou na nepâátelský ostrov.";
};

func int DIA_Vatras_StillNeedYou_Condition ()
{	
	if ((Vatras_IsOnBOard == LOG_OBSOLETE)	
	|| (Vatras_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Vatras_StillNeedYou_15_00"); //Pojeë se mnou na ten ostrov.
	AI_Output	(self, other, "DIA_Vatras_StillNeedYou_05_01"); //Moudré rozhodnutí. Doufám, že se toho budeš držet.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition ()
{
	if (VatrasPissedOffForever == TRUE)
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info ()
{
	B_VatrasPissedOff ();
	AI_StopProcessInfos (self);  Vatras_MORE = FALSE;
};


