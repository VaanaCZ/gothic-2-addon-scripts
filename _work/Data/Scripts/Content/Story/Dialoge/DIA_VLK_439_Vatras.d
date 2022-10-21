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
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //Du¿o plotek kr¹¿y w Khorinis na twój temat.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //Podobno jesteœ zamieszany w mordowanie niewinnych...
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //Ostrzegam ciê - jeœli to oka¿e siê prawd¹... 
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //Nie schodŸ ze œcie¿ki równowagi i ocalenia tego œwiata - w przeciwnym wypadku czekaj¹ ciê powa¿ne konsekwencje.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //Czym mogê s³u¿yæ?
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
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_06"); //Co na to odpowiesz?

	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Odwal siê.", DIA_Addon_Vatras_LastWarning_Arsch );	 
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Przykro mi... Nie wiedzia³em, co robiê.", DIA_Addon_Vatras_LastWarning_Reue );	 
};
func void DIA_Addon_Vatras_LastWarning_Arsch ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //Odwal siê.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //Nie s³yszê w twoich s³owach skruchy.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //Nie pozostawiasz mi ¿adnego wyboru.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff ();
};

func void DIA_Addon_Vatras_LastWarning_Reue ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //Przykro mi... Nie wiedzia³em, co robiê.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //Bêdê siê za ciebie modliæ w nadziei, ¿e odnajdziesz jeszcze kiedyœ równowagê.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //Nie wa¿ siê ju¿ jednak nigdy pope³niæ ¿adnego mordu.
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
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //Twe s³owa s¹ równie z³e, jak twoje uczynki.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //Twoim bezsensownym morderstwom nie ma koñca.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //Nie pozostawiasz mi ¿adnego wyboru. 
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
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_00"); //Chwila!
		if (Vatras_GehZuLares == TRUE) 
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //Jeœli wpadniesz przypadkiem na Laresa...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //Jest coœ, co mo¿esz dla mnie zrobiæ.
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //IdŸ do portu - znajdziesz tam niejakiego Laresa.
			Vatras_GehZuLares = TRUE;
		};	
			
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //Przeka¿ mu ten ornament i ka¿ mu go oddaæ. Bêdzie wiedzia³ co zrobiæ.
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
	AI_Output (self, other, "DIA_Vatras_GREET_05_00"); //Niech ³aska Adanosa bêdzie z tob¹.
	AI_Output (other, self, "DIA_Vatras_GREET_15_01"); //Kim jesteœ?
	AI_Output (self, other, "DIA_Vatras_GREET_05_02"); //Nazywam siê Vatras. Jestem s³ug¹ Adanosa, stra¿nika niebiañskiej i ziemskiej harmonii.
	AI_Output (self, other, "DIA_Vatras_GREET_05_03"); //Co mogê dla ciebie zrobiæ?
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

	description	= "Mam list adresowany do ciebie.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_Cavalorn_15_00"); //Mam list adresowany do ciebie.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_01"); //Do mnie?
	
	if (SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon,1);
		AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //Owszem. Tylko... By³ otwarty. Mam nadziejê, ¿e nie przeczyta³ go nikt niepowo³any.
	};

	B_UseFakeScroll();
	
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //Tak... To naprawdê wa¿na wiadomoœæ.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //Ciekawi mnie, jak wszed³eœ w jej posiadanie?
	
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Zabra³em j¹ bandytom.", DIA_Addon_Vatras_Cavalorn_Bandit );

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Od Cavalorna, myœliwego.", DIA_Addon_Vatras_Cavalorn_Cavalorn );
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};
func void DIA_Addon_Vatras_Cavalorn_Bandit ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //Zabra³em j¹ bandytom.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //Och! Adanosie! Niedobrze, bardzo niedobrze.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //Jeœli mówisz prawdê, to mamy ogromny problem.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //Trzeba siê tym jak najszybciej zaj¹æ.
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};
func void DIA_Addon_Vatras_Cavalorn_Cavalorn ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //Od Cavalorna, myœliwego.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //Cavalorn? A gdzie on siê podziewa?
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //Poleci³ mi przekazaæ, ¿e nie zd¹¿y³ na czas i ¿e zmierza na miejsce spotkania - gdziekolwiek by to nie by³o.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //Widzê, ¿e zas³u¿y³eœ sobie na jego zaufanie... Ja równie¿ bêdê ci chyba musia³ zaufaæ.
	
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
	description	= "Przysy³a mnie Cavalorn!";
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
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_00"); //Przysy³a mnie Cavalorn!
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_01"); //Naprawdê? I co powiedzia³?
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_02"); //¯e nie wzgardzisz pomoc¹ osób wszechstronnie uzdolnionych.
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_03"); //A wiêc chcesz siê do nas przy³¹czyæ - czy tak, mój synu?
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

	description	= "Powiedz mi coœ o Wodnym Krêgu.";
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
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_15_00"); //Powiedz mi coœ o Wodnym Krêgu.

	if (!Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_01"); //A czemu mia³bym to zrobiæ?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_02"); //Nie musisz wiedzieæ wszystkiego, dopóki nie staniesz siê jednym z nas.
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_03"); //Co nieco mogê ci jednak opowiedzieæ...
		
		Info_ClearChoices (DIA_Addon_Vatras_TellMe);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Czym siê tak w zasadzie zajmujecie?", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Gdzie s¹ Magowie Wody?", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Kim s¹ cz³onkowie Wodnego Krêgu?", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};
func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_TellMe);
};
func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //Czym siê tak w zasadzie zajmujecie?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //Stoimy pomiêdzy porz¹dkiem symbolizowanym przez Innosa i chaosem, którego reprezentantem jest Beliar.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //Gdyby któraœ ze stron zatryumfowa³a, oznacza³oby to albo utratê wolnoœci, albo rz¹dy œmiercionoœnego chaosu.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //Staramy siê utrzymaæ równowagê w tym œwiecie - tylko w ten sposób mo¿e w nim istnieæ ¿ycie.
	
	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Hmm... A mo¿e konkretniej?", DIA_Addon_Vatras_TellMe_Konkret);
	};
};
func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //Hmm... A mo¿e konkretniej?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //Od upadku Bariery pojawi³o siê sporo nowych zagro¿eñ.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //Najoczywistszym z nich s¹ bandyci.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //Nie doœæ, ¿e spokojne podró¿owanie przez wyspê sta³o siê niemal niemo¿liwe...
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //...to jeszcze wspomaga ich ktoœ w tym mieœcie!
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //Ustaliliœmy, ¿e bandyci regularnie zaopatruj¹ siê w broñ u jednego z kupców z Khorinis. 
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //Próbujemy dotrzeæ do takich osób, aby uniemo¿liwiæ im dzia³anie na szkodê miasta.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //Daj znaæ, gdy zechcesz zaj¹æ siê t¹ spraw¹.
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"W Khorinis jest handlarz broni¹, który zaopatruje bandytów. Vatras chce, ¿ebym sprawdzi³ tê informacjê."); 
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin, kwatermistrz paladynów, zajmuje siê sprawami handlarza broni¹. Znajdê go w magazynach paladynów, w porcie."); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Wodny Kr¹g martwi siê bandytami w Khorinis."); 
};
func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //Gdzie s¹ Magowie Wody?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //Badaj¹ ruiny prastarej kultury gdzieœ na pó³nocny wschód od Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //Zak³adamy, ¿e znajduj¹ siê tam wrota do nieznanej dotychczas czêœci wyspy.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Pozostali Magowie Wody zbadaj¹ ruiny staro¿ytnej kultury na pó³nocny wschód od Khorinis. Byæ mo¿e znajduje siê tam przejœcie do dotychczas niezbadanej czêœci wyspy."); 

	Info_AddChoice (DIA_Addon_Vatras_TellMe, "Opowiedz mi wiêcej o tym niezbadanym terenie.", DIA_Addon_Vatras_TellMe_Unexplored);
};
func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //Opowiedz mi wiêcej o tym niezbadanym terenie.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //Mogê wys³aæ ciê do Saturasa z listem polecaj¹cym, jeœli interesuje ciê do³¹czenie do ekspedycji.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //Rzecz jasna tylko wtedy, gdy bêdziesz jednym z nas.
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //Rzecz jasna.
	B_LogEntry (TOPIC_Addon_KDW,"Zanim do³¹czê do ekspedycji Magów Wody, Vatras chce, abym zosta³ cz³onkiem Wodnego Krêgu."); 
};
func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //Kim s¹ cz³onkowie Wodnego Krêgu?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //Tego dowiesz siê, gdy ju¿ sam w nim bêdziesz.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //Z pewnoœci¹ spotkasz niektórych z nas...
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

	description	= "Chcê siê przy³¹czyæ do Wodnego Krêgu!";
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
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //Chcê siê przy³¹czyæ do Wodnego Krêgu!
	
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //Doskonale. Pierwsze wymaganie ju¿ spe³niasz.
		AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //O co ci chodzi?
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //Przynajmniej jeden z nas ci ufa - inaczej byœ siê o nas nie dowiedzia³.
	};
	
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //Ale ja nic o tobie nie wiem...
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_03"); //Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erzähle mir was über dich.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_04"); //A co chcia³byœ wiedzieæ?
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_05"); //Powiedz mi, sk¹d pochodzisz... i co sprowadza ciê do tego miasta.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_06"); //Mam wa¿n¹ wiadomoœæ dla przywódcy paladynów.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_07"); //Co to za wiadomoœæ?
		
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Przyby³y smoki...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Wkrótce wydarz¹ siê straszliwe rzeczy.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //Niedaleko st¹d zbiera siê potê¿na armia. Jej przywódcami s¹ smoki, a celem podbój ca³ego kraju.
	
	if (Vatras_First == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //Hmmm. Jeœli mówisz prawdê, to równowaga na tych ziemiach zosta³a zak³ócona. Kto ci o tym powiedzia³?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //Smoki? Mówisz o istotach, o których zwykle wspominaj¹ tylko legendy. Kto ci o tym powiedzia³?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ach, s³ysza³em jakieœ plotki...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Powiedzia³ mi o tym mag Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //Wkrótce wydarz¹ siê straszliwe rzeczy.
	
	if (Vatras_First == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //Aha! A kto ci o tym powiedzia³?
	}
	else 
 	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //Straszliwe rzeczy, tak? A sk¹d to przypuszczenie?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ach, s³ysza³em jakieœ plotki...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Powiedzia³ mi o tym mag Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = 2;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //Powiedzia³ mi o tym mag Xardas. To on wys³a³ mnie, bym ostrzeg³ paladynów.
	
	if (Vatras_Second == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //Wiem, ¿e jest on m¹drym i potê¿nym mistrzem magii. Powiedz mi jeszcze, sk¹d przybywasz?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //Ten nekromanta... A wiêc ¿yje... i on ciê tu przys³a³? Kim jesteœ naprawdê?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Podró¿nikiem z dalekiego po³udnia...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Dawnym skazañcem...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //Ach, s³ysza³em jakieœ plotki...
	
	if (Vatras_Second == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //A pamiêtasz chocia¿, GDZIE je s³ysza³eœ?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //Tak... I dlatego wyruszy³eœ w tê podró¿? Kim jesteœ naprawdê?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Podró¿nikiem z dalekiego po³udnia...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Dawnym skazañcem...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = 2;
};
func VOID B_Vatras_INFLUENCE_REPEAT()
{
	//RAUS wegen ADDON
	//AI_Output (other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); //Und, gibst du mir jetzt deinen Segen?	
	
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); //Dobrze, podsumujmy:
	
	if (Vatras_Third == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //Jesteœ zbieg³ym wiêŸniem...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //Jesteœ podró¿nikiem z dalekiego po³udnia...
	};
	if (Vatras_Second  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //...któremu nekromanta Xardas powiedzia³...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //...który us³ysza³ plotki...
	};
	if (Vatras_First  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //...¿e armia smoków zamierza podbiæ ca³y kraj.
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //...¿e wydarz¹ siê wkrótce straszliwe rzeczy.
	};
		
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //I zamierzasz ostrzec o tym paladynów.
	if (Vatras_First   == TRUE)
	&& (Vatras_Second  == TRUE)
	&& (Vatras_Third   == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //Brzmi to doœæ niewiarygodnie, ale nie wyczuwam, byœ próbowa³ mnie ok³amaæ.
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //Dlatego muszê przyj¹æ, ¿e kieruj¹ tob¹ szlachetne pobudki.
		
		AI_Output (self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //Dostaniesz szansê na do³¹czenie do Wodnego Krêgu.
		
		Info_ClearChoices  (DIA_Addon_Vatras_WannaBeRanger);
	}
	else 
	{
		AI_Output (self, other, "DIA_Vatras_Add_05_00"); //Myœlê, ¿e coœ przede mn¹ ukrywasz.
		AI_Output (self, other, "DIA_Vatras_Add_05_01"); //Jeœli obawiasz siê, ¿e przeka¿ê komuœ to, co mi powiesz, mo¿esz byæ spokojny.
		AI_Output (self, other, "DIA_Vatras_Add_05_02"); //Przysi¹g³em zachowywaæ wszystkie powierzane mi tajemnice dla siebie.
		if (Wld_IsTime(05,05,20,10))
		{
			AI_Output (other, self, "DIA_Vatras_Add_15_03"); //A co z tymi wszystkimi ludŸmi?
			AI_Output (self, other, "DIA_Vatras_Add_05_04"); //Oni nie rozumiej¹ nawet po³owy z tego, czego ich nauczam. Nie musisz siê obawiaæ.
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_05"); //Zacznijmy jeszcze raz, od pocz¹tku. Co to za wiadomoœæ?
		
		//ADDON - SC kann nicht mehr versagen!
		//Vatras_Chance = TRUE; 
		Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Przyby³y smoki...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Wkrótce wydarz¹ siê straszliwe rzeczy.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
	
	//else-Fall raus - Addon
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); //Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //Dawnym skazañcem z kolonii wiêziennej Khorinis.
	Vatras_Third = TRUE;
	
	B_Vatras_INFLUENCE_REPEAT();
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //Podró¿nikiem z dalekiego po³udnia...
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

	description	= "Co muszê zrobiæ, aby do was do³¹czyæ?";
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
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //Co muszê zrobiæ, aby do was do³¹czyæ?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //Przede wszystkim musisz mieæ œwiadomoœæ, ¿e bierzesz na swe barki wielk¹ odpowiedzialnoœæ.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //Nie przyjmujê zg³oszeñ ka¿dego.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //Chcesz byæ jednym z nas? Udowodnij, ¿e twoje postêpowanie przystaje do naszego.
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //A konkretniej?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //Ka¿dy kandydat musi wykonaæ wa¿kie zadanie, zanim otrzyma zgodê na przy³¹czenie siê do nas.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //Dopiero po tym mogê rozwa¿yæ twoj¹ proœbê o zgodê na do³¹czenie do naszej walki o utrzymanie równowagi na tej wyspie.
	
	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "To jak mogê ciê przekonaæ?", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Uwolni³em wielu ludzi. Bariera zosta³a zniszczona...", DIA_Addon_Vatras_HowToJoin_FreedMen );
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Pokona³em Œni¹cego. To chyba dosyæ znacz¹ce osi¹gniêcie?", DIA_Addon_Vatras_HowToJoin_Sleeper );
};
func void DIA_Addon_Vatras_HowToJoin_Sleeper ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //Pokona³em Œni¹cego. To chyba dosyæ znacz¹ce osi¹gniêcie?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //Du¿o opowieœci siê ostatnio s³yszy...
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //Nawet historie o wypêdzeniu z tego œwiata potwora znanego jako Œni¹cy.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //Nie s³ysza³em jednak, aby by³a to wy³¹cznie twoja zas³uga - choæ widzê, ¿e wierzysz w swe s³owa.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //Trochê mnie to denerwuje, ale nie mogê mieæ pewnoœci, ¿e zmys³y mnie nie zwodz¹.
};
func void DIA_Addon_Vatras_HowToJoin_FreedMen ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //Uwolni³em wielu ludzi. Bariera zosta³a zniszczona...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //No, jeœli to naprawdê twoja zas³uga...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //Ludzie, których uwolni³eœ... To nie byli tylko Magowie Wody i niewinni osadnicy.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //Po ca³ej krainie rozpanoszyli siê równie¿ ró¿noracy bandyci, którzy zagra¿aj¹ teraz obywatelom tego miasta.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //Zajêli ju¿ czêœæ terenów okalaj¹cych miasto - niemal nie da siê bezpiecznie opuœciæ Khorinis.
};
func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //To jak mogê ciê przekonaæ?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //Ostatnio w Khorinis dzieje siê coœ dziwnego.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //Niemal codziennie znikaj¹ kolejni mieszkañcy.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //Gdyby uda³o ci siê ustaliæ, co siê z nimi sta³o, miejsce w Wodnym Krêgu masz zapewnione.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras nie pozwoli mi wst¹piæ do Wodnego Krêgu, jeœli nie rozwi¹¿ê zagadki zaginionych ludzi."); 

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //Tylko ¿e...
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //Tak?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //...najpierw musisz skontaktowaæ siê z paladynami i przekazaæ im tê wiadomoœæ.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //S¹dzê, ¿e to bardzo wa¿ne.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //Pomów z Lordem Hagenem.
	
	B_LogEntry (TOPIC_Addon_RingOfWater,"Mam dostarczyæ Lordowi Hagenowi wa¿n¹ wiadomoœæ od Vatrasa."); 

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

	description	= "Ale przecie¿ mnie do niego nie dopuszcz¹!";
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
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //Ale przecie¿ mnie do niego nie dopuszcz¹!
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //Ale¿ dopuszcz¹, dopuszcz¹. Jeœli bêdziesz cz³onkiem wp³ywowej organizacji...
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //Kr¹g ma swoje kontakty, czasem doœæ przydatne.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //Postaramy siê zadbaæ, abyœ móg³ dostarczyæ wiadomoœæ Hagenowi jak najszybciej.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //Pomów o tym z moim zaufanym towarzyszem, Laresem. Mo¿e on zdo³a ci pomóc.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Aby zostaæ wpuszczonym na dwór Lorda Hagena, muszê wst¹piæ do jednej z potê¿nych gildii w Khorinis."); 
	

	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Tak zrobiê.", DIA_Addon_Vatras_GuildBypass_BACK );
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Do której gildii mam siê przy³¹czyæ?", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};
func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //Tak zrobiê.
	Vatras_GehZuLares = TRUE;
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
};
func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //Do której gildii mam siê przy³¹czyæ?
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //Jedynie trzy s¹ doœæ potê¿ne i wp³ywowe, aby siê liczyæ.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //To stra¿, Magowie Ognia i najemnicy z farmy Onara.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //Wybór nale¿y do ciebie.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //Lares mo¿e pomóc ci w podjêciu tej trudnej decyzji - lepiej z nim pomów.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Istniej¹ trzy potê¿ne gildie, do których mo¿na wst¹piæ: Magowie Ognia, stra¿ miejska oraz najemnicy przebywaj¹cy w pobli¿u posiad³oœci w³aœciciela ziemskiego."); 
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Tak zrobiê.", DIA_Addon_Vatras_GuildBypass_BACK );
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

	description	= "Jestem gotów wst¹piæ w szeregi Wodnego Krêgu!";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //Jestem gotów wst¹piæ w szeregi Wodnego Krêgu!
	AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //Dostarczy³eœ sw¹ wiadomoœæ Lordowi Hagenowi?
	
	if (Kapitel >= 2) //Pass-Schlüssel von Hagen
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //Owszem.
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //Nakaza³ mi jednak udaæ siê do Górniczej Doliny i dostarczyæ mu dowód na potwierdzenie moich s³ów!
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //Sam musisz zdecydowaæ, co dalej.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //Dla mnie liczy³o siê dostarczenie wiadomoœci. To, czy paladyni podejm¹ jakieœ dzia³ania, czy bêd¹ czekaæ na dodatkowe dowody, zale¿y ju¿ od Hagena.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //Co do ciebie...
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //Dobrze.
		};
		
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //Dowiod³eœ swej wartoœci - zostaniesz jednym z nas. Bêdziesz podró¿owa³ po tej krainie i wype³nia³ wolê Adanosa.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //Niniejszym dajê ci Pierœcieñ Wody - oby pomóg³ ci znaleŸæ sojuszników i utrzymaæ wraz z nimi równowagê tego œwiata.
		CreateInvItems (self, ItRi_Ranger_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Addon, 1);		
		if (hero.guild == GIL_KDF)
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //Szczególnie cieszy mnie fakt, ¿e jesteœ pierwszym Magiem Ognia wœród nas.
		};
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //Niech ciê Adanos chroni. IdŸ teraz poznaæ swych wspó³braci.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //Czekaj¹ na ciebie w gospodzie 'Martwa Harpia', gdzie powitaj¹ ciê wœród nas.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //Chyba znasz to miejsce? Znajduje siê na drodze do farmy Onara.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //Nie zapomnij za³o¿yæ pierœcienia, tak aby twoi bracia mogli ciê po nim rozpoznaæ.
		
		B_LogEntry (TOPIC_Addon_RingOfWater,"Nale¿ê teraz do Wodnego Krêgu i powinienem spotkaæ siê z mymi braæmi w gospodzie 'Martwa Harpia'."); 

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP (XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //Nie, jeszcze nie.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //Wiêc siê pospiesz! To wiadomoœæ ogromnej wagi!
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
	description = "Przysy³aj¹ mnie cz³onkowie Krêgu.";
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
	AI_Output (other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //Przysy³aj¹ mnie cz³onkowie Krêgu.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //Doskonale - i tak ju¿ na ciebie czeka³em.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //Zaraz wyœlê ciê na drug¹ stronê portalu wraz z innymi Magami Wody.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //Masz tropiæ Magnata imieniem Kruk i ustaliæ, czemu porywa mieszkañców Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //My spróbujemy rozwi¹zaæ problem okolicznych bandytów.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //Daj tê notkê Saturasowi - od tej pory to on jest twoim zwierzchnikiem.
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //Lares doprowadzi ciê do niego, o ile sam nie dostarczy³ jeszcze ornamentu.
	};
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven, 1);									
	B_GiveInvItems (self, other, ItWr_Vatras2Saturas_FindRaven, 1);	
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //Niech ciê Adanos prowadzi.
		
	B_LogEntry (TOPIC_Addon_KDW,"Vatras wys³a³ mnie z listem do Saturasa. Powinienem teraz przejœæ przez portal z pozosta³ymi Magami Wody i wyœledziæ Kruka, dawnego magnata."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Sklaven,"Powinienem dowiedzieæ siê, dlaczego Kruk kaza³ porwaæ mieszkañców Khorinis."); 


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
	description	= "Co do tych znikaj¹cych ludzi...";
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
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //Co do tych znikaj¹cych ludzi...
	AI_Output (self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //Tak?
	
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice (DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Wiem, gdzie przebywaj¹ zaginieni.", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Powiem ci, co uda³o mi siê do tej pory ustaliæ.", DIA_Addon_Vatras_MissingPeople_Report);
	};
	
	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Gdzie szukaæ ich œladu?", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};
func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
};
func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //Gdzie szukaæ ich œladu?
	AI_Output (self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //Wiêkszoœæ z nich zaginê³a w porcie - to chyba dobre miejsce do rozpoczêcia poszukiwañ.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"W porcie w Khorinis zaginê³o najwiêcej osób. Tam powinienem zacz¹æ swoje poszukiwania."); 
	
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};
func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //Powiem ci, co uda³o mi siê do tej pory ustaliæ.
	
	 if ((MIS_Akil_BringMissPeopleBack != 0)
	 || (MIS_Bengar_BringMissPeopleBack != 0))
	 &&	(MISSINGPEOPLEINFO[1] == FALSE)
	 {
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //Zaginê³o równie¿ paru farmerów.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	 };
	
	if ((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //Podobno odpowiedzialni za to s¹ bandyci.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //Elvrich - czeladnik Thorbena - powiedzia³ mi, ¿e to w³aœnie oni transportuj¹ porwanych drog¹ morsk¹.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	
	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //Wydaje siê, ¿e zamieszani s¹ w to jacyœ piraci, choæ nie wiem jeszcze na pewno, jak¹ odgrywaj¹ w tym wszystkim rolê.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};	
	
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //Uwolni³em Elvricha z ³ap bandytów.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //Bandyci porwali dziewczynê imieniem Lucia.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	
	if ((Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //Porwana dziewczyna, Lucia, zadawa³a siê póŸniej z bandytami.
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //Jak siê wydaje, ju¿ z w³asnej woli.
		};
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};
		
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //Szajce przewodzi niejaki Dexter i to on odpowiada za porwania.
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //Pamiêtam Dextera z kolonii karnej... Pracowa³ wtedy dla innego magnata, Gomeza.
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //On ciebie te¿ z pewnoœci¹ zapamiêta³ - miej siê na bacznoœci.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //Chyba jesteœ na dobrym tropie - oby tak dalej.
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports );
		B_GivePlayerXP (XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //Czego siê dowiedzia³eœ?
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //Niestety - niczego wa¿nego.
	};
};
func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //Wiem, gdzie przebywaj¹ zaginieni.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //Czego uda³o ci siê dowiedzieæ?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //Porwano ich i zabrano w odleg³y kraniec wyspy Khorinis. Zrobi³ to niejaki Kruk.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //Co daje ci pewnoœæ, ¿e tak rzeczywiœcie by³o?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //Czyta³em jego rozkazy. Okoliczni bandyci pracuj¹ dla niego.
	if (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	{	
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //Patrz.
		B_UseFakeScroll ();
	};
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //Dobra robota - a ju¿ zaczyna³em siê baæ, ¿e nigdy nie zdo³amy odkryæ prawdy.
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
	description	 = 	"Zaginieni powrócili.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_Free_15_00"); //Zaginieni powrócili.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_01"); //Tak, uda³o ci siê! Nie ma to jak szczêœliwe zakoñczenie.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_02"); //Jednak twoja podró¿ nie dobieg³a jeszcze koñca... Niech ciê Adanos b³ogos³awi.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_03"); //Adanosie, b³ogos³aw temu mê¿owi. Oœwieæ œcie¿kê, po której st¹pa, i daj mu si³ê, aby opar³ siê wszystkim zagro¿eniom.
	
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
	description = "Co do tego handlarza broni¹...";
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
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_15_00"); //Co do tego handlarza broni¹...
	
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
	Info_AddChoice (DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if (Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Wiem, kto dostarcza uzbrojenie bandytom!", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Co wiesz o handlarzu broni¹?", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};
func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
};
func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //Co wiesz o handlarzu broni¹?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //Pomów z Martinem, kwatermistrzem paladynów. Mo¿e on dysponuje informacjami w tej sprawie.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //Powierzono mu zadanie zdemaskowania handlarza broni¹.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //Znajdziesz go w porcie. Jak zobaczysz parê skrzyñ, ¿ywnoœæ i paladynów, to i on bêdzie siê tam gdzieœ krêci³.
		
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //Wiem, kto dostarcza uzbrojenie bandytom!
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //Nazywa siê Fernando.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //Doskonale. Martin podj¹³ odpowiednie kroki, aby zakoñczyæ ten proceder?
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //Tak. Zadba, aby drañ nie wyszed³ za szybko z lochu.
		AI_Output	(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //Dobra robota, synu.

		if (Npc_KnowsInfo (other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //To co, jestem ju¿ gotów na zostanie cz³onkiem Wodnego Krêgu?
			AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //Nie tak siê umówiliœmy i dobrze o tym wiesz.
		};
		
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //Oby Adanos oœwietli³ œcie¿kê, po której kroczysz.
		
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //Jeszcze nie.
		AI_Output	(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //Pospiesz siê i mu o tym donieœ! Trzeba jak najszybciej z tym skoñczyæ!
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

	description = "Móg³byœ mi jakoœ pomóc w poszukiwaniach?";
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
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //Móg³byœ mi jakoœ pomóc w poszukiwaniach?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //Strasznie uparty z ciebie cz³owiek. Prawdê mówi¹c... Chyba w czymœ mogê ci pomóc.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //Dam ci ten amulet z rudy - z pewnoœci¹ ci siê przyda.
	CreateInvItems (self, ItAm_Addon_WispDetector, 1);									
	B_GiveInvItems (self, other, ItAm_Addon_WispDetector, 1);
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //To amulet ognika.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //Istnieje ich tylko kilka - zaklêty w nim ognik ma specjalne zdolnoœci.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //Dziêki niemu mo¿na widzieæ rzeczy dla oka niewidoczne.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //Aby z niego skorzystaæ, trzeba go za³o¿yæ.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //Jeœli ognik s³abnie lub w ogóle zniknie, za³ó¿ amulet ponownie, aby go zregenerowaæ.
	
	B_LogEntry (TOPIC_Addon_BanditTrader,"Vatras da³ mi 'Amulet szukaj¹cego ognika', który przyda mi siê w poszukiwaniach handlarza broni¹."); 
	Log_CreateTopic (TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned); 
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned_NF); 

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //Ognik umie równie¿ wykrywaæ broñ.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //Mo¿e ci siê to przydaæ w zadaniu zdemaskowania sprzedawcy mieczy.
	};

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //Dbaj o amulet, a na pewno ci siê przyda.

	Info_ClearChoices (DIA_Addon_Vatras_WISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Dziêkujê! Bêdê o tym pamiêtaæ.", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "To wszystko, co ten ognik umie?", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "W tym amulecie jest ognik?", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;	
};
func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //Dziêkujê! Bêdê o tym pamiêtaæ.
	Info_ClearChoices (DIA_Addon_Vatras_WISP);
};
func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //To wszystko, co ten ognik umie?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //Poza wykrywaniem uzbrojenia? Tylko jeœli go nauczysz.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //O ile mi wiadomo, to Riordan potrafi uczyæ te stworki nowych sztuczek. Przebywa teraz z Saturasem.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //Mo¿e on ci wiêcej o nim opowie.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"Ogniki potrafi¹ znajdowaæ nie tylko broñ bia³¹. Mag Wody, Riordian, mo¿e nauczyæ moje ogniki szukania innych przedmiotów."); 
	};
};
func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //W tym amulecie jest ognik?
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //Ogniki to urocze stworzonka sk³adaj¹ce siê z czystej energii magicznej.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //S¹ zwi¹zane z magiczn¹ rud¹ tego œwiata - ona stanowi Ÿród³o ich istnienia i ich mocy.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //Nie dziwi mnie, ¿e wczeœniej o nich nie s³ysza³eœ - ujawniaj¹ siê tylko tym, którzy przynosz¹ odpowiadaj¹c¹ im rudê.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //Dzikie ogniki zosta³y brutalnie wyrwane ze swego œrodowiska i atakuj¹ ka¿de stworzenie, które siê do nich zbli¿y.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //Tym ¿a³osnym istotom nie mo¿na ju¿ pomóc - lepiej ich unikaæ.
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

	description	= "Znalaz³em tê kamienn¹ tabliczkê...";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //Znalaz³em tê kamienn¹ tabliczkê. Mo¿esz mi coœ o niej powiedzieæ?
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //To artefakt prastarej kultury, któr¹ badamy ju¿ od d³u¿szego czasu.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //Jest ich kilka rodzajów - czêœæ zawiera informacje o historii tego dawnego ludu.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //I te mnie w³aœnie interesuj¹. Przynieœ mi wszystkie, które uda ci siê znaleŸæ.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //Czeka ciê za to nagroda.

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
	description	= "Mam dla ciebie kolejn¹ kamienn¹ tabliczkê...";
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
		AI_Output	(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //Mam dla ciebie kolejn¹ kamienn¹ tabliczkê...
	}
	else 
	{
		//Fixme Joly --> Hier SC-output "Hier.." oder ähnliche --Mike
	};
	
	B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, anzahl);
		
	AI_Output	(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //Œwietnie!
	
	if (anzahl >= 10)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //Zwiêkszê tw¹ moc magiczn¹.
		B_RaiseAttribute	(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute	(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //Przyjmij w nagrodê te kilka zwojów...
		B_GiveInvItems (self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tränke
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //Przyjmij w nagrodê te kilka eliksirów...
		B_GiveInvItems (self, other, ItPo_Health_03, anzahl+1);
	};
	
	B_GivePlayerXP (XP_Addon_VatrasStonplate * anzahl);
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

	description	 = 	"Lares wspomnia³, ¿e mo¿esz pomóc mi dostaæ siê do klasztoru Magów Ognia.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //Lares wspomnia³, ¿e mo¿esz pomóc mi dostaæ siê do klasztoru Magów Ognia.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //Taki jest twój wybór? Œcie¿ka ognia?
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //Owszem, mam zamiar zostaæ Magiem Ognia.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //O ile pamiêtam, to oni chêtnie przyjmuj¹ nowicjuszy... Po co ci moja pomoc?

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //Potrzebna jest danina - owca i z³oto.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //Lares wspomina³, ¿e w celu przyst¹pienia do klasztoru trzeba wnieœæ jak¹œ daninê.
	};	
	
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //Bezpoœrednio pomóc ci nie mogê - jak zapewne wiesz, jestem Magiem Wody. Znam jednak doœæ dobrze Maga Ognia imieniem Daron.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //Z regu³y zbiera datki w pobli¿u targowiska.
	Vatras_SentToDaron = TRUE;
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //S³ysza³em ponadto, ¿e to nie jedyne jego zadanie w tamtej okolicy...
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //Powiedzia³ mi kiedyœ o pos¹¿ku, który mu ukradziono.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //Sprawa jest dla niego bardzo wa¿na i z pewnoœci¹ wesprze ciê, jeœli odzyskasz dla niego ten pos¹¿ek.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //Rzecz jasna fakt zostania Magiem Ognia nie oznacza, ¿e nie mo¿esz do³¹czyæ do Krêgu.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //Warunek jest jednak jasny - musisz dowieœæ swej wartoœci.
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Mag Ognia z targowiska, Daron, pomo¿e mi wst¹piæ do klasztoru, jeœli odzyskam dla niego ma³y pos¹¿ek, który mu skradziono."); 
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
	description	 = 	"(DALEJ)";
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
	description	 = 	"Przybywam, by prosiæ ciê o b³ogos³awieñstwo.";
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
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_00"); //Przybywam, by prosiæ ciê o b³ogos³awieñstwo.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_01"); //Dlaczegó¿ mia³bym ciê pob³ogos³awiæ, nieznajomy?
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_02"); //Chcê zostaæ czeladnikiem u jednego z mistrzów w dolnej czêœci miasta.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //IdŸ wiêc z b³ogos³awieñstwem Adanosa, mój synu!
	Snd_Play ("LevelUp");
	B_GivePlayerXP (XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry (TOPIC_Thorben,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
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
	description	 = 	"Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?";		
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
	AI_Output (other, self, "DIA_Vatras_WoKdF_15_00"); //Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?
	AI_Output (self, other, "DIA_Vatras_WoKdF_05_01"); //Najlepiej rozejrzyj siê po targowisku. Znajdziesz tam wys³annika klasztoru.
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
	description	 = 	"Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!";
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
	AI_Output (other, self, "DIA_Vatras_Spende_15_00"); //Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!
	AI_Output (self, other, "DIA_Vatras_Spende_05_01"); //Datek na œwi¹tyniê Adanosa mo¿e zmazaæ czêœæ przewin, które pope³ni³eœ w przesz³oœci, mój synu.
	AI_Output (self, other, "DIA_Vatras_Spende_05_02"); //Jak¹ sumê zechcesz przekazaæ?
	
	Info_ClearChoices   (DIA_Vatras_Spende);
	Info_AddChoice 		(DIA_Vatras_Spende, "Chwilowo nie mam pieniêdzy...", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Mam 50 sztuk z³ota...", DIA_Vatras_Spende_50);
	};
	if (Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Mam 100 sztuk z³ota...",	DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output (other, self, "DIA_Vatras_Spende_BACK_15_00"); //Chwilowo nie mam pieniêdzy...
	AI_Output (self, other, "DIA_Vatras_Spende_BACK_05_01"); //Nic siê nie sta³o. Adanos zawsze ucieszy siê z twojej ofiary.
	Info_ClearChoices   (DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output (other, self, "DIA_Vatras_Spende_50_15_00"); //Mam 50 sztuk z³ota...
	AI_Output (self, other, "DIA_Vatras_Spende_50_05_01"); //Dziêkujê ci w imieniu Adanosa, mój synu. Twoje z³oto zostanie przekazane potrzebuj¹cym.
	B_GiveInvItems (other, self, Itmi_Gold, 50);
	Info_ClearChoices   (DIA_Vatras_Spende);
};
	
func void DIA_Vatras_Spende_100()
{
	AI_Output (other, self, "DIA_Vatras_Spende_100_15_00"); //Mam 100 sztuk z³ota...
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_01"); //B¹dŸ b³ogos³awiony, mój synu! Dziêki ci za tw¹ hojnoœæ.
	Snd_Play ("LevelUp");
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_02"); //Niech Adanos strze¿e ciê zawsze od z³ej przygody.
	B_GiveInvItems (other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices   (DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Thorben,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
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
	description	 = 	"Mo¿esz nauczyæ mnie czegoœ o magii?";
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
	AI_Output (other, self, "DIA_Vatras_CanTeach_15_00"); //Mo¿esz nauczyæ mnie czegoœ o magii?
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_01"); //Tylko Wybrañcy Innosa i Wybrañcy Adanosa mog¹ pos³ugiwaæ siê magi¹ run.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_02"); //Ale magia dostêpna jest tak¿e zwyk³ym œmiertelnikom, pod postaci¹ magicznych zwojów.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_03"); //Mogê ciê nauczyæ, jak lepiej wykorzystywaæ dostêpn¹ ci magiczn¹ moc.
	
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Vatras, Mag Wody, mo¿e pomóc mi w zwiêkszeniu magicznych zdolnoœci.");
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
	description	 = 	"Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
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
	AI_Output (other, self, "DIA_Vatras_Teach_15_00"); //Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
};
func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output (self, other, "DIA_Vatras_Teach_05_00"); //Jesteœ ju¿ zbyt potê¿ny, bym móg³ ciê czegoœ nauczyæ.
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
	description	 = 	"Opowiedz mi o bogach.";
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
	AI_Output			(other, self, "DIA_Vatras_GODS_15_00"); //Opowiedz mi o bogach.
	AI_Output			(self, other, "DIA_Vatras_GODS_05_01"); //A co dok³adnie chcia³byœ o nich wiedzieæ?
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK);
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR); 		 
	 		 
};
FUNC VOID DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices (DIA_Vatras_GODS); 
};
FUNC VOID DIA_Vatras_GODS_INNOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_INNOS_15_00"); //Opowiedz mi o Innosie.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //Dobrze. Innos jest pierwszym i najpotê¿niejszym z bogów. To on da³ œwiatu S³oñce.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //W jego w³adaniu znajduj¹ siê œwiat³o i ogieñ, które podarowa³ ludzkoœci. Innos jest te¿ sprawiedliwoœci¹ i prawem.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //Jego kap³anami s¹ Magowie Ognia, a wojownikami - mê¿ni paladyni.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR); 	
	
};
FUNC VOID DIA_Vatras_GODS_ADANOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //Opowiedz mi o Adanosie.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //Adanos jest bogiem harmonii. To boski stra¿nik równowagi pomiêdzy Innosem a Beliarem.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //Jest te¿ wielkim sprawc¹ zmian i panem wód wszystkich mórz, rzek i jezior.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //Jego oddanymi s³ugami s¹ moi bracia, Magowie Wody.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 	
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR); 	

};
FUNC VOID DIA_Vatras_GODS_BELIAR()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //Opowiedz mi o Beliarze.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //Beliar jest mrocznym bogiem œmierci, zniszczenia i wszystkich rzeczy nienaturalnych.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //Toczy on wieczn¹ wojnê z Innosem, ale Adanos dba, by ich si³y zawsze by³y wyrównane.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //Niewielu ludzi pozostaje w s³u¿bie Beliara, ale s¹ oni niezwykle potê¿ni.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR); 			 
	
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
	description	 = 	"Mo¿esz mnie uzdrowiæ?";
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
	AI_Output			(other, self, "DIA_Vatras_HEAL_15_00"); //Mo¿esz mnie uzdrowiæ?
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_01"); //Adanosie, pob³ogos³aw to cia³o, uwolnij je od ran i tchnij w nie nowe ¿ycie!
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_02"); //Nie potrzebujesz pomocy uzdrowiciela.
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
	AI_Output (self, other, "DIA_Vatras_Add_05_10"); //Mam wiadomoœæ dla Mistrza Isgarotha. Strze¿e on kaplicy przed klasztorem.
	AI_Output (self, other, "DIA_Vatras_MISSION_05_01"); //Jeœli podejmiesz siê wykonaæ to zadanie, bêdziesz móg³ sam sobie wybraæ nagrodê.
	
	Info_ClearChoices   (DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Nie teraz!",DIA_Vatras_MISSION_NO);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Jasne.",DIA_Vatras_MISSION_YES);
};
FUNC VOID B_SayVatrasGo()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_13"); //Dobrze. Ruszaj teraz w drogê do Mistrza Isgarotha.
};
func VOID DIA_Vatras_MISSION_YES()
{
	AI_Output (other, self, "DIA_Vatras_MISSION_YES_15_00"); //Mo¿esz na mnie liczyæ.
	AI_Output (self, other, "DIA_Vatras_Add_05_11"); //Œwietnie. Zabierz zatem tê wiadomoœæ i wybierz jeden ze zwojów z zaklêciami.
	AI_Output (self, other, "DIA_Vatras_Add_05_12"); //Gdy dostarczysz wiadomoœæ, otrzymasz odpowiedni¹ nagrodê.
	
	B_GiveInvItems (self, hero, ItWr_VatrasMessage,1); 
	MIS_Vatras_Message = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Botschaft,LOG_RUNNING);
	B_LogEntry (TOPIC_Botschaft,"Vatras da³ mi wiadomoœæ dla Mistrza Isgarotha, którego znajdê w kaplicy przed klasztorem.");
	
	Info_ClearChoices 	(DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Wezmê zaklêcie œwiat³a.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Wybieram zaklêcie uzdrawiaj¹ce.",DIA_Vatras_MISSION_HEAL);	
	Info_AddChoice 		(DIA_Vatras_MISSION,"Daj mi Lodow¹ Strza³ê.",DIA_Vatras_MISSION_ICE);	
};
FUNC VOID DIA_Vatras_MISSION_NO ()
{	
	//AI_Output	(other, self, "DIA_Vatras_MISSION_NO_15_00"); //Such dir einen anderen Laufburschen, alter Mann!
	AI_Output (other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //Nie teraz!
	AI_Output (self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //Nie ma sprawy - poœlê kogoœ innego.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_HEAL()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //Wybieram zaklêcie uzdrawiaj¹ce.
	 B_SayVatrasGo();
	 
	B_GiveInvItems (self, hero,ItSc_LightHeal ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_ICE()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //Daj mi Lodow¹ Strza³ê.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Icebolt ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_LIGHT()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //Wezmê zaklêcie œwiat³a.
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
	
	description	= "Dostarczy³em twoj¹ wiadomoœæ.";
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
	AI_Output (other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //Dostarczy³em twoj¹ wiadomoœæ.
	AI_Output (self, other, "DIA_Vatras_Add_05_14"); //Przyjmij wiêc moje podziêkowanie. Mo¿esz teraz wybraæ swoj¹ nagrodê.
	
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	
	Info_ClearChoices (DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 szczaw królewski",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"Pierœcieñ zrêcznoœci",DIA_Vatras_MESSAGE_SUCCESS_Ring);	
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 bry³ka rudy",DIA_Vatras_MESSAGE_SUCCESS_Ore);
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
		
		AI_Output (self, other, "DIA_Vatras_Add_05_06"); //S³uchajcie, moi drodzy! Jestem potrzebny gdzie indziej.
		if (dauer == kurz)
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_07"); //To nie potrwa d³ugo. Po powrocie opowiem wam resztê tej historii.
		}
		else //lang
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_08"); //Nie wiem, kiedy powrócê. Jeœli chcecie poznaæ zakoñczenie tej historii, przeczytajcie odpowiednie pisma.
			
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_09"); //Niech Adanos bêdzie z wami!
		
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

	description	 = 	"Mam pewien problem z Okiem Innosa.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //Mam pewien problem z Okiem Innosa - byæ mo¿e bêdzie mi potrzebna twoja pomoc.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //A bêdê musia³ w tym celu opuœciæ miasto?
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //Nie wiem. Byæ mo¿e.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //Od kilku dni czekam na zmiennika. Inni Magowie Wody powinni byli wróciæ tu ju¿ jakiœ czas temu.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //Postaraj siê, aby przys³ali mi zmiennika, a ja pomogê ci w rozwi¹zaniu twojego problemu.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Vatras nie mo¿e mi pomóc z Okiem Innosa, dopóki inny Mag Wody nie zajmie jego miejsca w mieœcie."); 
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

	description	 = 	"Przyby³ zmiennik.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //Przyby³ zmiennik.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //Czy sprawy spoza gór na pó³nocnym wschodzie zosta³y rozwi¹zane?
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //Tak. Kruk nie ¿yje i nie stanowi ju¿ zagro¿enia.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //To doskona³e wieœci. Mam nadziejê, ¿e podobne rzeczy ju¿ siê nie powtórz¹.

	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //Teraz mogê ci pomóc rozwi¹zaæ problem.
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //O ile dobrze pamiêtam, wi¹za³ siê on z Okiem Innosa?
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

	description	 = 	"Oko Innosa zosta³o uszkodzone.";
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
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //Przysy³a mnie Pyrokar.
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //Przysy³a mnie Xardas.
	};

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);

	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //Oko Innosa zosta³o uszkodzone.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //Wiem. Donieœli mi o tym napotkani nowicjusze.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //Poszukiwacze wykorzystali w tym celu œwiêty S³oneczny Kr¹g Magów Ognia.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //To znak, ¿e nieprzyjaciel znacznie urós³ w si³ê.

	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Wieœci szybko siê roznosz¹.", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten );

	if (hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?", DIA_Vatras_INNOSEYEKAPUTT_warumdu );
	};
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Co siê teraz stanie z Okiem?", DIA_Vatras_INNOSEYEKAPUTT_Auge );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //Co siê teraz stanie z Okiem?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //Musimy spróbowaæ je naprawiæ. Nie bêdzie to jednak ³atwe zadanie.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //Oprawa pêk³a na dwie czêœci. Zrêczny kowal zdo³a zapewne po³¹czyæ je z powrotem.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //Ale to mniejsza czêœæ problemu. Bardziej martwi mnie sam klejnot.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //Jest matowy, pozbawiony blasku. Nieprzyjaciel dok³adnie wiedzia³, jak unieszkodliwiæ amulet.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //Jest tylko jeden na to sposób - po³¹czone moce wszystkich trzech bogów powinny tego dokonaæ.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //W miejscu zniszczenia amuletu nale¿y przeprowadziæ odpowiedni rytua³ odwracaj¹cy. Mo¿e wtedy klejnot odzyska swój ogieñ.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //Problem w tym, ¿e musisz sprowadziæ do tego miejsca ziemskich przedstawicieli wszystkich trzech bogów.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //Potrzebujemy te¿ znacznej iloœci bagiennego ziela. Myœlê, ¿e nie mniej ni¿ 3 roœliny.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Kim maj¹ byæ ci trzej przedstawiciele bogów?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Gdzie mogê znaleŸæ to bagienne ziele?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //Gdzie mogê znaleŸæ to bagienne ziele?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //Podobno w tych lasach mieszka stara wiedŸma imieniem Sagitta. Mo¿e u niej znajdziesz takie ziele.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //Ewentualnie rozejrzyj siê trochê na przystani.
	

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //Kim maj¹ byæ ci trzej przedstawiciele bogów?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //Adanosa mogê reprezentowaæ osobiœcie.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //Przedstawicielem Innosa powinien byæ Pyrokar, najwy¿szy z Magów Ognia.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //Ale nie wiem, kto móg³by reprezentowaæ Beliara. Potrzebujemy prawdziwego mistrza czarnej magii.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Czarnej magii? Mo¿e Xardas?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //Czarnej magii? Mo¿e Xardas?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //Tak! To siê powinno udaæ!
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //Nie wiem tylko, czy uda ci siê sprowadziæ obydwu.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //Ju¿ widzê wyraz twarzy Pyrokara, gdy dowie siê, ¿e musi wspó³pracowaæ z Xardasem.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Muszê ju¿ iœæ.", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter );
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //Musisz popytaæ ludzi o kowala, który zna siê na jubilerstwie.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //Podejrzewa³em, ¿e prêdzej czy póŸniej dojdzie do czegoœ takiego.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //Pyrokar ma siê za tak potê¿nego i niezwyciê¿onego, ¿e czêsto zachowuje siê wrêcz nieodpowiedzialnie.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //I zosta³ za to ukarany - straci³ Oko Innosa.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //Myœlê jednak, ¿e podœwiadomie polega na mocy powierzonej mi przez Adanosa.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //Lepiej nie myœleæ, co by siê sta³o, gdyby mnie teraz zabrak³o.

};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //Wieœci szybko siê rozchodz¹.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //I bardzo dobrze. Nieprzyjaciel te¿ nie bêdzie czeka³ bezczynnie.

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //Muszê ju¿ iœæ.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //Ja te¿ wyruszê w drogê, by przygotowaæ S³oneczny Kr¹g do ceremonii.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //Przyœlij do mnie Xardasa i Pyrokara. I nie zapomnij o bagiennym zielu! Liczê na ciebie.
	
	B_LogEntry (TOPIC_INNOSEYE, "Vatras chce odprawiæ rytua³ w S³onecznym Krêgu, aby uzdrowiæ Oko. Muszê przekonaæ Xardasa i Pyrokara, aby wziêli udzia³ w tym przedsiêwziêciu. Powinienem tak¿e znaleŸæ kowala, który naprawi pêkniêt¹ oprawê amuletu.");

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

	description	 = 	"Co z Okiem Innosa?";
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
	AI_Output			(other, self, "DIA_Vatras_RitualInnosEyeRepair_15_00"); //Co z Okiem Innosa?
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //Tylko rytua³ odwrócenia odprawiony w S³onecznym Krêgu przeze mnie, Xardasa i Pyrokara mo¿e przywróciæ Oku dawn¹ moc.
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //Pamiêtaj, ¿eby przynieœæ Oko z naprawion¹ opraw¹.
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

	description	 = 	"Zrobi³em wszystko, o co prosi³eœ.";
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
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_00"); //Zrobi³em wszystko, o co prosi³eœ. Oto naprawione Oko.
	B_GivePlayerXP (XP_RitualInnosEyeRuns);

	B_GiveInvItems 		(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem 	(self, ItMi_InnosEye_Broken_MIS);

	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_01"); //Œwietnie. Mo¿emy zatem przyst¹piæ do odprawienia rytua³u.
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_02"); //A co z bagiennym zielem?
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_03"); //Ach, tak. Przynios³eœ dla mnie trzy roœliny?
	
	if (B_GiveInvItems (other, self, ItPL_SwampHerb,3))
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_04"); //Tak. Oto one.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_05"); //Znakomicie.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_06"); //Nie. Niestety, nie.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_07"); //Trudno. Poradzimy sobie jakoœ bez nich.
	};
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_08"); //Dobrze siê spisa³eœ, ale teraz odsuñ siê na bok, byœmy mogli przyst¹piæ do ceremonii. Niech zjednocz¹ siê nasze si³y!
 	
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
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //Ju¿ po wszystkim. Uda³o siê nam pokrzy¿owaæ plan nieprzyjaciela. Oko odzyska³o sw¹ moc!
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //Pyrokar wyjaœni ci, jak u¿ywaæ Oka.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //Mam nadziejê, ¿e spotkamy siê jeszcze, gdy wype³nisz ju¿ swoj¹ misjê. Bywaj!
 	
 	B_LogEntry (TOPIC_INNOSEYE, "Oko zosta³o uzdrowione. Kiedy Pyrokar mi je wrêczy, udam siê na polowanie na smoki.");
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

	description	 = 	"Dziêki ci za pomoc w naprawieniu Oka Innosa.";
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
	AI_Output			(other, self, "DIA_Vatras_PERMKAP3_15_00"); //Dziêki ci za pomoc w naprawieniu Oka Innosa.
	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_01"); //Zachowaj podziêkowania na póŸniej. Czeka ciê teraz najwiêksze wyzwanie.

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_02"); //Porozmawiaj z Pyrokarem. On ci wszystko wyt³umaczy.
	};

	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_03"); //Mam nadziejê, ¿e jeszcze siê kiedyœ spotkamy, mój synu.

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

	description	 = 	"¯ona Lobarta, Hilda, zachorowa³a.";
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
	AI_Output			(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //¯ona Lobarta, Hilda, zachorowa³a.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //Co? Znowu? Ta biedna kobieta powinna bardziej na siebie uwa¿aæ.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //Jeszcze jedna ciê¿ka zima, a odejdzie z tego œwiata. Dobrze. Dam jej lekarstwo, które zmniejszy gor¹czkê.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //Hmmm... Skoro ju¿ tu jesteœ, móg³byœ jej zanieœæ lekarstwo?
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

	description	 = 	"Chyba mam dreszcze.";
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
	AI_Output			(other, self, "DIA_Vatras_OBSESSION_15_00"); //Chyba mam dreszcze.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_01"); //Nie wygl¹dasz najlepiej. Chyba zbyt d³ugo wystawia³eœ siê na czarne spojrzenia Poszukiwaczy.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_02"); //Mogê uzdrowiæ twoje cia³o, ale spokój duszy odzyskasz jedynie w klasztorze. Porozmawiaj z Pyrokarem. On ci pomo¿e.
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
	description = "Nie musimy ju¿ obawiaæ siê smoków.";
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
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_00"); //Nie musimy ju¿ obawiaæ siê smoków.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_01"); //Wiedzia³em, ¿e wrócisz ca³y i zdrowy! Jednak najwiêksze wyzwanie dopiero przed tob¹.
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_02"); //Tak, wiem.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_03"); //Zatem wyposa¿ siê odpowiednio i przyjdŸ do mnie, gdybyœ potrzebowa³ pomocy. Zawsze miej przy sobie Oko Innosa! Niech Adanos bêdzie z tob¹.
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
	description	 = 	"Wiem, gdzie czai siê nasz nieprzyjaciel.";
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
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //Wiem, gdzie czai siê nasz nieprzyjaciel.
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //Zatem nie traæmy czasu i pierwsi siê z nim rozprawmy.
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //Chcesz mi towarzyszyæ?
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //D³ugo siê nad tym zastanawia³em, ale teraz nie mam w¹tpliwoœci. Chcê wyruszyæ z tob¹.
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                    	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                    	
	B_LogEntry (TOPIC_Crew,"Vatras, ku mojemu zaskoczeniu, chce mi towarzyszyæ w mojej wyprawie. Tak doœwiadczony towarzysz by³by dla mnie prawdziwym skarbem.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Vatras_KnowWhereEnemy_15_04"); //Moja za³oga jest i tak bardzo liczna. Obawiam siê, ¿e mo¿e dla ciebie zabrakn¹æ miejsca.
		AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //Zatem zwolnij dla mnie miejsce. Bêdê ci potrzebny.
	}
	else 
	{
		Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Muszê to sobie jeszcze przemyœleæ.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Jestem zaszczycony twoj¹ propozycj¹.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //Jestem zaszczycony twoj¹ propozycj¹. Spotkamy siê na przystani.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //Spiesz siê. Nieprzyjaciel nie zasypia gruszek w popiele.
	
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
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_No_15_00"); //Muszê to sobie jeszcze przemyœleæ.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_No_05_01"); //Jak uwa¿asz. Wróæ do mnie, gdy ju¿ podejmiesz decyzjê.

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
	description	 = 	"Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.";
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
	AI_Output			(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.
	AI_Output			(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //Mo¿e masz racjê... Mimo to, jeœli zechcesz, wyruszê z tob¹! Pamiêtaj o tym.
	
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
	description	 = 	"Chcê ciê zabraæ na wyspê nieprzyjaciela.";
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
	AI_Output	(other, self, "DIA_Vatras_StillNeedYou_15_00"); //Chcê ciê zabraæ na wyspê nieprzyjaciela.
	AI_Output	(self, other, "DIA_Vatras_StillNeedYou_05_01"); //M¹dra decyzja. Mam nadziejê, ¿e ostateczna?
		
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


