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
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //Du�o plotek kr��y w Khorinis na tw�j temat.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //Podobno jeste� zamieszany w mordowanie niewinnych...
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //Ostrzegam ci� - je�li to oka�e si� prawd�... 
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //Nie schod� ze �cie�ki r�wnowagi i ocalenia tego �wiata - w przeciwnym wypadku czekaj� ci� powa�ne konsekwencje.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //Czym mog� s�u�y�?
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
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Odwal si�.", DIA_Addon_Vatras_LastWarning_Arsch );	 
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Przykro mi... Nie wiedzia�em, co robi�.", DIA_Addon_Vatras_LastWarning_Reue );	 
};
func void DIA_Addon_Vatras_LastWarning_Arsch ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //Odwal si�.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //Nie s�ysz� w twoich s�owach skruchy.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //Nie pozostawiasz mi �adnego wyboru.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff ();
};

func void DIA_Addon_Vatras_LastWarning_Reue ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //Przykro mi... Nie wiedzia�em, co robi�.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //B�d� si� za ciebie modli� w nadziei, �e odnajdziesz jeszcze kiedy� r�wnowag�.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //Nie wa� si� ju� jednak nigdy pope�ni� �adnego mordu.
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
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //Twe s�owa s� r�wnie z�e, jak twoje uczynki.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //Twoim bezsensownym morderstwom nie ma ko�ca.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //Nie pozostawiasz mi �adnego wyboru. 
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
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //Je�li wpadniesz przypadkiem na Laresa...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //Jest co�, co mo�esz dla mnie zrobi�.
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //Id� do portu - znajdziesz tam niejakiego Laresa.
			Vatras_GehZuLares = TRUE;
		};	
			
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //Przeka� mu ten ornament i ka� mu go odda�. B�dzie wiedzia� co zrobi�.
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
	AI_Output (self, other, "DIA_Vatras_GREET_05_00"); //Niech �aska Adanosa b�dzie z tob�.
	AI_Output (other, self, "DIA_Vatras_GREET_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_Vatras_GREET_05_02"); //Nazywam si� Vatras. Jestem s�ug� Adanosa, stra�nika niebia�skiej i ziemskiej harmonii.
	AI_Output (self, other, "DIA_Vatras_GREET_05_03"); //Co mog� dla ciebie zrobi�?
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
		AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //Owszem. Tylko... By� otwarty. Mam nadziej�, �e nie przeczyta� go nikt niepowo�any.
	};

	B_UseFakeScroll();
	
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //Tak... To naprawd� wa�na wiadomo��.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //Ciekawi mnie, jak wszed�e� w jej posiadanie?
	
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Zabra�em j� bandytom.", DIA_Addon_Vatras_Cavalorn_Bandit );

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Od Cavalorna, my�liwego.", DIA_Addon_Vatras_Cavalorn_Cavalorn );
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};
func void DIA_Addon_Vatras_Cavalorn_Bandit ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //Zabra�em j� bandytom.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //Och! Adanosie! Niedobrze, bardzo niedobrze.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //Je�li m�wisz prawd�, to mamy ogromny problem.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //Trzeba si� tym jak najszybciej zaj��.
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};
func void DIA_Addon_Vatras_Cavalorn_Cavalorn ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //Od Cavalorna, my�liwego.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //Cavalorn? A gdzie on si� podziewa?
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //Poleci� mi przekaza�, �e nie zd��y� na czas i �e zmierza na miejsce spotkania - gdziekolwiek by to nie by�o.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //Widz�, �e zas�u�y�e� sobie na jego zaufanie... Ja r�wnie� b�d� ci chyba musia� zaufa�.
	
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
	description	= "Przysy�a mnie Cavalorn!";
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
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_00"); //Przysy�a mnie Cavalorn!
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_01"); //Naprawd�? I co powiedzia�?
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_02"); //�e nie wzgardzisz pomoc� os�b wszechstronnie uzdolnionych.
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_03"); //A wi�c chcesz si� do nas przy��czy� - czy tak, m�j synu?
};

// ************************************************************
// 		Tell Me About RING 		(Trigger f�r MIS_Waffenh�ndler)
// ************************************************************
instance DIA_Addon_Vatras_TellMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_TellMe_Condition;
	information	= DIA_Addon_Vatras_TellMe_Info;
	permanent	= TRUE;

	description	= "Powiedz mi co� o Wodnym Kr�gu.";
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
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_15_00"); //Powiedz mi co� o Wodnym Kr�gu.

	if (!Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_01"); //A czemu mia�bym to zrobi�?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_02"); //Nie musisz wiedzie� wszystkiego, dop�ki nie staniesz si� jednym z nas.
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_03"); //Co nieco mog� ci jednak opowiedzie�...
		
		Info_ClearChoices (DIA_Addon_Vatras_TellMe);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Czym si� tak w zasadzie zajmujecie?", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Gdzie s� Magowie Wody?", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Kim s� cz�onkowie Wodnego Kr�gu?", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};
func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_TellMe);
};
func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //Czym si� tak w zasadzie zajmujecie?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //Stoimy pomi�dzy porz�dkiem symbolizowanym przez Innosa i chaosem, kt�rego reprezentantem jest Beliar.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //Gdyby kt�ra� ze stron zatryumfowa�a, oznacza�oby to albo utrat� wolno�ci, albo rz�dy �mierciono�nego chaosu.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //Staramy si� utrzyma� r�wnowag� w tym �wiecie - tylko w ten spos�b mo�e w nim istnie� �ycie.
	
	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Hmm... A mo�e konkretniej?", DIA_Addon_Vatras_TellMe_Konkret);
	};
};
func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //Hmm... A mo�e konkretniej?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //Od upadku Bariery pojawi�o si� sporo nowych zagro�e�.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //Najoczywistszym z nich s� bandyci.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //Nie do��, �e spokojne podr�owanie przez wysp� sta�o si� niemal niemo�liwe...
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //...to jeszcze wspomaga ich kto� w tym mie�cie!
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //Ustalili�my, �e bandyci regularnie zaopatruj� si� w bro� u jednego z kupc�w z Khorinis. 
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //Pr�bujemy dotrze� do takich os�b, aby uniemo�liwi� im dzia�anie na szkod� miasta.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //Daj zna�, gdy zechcesz zaj�� si� t� spraw�.
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"W Khorinis jest handlarz broni�, kt�ry zaopatruje bandyt�w. Vatras chce, �ebym sprawdzi� t� informacj�."); 
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin, kwatermistrz paladyn�w, zajmuje si� sprawami handlarza broni�. Znajd� go w magazynach paladyn�w, w porcie."); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Wodny Kr�g martwi si� bandytami w Khorinis."); 
};
func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //Gdzie s� Magowie Wody?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //Badaj� ruiny prastarej kultury gdzie� na p�nocny wsch�d od Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //Zak�adamy, �e znajduj� si� tam wrota do nieznanej dotychczas cz�ci wyspy.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Pozostali Magowie Wody zbadaj� ruiny staro�ytnej kultury na p�nocny wsch�d od Khorinis. By� mo�e znajduje si� tam przej�cie do dotychczas niezbadanej cz�ci wyspy."); 

	Info_AddChoice (DIA_Addon_Vatras_TellMe, "Opowiedz mi wi�cej o tym niezbadanym terenie.", DIA_Addon_Vatras_TellMe_Unexplored);
};
func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //Opowiedz mi wi�cej o tym niezbadanym terenie.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //Mog� wys�a� ci� do Saturasa z listem polecaj�cym, je�li interesuje ci� do��czenie do ekspedycji.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //Rzecz jasna tylko wtedy, gdy b�dziesz jednym z nas.
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //Rzecz jasna.
	B_LogEntry (TOPIC_Addon_KDW,"Zanim do��cz� do ekspedycji Mag�w Wody, Vatras chce, abym zosta� cz�onkiem Wodnego Kr�gu."); 
};
func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //Kim s� cz�onkowie Wodnego Kr�gu?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //Tego dowiesz si�, gdy ju� sam w nim b�dziesz.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //Z pewno�ci� spotkasz niekt�rych z nas...
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

	description	= "Chc� si� przy��czy� do Wodnego Kr�gu!";
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
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //Chc� si� przy��czy� do Wodnego Kr�gu!
	
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //Doskonale. Pierwsze wymaganie ju� spe�niasz.
		AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //O co ci chodzi?
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //Przynajmniej jeden z nas ci ufa - inaczej by� si� o nas nie dowiedzia�.
	};
	
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //Ale ja nic o tobie nie wiem...
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_03"); //Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erz�hle mir was �ber dich.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_04"); //A co chcia�by� wiedzie�?
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_05"); //Powiedz mi, sk�d pochodzisz... i co sprowadza ci� do tego miasta.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_06"); //Mam wa�n� wiadomo�� dla przyw�dcy paladyn�w.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_07"); //Co to za wiadomo��?
		
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Przyby�y smoki...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Wkr�tce wydarz� si� straszliwe rzeczy.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //Niedaleko st�d zbiera si� pot�na armia. Jej przyw�dcami s� smoki, a celem podb�j ca�ego kraju.
	
	if (Vatras_First == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //Hmmm. Je�li m�wisz prawd�, to r�wnowaga na tych ziemiach zosta�a zak��cona. Kto ci o tym powiedzia�?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //Smoki? M�wisz o istotach, o kt�rych zwykle wspominaj� tylko legendy. Kto ci o tym powiedzia�?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ach, s�ysza�em jakie� plotki...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Powiedzia� mi o tym mag Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //Wkr�tce wydarz� si� straszliwe rzeczy.
	
	if (Vatras_First == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //Aha! A kto ci o tym powiedzia�?
	}
	else 
 	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //Straszliwe rzeczy, tak? A sk�d to przypuszczenie?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ach, s�ysza�em jakie� plotki...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Powiedzia� mi o tym mag Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = 2;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //Powiedzia� mi o tym mag Xardas. To on wys�a� mnie, bym ostrzeg� paladyn�w.
	
	if (Vatras_Second == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //Wiem, �e jest on m�drym i pot�nym mistrzem magii. Powiedz mi jeszcze, sk�d przybywasz?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //Ten nekromanta... A wi�c �yje... i on ci� tu przys�a�? Kim jeste� naprawd�?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Podr�nikiem z dalekiego po�udnia...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Dawnym skaza�cem...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //Ach, s�ysza�em jakie� plotki...
	
	if (Vatras_Second == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //A pami�tasz chocia�, GDZIE je s�ysza�e�?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //Tak... I dlatego wyruszy�e� w t� podr�? Kim jeste� naprawd�?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Podr�nikiem z dalekiego po�udnia...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Dawnym skaza�cem...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = 2;
};
func VOID B_Vatras_INFLUENCE_REPEAT()
{
	//RAUS wegen ADDON
	//AI_Output (other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); //Und, gibst du mir jetzt deinen Segen?	
	
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); //Dobrze, podsumujmy:
	
	if (Vatras_Third == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //Jeste� zbieg�ym wi�niem...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //Jeste� podr�nikiem z dalekiego po�udnia...
	};
	if (Vatras_Second  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //...kt�remu nekromanta Xardas powiedzia�...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //...kt�ry us�ysza� plotki...
	};
	if (Vatras_First  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //...�e armia smok�w zamierza podbi� ca�y kraj.
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //...�e wydarz� si� wkr�tce straszliwe rzeczy.
	};
		
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //I zamierzasz ostrzec o tym paladyn�w.
	if (Vatras_First   == TRUE)
	&& (Vatras_Second  == TRUE)
	&& (Vatras_Third   == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //Brzmi to do�� niewiarygodnie, ale nie wyczuwam, by� pr�bowa� mnie ok�ama�.
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //Dlatego musz� przyj��, �e kieruj� tob� szlachetne pobudki.
		
		AI_Output (self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //Dostaniesz szans� na do��czenie do Wodnego Kr�gu.
		
		Info_ClearChoices  (DIA_Addon_Vatras_WannaBeRanger);
	}
	else 
	{
		AI_Output (self, other, "DIA_Vatras_Add_05_00"); //My�l�, �e co� przede mn� ukrywasz.
		AI_Output (self, other, "DIA_Vatras_Add_05_01"); //Je�li obawiasz si�, �e przeka�� komu� to, co mi powiesz, mo�esz by� spokojny.
		AI_Output (self, other, "DIA_Vatras_Add_05_02"); //Przysi�g�em zachowywa� wszystkie powierzane mi tajemnice dla siebie.
		if (Wld_IsTime(05,05,20,10))
		{
			AI_Output (other, self, "DIA_Vatras_Add_15_03"); //A co z tymi wszystkimi lud�mi?
			AI_Output (self, other, "DIA_Vatras_Add_05_04"); //Oni nie rozumiej� nawet po�owy z tego, czego ich nauczam. Nie musisz si� obawia�.
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_05"); //Zacznijmy jeszcze raz, od pocz�tku. Co to za wiadomo��?
		
		//ADDON - SC kann nicht mehr versagen!
		//Vatras_Chance = TRUE; 
		Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Przyby�y smoki...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Wkr�tce wydarz� si� straszliwe rzeczy.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
	
	//else-Fall raus - Addon
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); //Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //Dawnym skaza�cem z kolonii wi�ziennej Khorinis.
	Vatras_Third = TRUE;
	
	B_Vatras_INFLUENCE_REPEAT();
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //Podr�nikiem z dalekiego po�udnia...
	Vatras_Third = FALSE;
		
	B_Vatras_INFLUENCE_REPEAT();
}; 
// ************************************************************
// 			  			How to JOIN
// ************************************************************
// ------------------------------------------------------------
// Was mu� ich tun?
// ------------------------------------------------------------
instance DIA_Addon_Vatras_HowToJoin	(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_HowToJoin_Condition;
	information	= DIA_Addon_Vatras_HowToJoin_Info;

	description	= "Co musz� zrobi�, aby do was do��czy�?";
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
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //Co musz� zrobi�, aby do was do��czy�?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //Przede wszystkim musisz mie� �wiadomo��, �e bierzesz na swe barki wielk� odpowiedzialno��.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //Nie przyjmuj� zg�osze� ka�dego.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //Chcesz by� jednym z nas? Udowodnij, �e twoje post�powanie przystaje do naszego.
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //A konkretniej?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //Ka�dy kandydat musi wykona� wa�kie zadanie, zanim otrzyma zgod� na przy��czenie si� do nas.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //Dopiero po tym mog� rozwa�y� twoj� pro�b� o zgod� na do��czenie do naszej walki o utrzymanie r�wnowagi na tej wyspie.
	
	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "To jak mog� ci� przekona�?", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Uwolni�em wielu ludzi. Bariera zosta�a zniszczona...", DIA_Addon_Vatras_HowToJoin_FreedMen );
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Pokona�em �ni�cego. To chyba dosy� znacz�ce osi�gni�cie?", DIA_Addon_Vatras_HowToJoin_Sleeper );
};
func void DIA_Addon_Vatras_HowToJoin_Sleeper ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //Pokona�em �ni�cego. To chyba dosy� znacz�ce osi�gni�cie?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //Du�o opowie�ci si� ostatnio s�yszy...
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //Nawet historie o wyp�dzeniu z tego �wiata potwora znanego jako �ni�cy.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //Nie s�ysza�em jednak, aby by�a to wy��cznie twoja zas�uga - cho� widz�, �e wierzysz w swe s�owa.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //Troch� mnie to denerwuje, ale nie mog� mie� pewno�ci, �e zmys�y mnie nie zwodz�.
};
func void DIA_Addon_Vatras_HowToJoin_FreedMen ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //Uwolni�em wielu ludzi. Bariera zosta�a zniszczona...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //No, je�li to naprawd� twoja zas�uga...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //Ludzie, kt�rych uwolni�e�... To nie byli tylko Magowie Wody i niewinni osadnicy.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //Po ca�ej krainie rozpanoszyli si� r�wnie� r�noracy bandyci, kt�rzy zagra�aj� teraz obywatelom tego miasta.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //Zaj�li ju� cz�� teren�w okalaj�cych miasto - niemal nie da si� bezpiecznie opu�ci� Khorinis.
};
func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //To jak mog� ci� przekona�?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //Ostatnio w Khorinis dzieje si� co� dziwnego.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //Niemal codziennie znikaj� kolejni mieszka�cy.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //Gdyby uda�o ci si� ustali�, co si� z nimi sta�o, miejsce w Wodnym Kr�gu masz zapewnione.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras nie pozwoli mi wst�pi� do Wodnego Kr�gu, je�li nie rozwi��� zagadki zaginionych ludzi."); 

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //Tylko �e...
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //Tak?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //...najpierw musisz skontaktowa� si� z paladynami i przekaza� im t� wiadomo��.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //S�dz�, �e to bardzo wa�ne.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //Pom�w z Lordem Hagenem.
	
	B_LogEntry (TOPIC_Addon_RingOfWater,"Mam dostarczy� Lordowi Hagenowi wa�n� wiadomo�� od Vatrasa."); 

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

	description	= "Ale przecie� mnie do niego nie dopuszcz�!";
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
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //Ale przecie� mnie do niego nie dopuszcz�!
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //Ale� dopuszcz�, dopuszcz�. Je�li b�dziesz cz�onkiem wp�ywowej organizacji...
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //Kr�g ma swoje kontakty, czasem do�� przydatne.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //Postaramy si� zadba�, aby� m�g� dostarczy� wiadomo�� Hagenowi jak najszybciej.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //Pom�w o tym z moim zaufanym towarzyszem, Laresem. Mo�e on zdo�a ci pom�c.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Aby zosta� wpuszczonym na dw�r Lorda Hagena, musz� wst�pi� do jednej z pot�nych gildii w Khorinis."); 
	

	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Tak zrobi�.", DIA_Addon_Vatras_GuildBypass_BACK );
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Do kt�rej gildii mam si� przy��czy�?", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};
func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //Tak zrobi�.
	Vatras_GehZuLares = TRUE;
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
};
func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //Do kt�rej gildii mam si� przy��czy�?
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //Jedynie trzy s� do�� pot�ne i wp�ywowe, aby si� liczy�.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //To stra�, Magowie Ognia i najemnicy z farmy Onara.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //Wyb�r nale�y do ciebie.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //Lares mo�e pom�c ci w podj�ciu tej trudnej decyzji - lepiej z nim pom�w.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Istniej� trzy pot�ne gildie, do kt�rych mo�na wst�pi�: Magowie Ognia, stra� miejska oraz najemnicy przebywaj�cy w pobli�u posiad�o�ci w�a�ciciela ziemskiego."); 
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Tak zrobi�.", DIA_Addon_Vatras_GuildBypass_BACK );
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

	description	= "Jestem got�w wst�pi� w szeregi Wodnego Kr�gu!";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //Jestem got�w wst�pi� w szeregi Wodnego Kr�gu!
	AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //Dostarczy�e� sw� wiadomo�� Lordowi Hagenowi?
	
	if (Kapitel >= 2) //Pass-Schl�ssel von Hagen
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //Owszem.
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //Nakaza� mi jednak uda� si� do G�rniczej Doliny i dostarczy� mu dow�d na potwierdzenie moich s��w!
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //Sam musisz zdecydowa�, co dalej.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //Dla mnie liczy�o si� dostarczenie wiadomo�ci. To, czy paladyni podejm� jakie� dzia�ania, czy b�d� czeka� na dodatkowe dowody, zale�y ju� od Hagena.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //Co do ciebie...
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //Dobrze.
		};
		
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //Dowiod�e� swej warto�ci - zostaniesz jednym z nas. B�dziesz podr�owa� po tej krainie i wype�nia� wol� Adanosa.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //Niniejszym daj� ci Pier�cie� Wody - oby pom�g� ci znale�� sojusznik�w i utrzyma� wraz z nimi r�wnowag� tego �wiata.
		CreateInvItems (self, ItRi_Ranger_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Addon, 1);		
		if (hero.guild == GIL_KDF)
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //Szczeg�lnie cieszy mnie fakt, �e jeste� pierwszym Magiem Ognia w�r�d nas.
		};
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //Niech ci� Adanos chroni. Id� teraz pozna� swych wsp�braci.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //Czekaj� na ciebie w gospodzie 'Martwa Harpia', gdzie powitaj� ci� w�r�d nas.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //Chyba znasz to miejsce? Znajduje si� na drodze do farmy Onara.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //Nie zapomnij za�o�y� pier�cienia, tak aby twoi bracia mogli ci� po nim rozpozna�.
		
		B_LogEntry (TOPIC_Addon_RingOfWater,"Nale�� teraz do Wodnego Kr�gu i powinienem spotka� si� z mymi bra�mi w gospodzie 'Martwa Harpia'."); 

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP (XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //Nie, jeszcze nie.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //Wi�c si� pospiesz! To wiadomo�� ogromnej wagi!
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
	description = "Przysy�aj� mnie cz�onkowie Kr�gu.";
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
	AI_Output (other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //Przysy�aj� mnie cz�onkowie Kr�gu.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //Doskonale - i tak ju� na ciebie czeka�em.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //Zaraz wy�l� ci� na drug� stron� portalu wraz z innymi Magami Wody.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //Masz tropi� Magnata imieniem Kruk i ustali�, czemu porywa mieszka�c�w Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //My spr�bujemy rozwi�za� problem okolicznych bandyt�w.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //Daj t� notk� Saturasowi - od tej pory to on jest twoim zwierzchnikiem.
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //Lares doprowadzi ci� do niego, o ile sam nie dostarczy� jeszcze ornamentu.
	};
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven, 1);									
	B_GiveInvItems (self, other, ItWr_Vatras2Saturas_FindRaven, 1);	
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //Niech ci� Adanos prowadzi.
		
	B_LogEntry (TOPIC_Addon_KDW,"Vatras wys�a� mnie z listem do Saturasa. Powinienem teraz przej�� przez portal z pozosta�ymi Magami Wody i wy�ledzi� Kruka, dawnego magnata."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Sklaven,"Powinienem dowiedzie� si�, dlaczego Kruk kaza� porwa� mieszka�c�w Khorinis."); 


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
	description	= "Co do tych znikaj�cych ludzi...";
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
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //Co do tych znikaj�cych ludzi...
	AI_Output (self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //Tak?
	
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice (DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Wiem, gdzie przebywaj� zaginieni.", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Powiem ci, co uda�o mi si� do tej pory ustali�.", DIA_Addon_Vatras_MissingPeople_Report);
	};
	
	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Gdzie szuka� ich �ladu?", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};
func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
};
func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //Gdzie szuka� ich �ladu?
	AI_Output (self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //Wi�kszo�� z nich zagin�a w porcie - to chyba dobre miejsce do rozpocz�cia poszukiwa�.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"W porcie w Khorinis zagin�o najwi�cej os�b. Tam powinienem zacz�� swoje poszukiwania."); 
	
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};
func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //Powiem ci, co uda�o mi si� do tej pory ustali�.
	
	 if ((MIS_Akil_BringMissPeopleBack != 0)
	 || (MIS_Bengar_BringMissPeopleBack != 0))
	 &&	(MISSINGPEOPLEINFO[1] == FALSE)
	 {
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //Zagin�o r�wnie� paru farmer�w.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	 };
	
	if ((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //Podobno odpowiedzialni za to s� bandyci.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //Elvrich - czeladnik Thorbena - powiedzia� mi, �e to w�a�nie oni transportuj� porwanych drog� morsk�.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	
	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //Wydaje si�, �e zamieszani s� w to jacy� piraci, cho� nie wiem jeszcze na pewno, jak� odgrywaj� w tym wszystkim rol�.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};	
	
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //Uwolni�em Elvricha z �ap bandyt�w.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //Bandyci porwali dziewczyn� imieniem Lucia.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	
	if ((Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //Porwana dziewczyna, Lucia, zadawa�a si� p�niej z bandytami.
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //Jak si� wydaje, ju� z w�asnej woli.
		};
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};
		
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //Szajce przewodzi niejaki Dexter i to on odpowiada za porwania.
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //Pami�tam Dextera z kolonii karnej... Pracowa� wtedy dla innego magnata, Gomeza.
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //On ciebie te� z pewno�ci� zapami�ta� - miej si� na baczno�ci.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //Chyba jeste� na dobrym tropie - oby tak dalej.
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports );
		B_GivePlayerXP (XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //Czego si� dowiedzia�e�?
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //Niestety - niczego wa�nego.
	};
};
func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //Wiem, gdzie przebywaj� zaginieni.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //Czego uda�o ci si� dowiedzie�?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //Porwano ich i zabrano w odleg�y kraniec wyspy Khorinis. Zrobi� to niejaki Kruk.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //Co daje ci pewno��, �e tak rzeczywi�cie by�o?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //Czyta�em jego rozkazy. Okoliczni bandyci pracuj� dla niego.
	if (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	{	
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //Patrz.
		B_UseFakeScroll ();
	};
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //Dobra robota - a ju� zaczyna�em si� ba�, �e nigdy nie zdo�amy odkry� prawdy.
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
	description	 = 	"Zaginieni powr�cili.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_Free_15_00"); //Zaginieni powr�cili.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_01"); //Tak, uda�o ci si�! Nie ma to jak szcz�liwe zako�czenie.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_02"); //Jednak twoja podr� nie dobieg�a jeszcze ko�ca... Niech ci� Adanos b�ogos�awi.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_03"); //Adanosie, b�ogos�aw temu m�owi. O�wie� �cie�k�, po kt�rej st�pa, i daj mu si��, aby opar� si� wszystkim zagro�eniom.
	
	B_RaiseAttribute (other, ATR_MANA_MAX, 3);
	other.attribute[ATR_MANA]	   = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	
	Snd_Play ("Levelup");
	
	// ***Mike** Auskommentiert, weil FALSCHE funktion - bitte R�cksprache, bevor du's wieder �nderst
	//var string concatText;
	//concatText = ConcatStrings (NAME_Bonus_ManaMax,IntToString (4));
	//PrintScreen (concatText, -1,-1,FONT_ScreenSmall,2); 
};

// ************************************************************
// 			  				Waffenh�ndler
// ************************************************************
instance DIA_Addon_Vatras_Waffen (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Waffen_Condition;
	information	= DIA_Addon_Vatras_Waffen_Info;
	permanent 	= TRUE;
	description = "Co do tego handlarza broni�...";
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
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_15_00"); //Co do tego handlarza broni�...
	
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
	Info_AddChoice (DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if (Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Wiem, kto dostarcza uzbrojenie bandytom!", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Co wiesz o handlarzu broni�?", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};
func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
};
func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //Co wiesz o handlarzu broni�?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //Pom�w z Martinem, kwatermistrzem paladyn�w. Mo�e on dysponuje informacjami w tej sprawie.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //Powierzono mu zadanie zdemaskowania handlarza broni�.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //Znajdziesz go w porcie. Jak zobaczysz par� skrzy�, �ywno�� i paladyn�w, to i on b�dzie si� tam gdzie� kr�ci�.
		
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //Wiem, kto dostarcza uzbrojenie bandytom!
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //Nazywa si� Fernando.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //Doskonale. Martin podj�� odpowiednie kroki, aby zako�czy� ten proceder?
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //Tak. Zadba, aby dra� nie wyszed� za szybko z lochu.
		AI_Output	(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //Dobra robota, synu.

		if (Npc_KnowsInfo (other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //To co, jestem ju� got�w na zostanie cz�onkiem Wodnego Kr�gu?
			AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //Nie tak si� um�wili�my i dobrze o tym wiesz.
		};
		
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //Oby Adanos o�wietli� �cie�k�, po kt�rej kroczysz.
		
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //Jeszcze nie.
		AI_Output	(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //Pospiesz si� i mu o tym donie�! Trzeba jak najszybciej z tym sko�czy�!
	};
};

// ************************************************************
// 			  				Waffenh�ndler
// ************************************************************
instance DIA_Addon_Vatras_WISP (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_WISP_Condition;
	information	= DIA_Addon_Vatras_WISP_Info;

	description = "M�g�by� mi jako� pom�c w poszukiwaniach?";
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
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //M�g�by� mi jako� pom�c w poszukiwaniach?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //Strasznie uparty z ciebie cz�owiek. Prawd� m�wi�c... Chyba w czym� mog� ci pom�c.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //Dam ci ten amulet z rudy - z pewno�ci� ci si� przyda.
	CreateInvItems (self, ItAm_Addon_WispDetector, 1);									
	B_GiveInvItems (self, other, ItAm_Addon_WispDetector, 1);
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //To amulet ognika.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //Istnieje ich tylko kilka - zakl�ty w nim ognik ma specjalne zdolno�ci.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //Dzi�ki niemu mo�na widzie� rzeczy dla oka niewidoczne.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //Aby z niego skorzysta�, trzeba go za�o�y�.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //Je�li ognik s�abnie lub w og�le zniknie, za�� amulet ponownie, aby go zregenerowa�.
	
	B_LogEntry (TOPIC_Addon_BanditTrader,"Vatras da� mi 'Amulet szukaj�cego ognika', kt�ry przyda mi si� w poszukiwaniach handlarza broni�."); 
	Log_CreateTopic (TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned); 
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned_NF); 

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //Ognik umie r�wnie� wykrywa� bro�.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //Mo�e ci si� to przyda� w zadaniu zdemaskowania sprzedawcy mieczy.
	};

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //Dbaj o amulet, a na pewno ci si� przyda.

	Info_ClearChoices (DIA_Addon_Vatras_WISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Dzi�kuj�! B�d� o tym pami�ta�.", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "To wszystko, co ten ognik umie?", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "W tym amulecie jest ognik?", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;	
};
func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //Dzi�kuj�! B�d� o tym pami�ta�.
	Info_ClearChoices (DIA_Addon_Vatras_WISP);
};
func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //To wszystko, co ten ognik umie?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //Poza wykrywaniem uzbrojenia? Tylko je�li go nauczysz.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //O ile mi wiadomo, to Riordan potrafi uczy� te stworki nowych sztuczek. Przebywa teraz z Saturasem.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //Mo�e on ci wi�cej o nim opowie.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"Ogniki potrafi� znajdowa� nie tylko bro� bia��. Mag Wody, Riordian, mo�e nauczy� moje ogniki szukania innych przedmiot�w."); 
	};
};
func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //W tym amulecie jest ognik?
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //Ogniki to urocze stworzonka sk�adaj�ce si� z czystej energii magicznej.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //S� zwi�zane z magiczn� rud� tego �wiata - ona stanowi �r�d�o ich istnienia i ich mocy.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //Nie dziwi mnie, �e wcze�niej o nich nie s�ysza�e� - ujawniaj� si� tylko tym, kt�rzy przynosz� odpowiadaj�c� im rud�.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //Dzikie ogniki zosta�y brutalnie wyrwane ze swego �rodowiska i atakuj� ka�de stworzenie, kt�re si� do nich zbli�y.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //Tym �a�osnym istotom nie mo�na ju� pom�c - lepiej ich unika�.
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

	description	= "Znalaz�em t� kamienn� tabliczk�...";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //Znalaz�em t� kamienn� tabliczk�. Mo�esz mi co� o niej powiedzie�?
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //To artefakt prastarej kultury, kt�r� badamy ju� od d�u�szego czasu.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //Jest ich kilka rodzaj�w - cz�� zawiera informacje o historii tego dawnego ludu.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //I te mnie w�a�nie interesuj�. Przynie� mi wszystkie, kt�re uda ci si� znale��.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //Czeka ci� za to nagroda.

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
	description	= "Mam dla ciebie kolejn� kamienn� tabliczk�...";
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
		AI_Output	(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //Mam dla ciebie kolejn� kamienn� tabliczk�...
	}
	else 
	{
		//Fixme Joly --> Hier SC-output "Hier.." oder �hnliche --Mike
	};
	
	B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, anzahl);
		
	AI_Output	(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //�wietnie!
	
	if (anzahl >= 10)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //Zwi�ksz� tw� moc magiczn�.
		B_RaiseAttribute	(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute	(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //Przyjmij w nagrod� te kilka zwoj�w...
		B_GiveInvItems (self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tr�nke
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //Przyjmij w nagrod� te kilka eliksir�w...
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

	description	 = 	"Lares wspomnia�, �e mo�esz pom�c mi dosta� si� do klasztoru Mag�w Ognia.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //Lares wspomnia�, �e mo�esz pom�c mi dosta� si� do klasztoru Mag�w Ognia.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //Taki jest tw�j wyb�r? �cie�ka ognia?
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //Owszem, mam zamiar zosta� Magiem Ognia.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //O ile pami�tam, to oni ch�tnie przyjmuj� nowicjuszy... Po co ci moja pomoc?

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //Potrzebna jest danina - owca i z�oto.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //Lares wspomina�, �e w celu przyst�pienia do klasztoru trzeba wnie�� jak�� danin�.
	};	
	
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //Bezpo�rednio pom�c ci nie mog� - jak zapewne wiesz, jestem Magiem Wody. Znam jednak do�� dobrze Maga Ognia imieniem Daron.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //Z regu�y zbiera datki w pobli�u targowiska.
	Vatras_SentToDaron = TRUE;
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //S�ysza�em ponadto, �e to nie jedyne jego zadanie w tamtej okolicy...
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //Powiedzia� mi kiedy� o pos��ku, kt�ry mu ukradziono.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //Sprawa jest dla niego bardzo wa�na i z pewno�ci� wesprze ci�, je�li odzyskasz dla niego ten pos��ek.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //Rzecz jasna fakt zostania Magiem Ognia nie oznacza, �e nie mo�esz do��czy� do Kr�gu.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //Warunek jest jednak jasny - musisz dowie�� swej warto�ci.
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Mag Ognia z targowiska, Daron, pomo�e mi wst�pi� do klasztoru, je�li odzyskam dla niego ma�y pos��ek, kt�ry mu skradziono."); 
};


// ************************************************************
// ***														***
//							Gothic II 
// ***														***
// ************************************************************

// ============================================================
// MORE 	(Wegen der alten Schei�e...)
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
	description	 = 	"Przybywam, by prosi� ci� o b�ogos�awie�stwo.";
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
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_00"); //Przybywam, by prosi� ci� o b�ogos�awie�stwo.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_01"); //Dlaczeg� mia�bym ci� pob�ogos�awi�, nieznajomy?
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_02"); //Chc� zosta� czeladnikiem u jednego z mistrz�w w dolnej cz�ci miasta.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //Id� wi�c z b�ogos�awie�stwem Adanosa, m�j synu!
	Snd_Play ("LevelUp");
	B_GivePlayerXP (XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry (TOPIC_Thorben,"Vatras, Mag Wody, udzieli� mi b�ogos�awie�stwa.");
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
	description	 = 	"Gdzie mog� znale�� jakiego� kap�ana Innosa?";		
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
	AI_Output (other, self, "DIA_Vatras_WoKdF_15_00"); //Gdzie mog� znale�� jakiego� kap�ana Innosa?
	AI_Output (self, other, "DIA_Vatras_WoKdF_05_01"); //Najlepiej rozejrzyj si� po targowisku. Znajdziesz tam wys�annika klasztoru.
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
	description	 = 	"Chcia�bym przekaza� datek na �wi�tyni� Adanosa!";
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
	AI_Output (other, self, "DIA_Vatras_Spende_15_00"); //Chcia�bym przekaza� datek na �wi�tyni� Adanosa!
	AI_Output (self, other, "DIA_Vatras_Spende_05_01"); //Datek na �wi�tyni� Adanosa mo�e zmaza� cz�� przewin, kt�re pope�ni�e� w przesz�o�ci, m�j synu.
	AI_Output (self, other, "DIA_Vatras_Spende_05_02"); //Jak� sum� zechcesz przekaza�?
	
	Info_ClearChoices   (DIA_Vatras_Spende);
	Info_AddChoice 		(DIA_Vatras_Spende, "Chwilowo nie mam pieni�dzy...", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Mam 50 sztuk z�ota...", DIA_Vatras_Spende_50);
	};
	if (Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Mam 100 sztuk z�ota...",	DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output (other, self, "DIA_Vatras_Spende_BACK_15_00"); //Chwilowo nie mam pieni�dzy...
	AI_Output (self, other, "DIA_Vatras_Spende_BACK_05_01"); //Nic si� nie sta�o. Adanos zawsze ucieszy si� z twojej ofiary.
	Info_ClearChoices   (DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output (other, self, "DIA_Vatras_Spende_50_15_00"); //Mam 50 sztuk z�ota...
	AI_Output (self, other, "DIA_Vatras_Spende_50_05_01"); //Dzi�kuj� ci w imieniu Adanosa, m�j synu. Twoje z�oto zostanie przekazane potrzebuj�cym.
	B_GiveInvItems (other, self, Itmi_Gold, 50);
	Info_ClearChoices   (DIA_Vatras_Spende);
};
	
func void DIA_Vatras_Spende_100()
{
	AI_Output (other, self, "DIA_Vatras_Spende_100_15_00"); //Mam 100 sztuk z�ota...
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_01"); //B�d� b�ogos�awiony, m�j synu! Dzi�ki ci za tw� hojno��.
	Snd_Play ("LevelUp");
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_02"); //Niech Adanos strze�e ci� zawsze od z�ej przygody.
	B_GiveInvItems (other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices   (DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Thorben,"Vatras, Mag Wody, udzieli� mi b�ogos�awie�stwa.");
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
	description	 = 	"Mo�esz nauczy� mnie czego� o magii?";
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
	AI_Output (other, self, "DIA_Vatras_CanTeach_15_00"); //Mo�esz nauczy� mnie czego� o magii?
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_01"); //Tylko Wybra�cy Innosa i Wybra�cy Adanosa mog� pos�ugiwa� si� magi� run.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_02"); //Ale magia dost�pna jest tak�e zwyk�ym �miertelnikom, pod postaci� magicznych zwoj�w.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_03"); //Mog� ci� nauczy�, jak lepiej wykorzystywa� dost�pn� ci magiczn� moc.
	
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Vatras, Mag Wody, mo�e pom�c mi w zwi�kszeniu magicznych zdolno�ci.");
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
	description	 = 	"Chc� zwi�kszy� moj� magiczn� moc.";
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
	AI_Output (other, self, "DIA_Vatras_Teach_15_00"); //Chc� zwi�kszy� moj� magiczn� moc.
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
};
func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output (self, other, "DIA_Vatras_Teach_05_00"); //Jeste� ju� zbyt pot�ny, bym m�g� ci� czego� nauczy�.
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
	nr          = 	98;	//Joly: bracuht ne hohe Nummer, denn wird in den sp�teren Kapiteln auch verwendet.
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
	AI_Output			(self, other, "DIA_Vatras_GODS_05_01"); //A co dok�adnie chcia�by� o nich wiedzie�?
	
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
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //Dobrze. Innos jest pierwszym i najpot�niejszym z bog�w. To on da� �wiatu S�o�ce.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //W jego w�adaniu znajduj� si� �wiat�o i ogie�, kt�re podarowa� ludzko�ci. Innos jest te� sprawiedliwo�ci� i prawem.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //Jego kap�anami s� Magowie Ognia, a wojownikami - m�ni paladyni.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR); 	
	
};
FUNC VOID DIA_Vatras_GODS_ADANOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //Opowiedz mi o Adanosie.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //Adanos jest bogiem harmonii. To boski stra�nik r�wnowagi pomi�dzy Innosem a Beliarem.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //Jest te� wielkim sprawc� zmian i panem w�d wszystkich m�rz, rzek i jezior.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //Jego oddanymi s�ugami s� moi bracia, Magowie Wody.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 	
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice	  (DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR); 	

};
FUNC VOID DIA_Vatras_GODS_BELIAR()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //Opowiedz mi o Beliarze.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //Beliar jest mrocznym bogiem �mierci, zniszczenia i wszystkich rzeczy nienaturalnych.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //Toczy on wieczn� wojn� z Innosem, ale Adanos dba, by ich si�y zawsze by�y wyr�wnane.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //Niewielu ludzi pozostaje w s�u�bie Beliara, ale s� oni niezwykle pot�ni.
	
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
	nr          = 	99;	//Joly: bracuht ne hohe Nummer, denn wird in den sp�teren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_HEAL_Condition;
	information	 = 	DIA_Vatras_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Mo�esz mnie uzdrowi�?";
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
	AI_Output			(other, self, "DIA_Vatras_HEAL_15_00"); //Mo�esz mnie uzdrowi�?
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_01"); //Adanosie, pob�ogos�aw to cia�o, uwolnij je od ran i tchnij w nie nowe �ycie!
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
	AI_Output (self, other, "DIA_Vatras_Add_05_10"); //Mam wiadomo�� dla Mistrza Isgarotha. Strze�e on kaplicy przed klasztorem.
	AI_Output (self, other, "DIA_Vatras_MISSION_05_01"); //Je�li podejmiesz si� wykona� to zadanie, b�dziesz m�g� sam sobie wybra� nagrod�.
	
	Info_ClearChoices   (DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Nie teraz!",DIA_Vatras_MISSION_NO);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Jasne.",DIA_Vatras_MISSION_YES);
};
FUNC VOID B_SayVatrasGo()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_13"); //Dobrze. Ruszaj teraz w drog� do Mistrza Isgarotha.
};
func VOID DIA_Vatras_MISSION_YES()
{
	AI_Output (other, self, "DIA_Vatras_MISSION_YES_15_00"); //Mo�esz na mnie liczy�.
	AI_Output (self, other, "DIA_Vatras_Add_05_11"); //�wietnie. Zabierz zatem t� wiadomo�� i wybierz jeden ze zwoj�w z zakl�ciami.
	AI_Output (self, other, "DIA_Vatras_Add_05_12"); //Gdy dostarczysz wiadomo��, otrzymasz odpowiedni� nagrod�.
	
	B_GiveInvItems (self, hero, ItWr_VatrasMessage,1); 
	MIS_Vatras_Message = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Botschaft,LOG_RUNNING);
	B_LogEntry (TOPIC_Botschaft,"Vatras da� mi wiadomo�� dla Mistrza Isgarotha, kt�rego znajd� w kaplicy przed klasztorem.");
	
	Info_ClearChoices 	(DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Wezm� zakl�cie �wiat�a.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Wybieram zakl�cie uzdrawiaj�ce.",DIA_Vatras_MISSION_HEAL);	
	Info_AddChoice 		(DIA_Vatras_MISSION,"Daj mi Lodow� Strza��.",DIA_Vatras_MISSION_ICE);	
};
FUNC VOID DIA_Vatras_MISSION_NO ()
{	
	//AI_Output	(other, self, "DIA_Vatras_MISSION_NO_15_00"); //Such dir einen anderen Laufburschen, alter Mann!
	AI_Output (other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //Nie teraz!
	AI_Output (self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //Nie ma sprawy - po�l� kogo� innego.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_HEAL()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //Wybieram zakl�cie uzdrawiaj�ce.
	 B_SayVatrasGo();
	 
	B_GiveInvItems (self, hero,ItSc_LightHeal ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_ICE()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //Daj mi Lodow� Strza��.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Icebolt ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_LIGHT()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //Wezm� zakl�cie �wiat�a.
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
	
	description	= "Dostarczy�em twoj� wiadomo��.";
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
	AI_Output (other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //Dostarczy�em twoj� wiadomo��.
	AI_Output (self, other, "DIA_Vatras_Add_05_14"); //Przyjmij wi�c moje podzi�kowanie. Mo�esz teraz wybra� swoj� nagrod�.
	
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	
	Info_ClearChoices (DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 szczaw kr�lewski",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"Pier�cie� zr�czno�ci",DIA_Vatras_MESSAGE_SUCCESS_Ring);	
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 bry�ka rudy",DIA_Vatras_MESSAGE_SUCCESS_Ore);
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
		
		AI_Output (self, other, "DIA_Vatras_Add_05_06"); //S�uchajcie, moi drodzy! Jestem potrzebny gdzie indziej.
		if (dauer == kurz)
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_07"); //To nie potrwa d�ugo. Po powrocie opowiem wam reszt� tej historii.
		}
		else //lang
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_08"); //Nie wiem, kiedy powr�c�. Je�li chcecie pozna� zako�czenie tej historii, przeczytajcie odpowiednie pisma.
			
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_09"); //Niech Adanos b�dzie z wami!
		
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
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //Mam pewien problem z Okiem Innosa - by� mo�e b�dzie mi potrzebna twoja pomoc.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //A b�d� musia� w tym celu opu�ci� miasto?
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //Nie wiem. By� mo�e.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //Od kilku dni czekam na zmiennika. Inni Magowie Wody powinni byli wr�ci� tu ju� jaki� czas temu.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //Postaraj si�, aby przys�ali mi zmiennika, a ja pomog� ci w rozwi�zaniu twojego problemu.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Vatras nie mo�e mi pom�c z Okiem Innosa, dop�ki inny Mag Wody nie zajmie jego miejsca w mie�cie."); 
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

	description	 = 	"Przyby� zmiennik.";
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
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //Przyby� zmiennik.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //Czy sprawy spoza g�r na p�nocnym wschodzie zosta�y rozwi�zane?
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //Tak. Kruk nie �yje i nie stanowi ju� zagro�enia.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //To doskona�e wie�ci. Mam nadziej�, �e podobne rzeczy ju� si� nie powt�rz�.

	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //Teraz mog� ci pom�c rozwi�za� problem.
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //O ile dobrze pami�tam, wi�za� si� on z Okiem Innosa?
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

	description	 = 	"Oko Innosa zosta�o uszkodzone.";
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
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //Przysy�a mnie Pyrokar.
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //Przysy�a mnie Xardas.
	};

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);

	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //Oko Innosa zosta�o uszkodzone.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //Wiem. Donie�li mi o tym napotkani nowicjusze.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //Poszukiwacze wykorzystali w tym celu �wi�ty S�oneczny Kr�g Mag�w Ognia.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //To znak, �e nieprzyjaciel znacznie ur�s� w si��.

	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Wie�ci szybko si� roznosz�.", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten );

	if (hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Dlaczego Pyrokar przys�a� mnie w�a�nie do ciebie - Maga Wody?", DIA_Vatras_INNOSEYEKAPUTT_warumdu );
	};
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Co si� teraz stanie z Okiem?", DIA_Vatras_INNOSEYEKAPUTT_Auge );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //Co si� teraz stanie z Okiem?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //Musimy spr�bowa� je naprawi�. Nie b�dzie to jednak �atwe zadanie.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //Oprawa p�k�a na dwie cz�ci. Zr�czny kowal zdo�a zapewne po��czy� je z powrotem.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //Ale to mniejsza cz�� problemu. Bardziej martwi mnie sam klejnot.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //Jest matowy, pozbawiony blasku. Nieprzyjaciel dok�adnie wiedzia�, jak unieszkodliwi� amulet.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Gdzie znajd� kowala, kt�ry zdo�a naprawi� opraw� amuletu?", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Czy mo�emy przywr�ci� klejnotowi dawn� moc?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //Czy mo�emy przywr�ci� klejnotowi dawn� moc?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //Jest tylko jeden na to spos�b - po��czone moce wszystkich trzech bog�w powinny tego dokona�.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //W miejscu zniszczenia amuletu nale�y przeprowadzi� odpowiedni rytua� odwracaj�cy. Mo�e wtedy klejnot odzyska sw�j ogie�.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //Problem w tym, �e musisz sprowadzi� do tego miejsca ziemskich przedstawicieli wszystkich trzech bog�w.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //Potrzebujemy te� znacznej ilo�ci bagiennego ziela. My�l�, �e nie mniej ni� 3 ro�liny.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Kim maj� by� ci trzej przedstawiciele bog�w?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Gdzie mog� znale�� to bagienne ziele?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //Gdzie mog� znale�� to bagienne ziele?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //Podobno w tych lasach mieszka stara wied�ma imieniem Sagitta. Mo�e u niej znajdziesz takie ziele.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //Ewentualnie rozejrzyj si� troch� na przystani.
	

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //Kim maj� by� ci trzej przedstawiciele bog�w?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //Adanosa mog� reprezentowa� osobi�cie.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //Przedstawicielem Innosa powinien by� Pyrokar, najwy�szy z Mag�w Ognia.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //Ale nie wiem, kto m�g�by reprezentowa� Beliara. Potrzebujemy prawdziwego mistrza czarnej magii.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Czarnej magii? Mo�e Xardas?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //Czarnej magii? Mo�e Xardas?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //Tak! To si� powinno uda�!
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //Nie wiem tylko, czy uda ci si� sprowadzi� obydwu.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //Ju� widz� wyraz twarzy Pyrokara, gdy dowie si�, �e musi wsp�pracowa� z Xardasem.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Musz� ju� i��.", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter );
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //Gdzie znajd� kowala, kt�ry zdo�a naprawi� opraw� amuletu?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //Musisz popyta� ludzi o kowala, kt�ry zna si� na jubilerstwie.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //Dlaczego Pyrokar przys�a� mnie w�a�nie do ciebie - Maga Wody?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //Podejrzewa�em, �e pr�dzej czy p�niej dojdzie do czego� takiego.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //Pyrokar ma si� za tak pot�nego i niezwyci�onego, �e cz�sto zachowuje si� wr�cz nieodpowiedzialnie.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //I zosta� za to ukarany - straci� Oko Innosa.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //My�l� jednak, �e pod�wiadomie polega na mocy powierzonej mi przez Adanosa.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //Lepiej nie my�le�, co by si� sta�o, gdyby mnie teraz zabrak�o.

};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //Wie�ci szybko si� rozchodz�.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //I bardzo dobrze. Nieprzyjaciel te� nie b�dzie czeka� bezczynnie.

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //Musz� ju� i��.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //Ja te� wyrusz� w drog�, by przygotowa� S�oneczny Kr�g do ceremonii.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //Przy�lij do mnie Xardasa i Pyrokara. I nie zapomnij o bagiennym zielu! Licz� na ciebie.
	
	B_LogEntry (TOPIC_INNOSEYE, "Vatras chce odprawi� rytua� w S�onecznym Kr�gu, aby uzdrowi� Oko. Musz� przekona� Xardasa i Pyrokara, aby wzi�li udzia� w tym przedsi�wzi�ciu. Powinienem tak�e znale�� kowala, kt�ry naprawi p�kni�t� opraw� amuletu.");

	MIS_RitualInnosEyeRepair = LOG_RUNNING;
	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine	(self,"RITUALINNOSEYEREPAIR");

	
	// ------ Zuh�rer weg -------
		B_Vatras_Geheweg (kurz);
	// --------------------------
	
	//Joly: Weg mit den Ritualdementoren!!!!!

	DMT_1201.aivar[AIV_EnemyOverride] = TRUE;	//Joly: Damit sie erstmal nicht die Welt entv�lkern, ohne Zutun des Spielers!!!!!
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
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //Tylko rytua� odwr�cenia odprawiony w S�onecznym Kr�gu przeze mnie, Xardasa i Pyrokara mo�e przywr�ci� Oku dawn� moc.
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //Pami�taj, �eby przynie�� Oko z naprawion� opraw�.
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

	description	 = 	"Zrobi�em wszystko, o co prosi�e�.";
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
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_00"); //Zrobi�em wszystko, o co prosi�e�. Oto naprawione Oko.
	B_GivePlayerXP (XP_RitualInnosEyeRuns);

	B_GiveInvItems 		(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem 	(self, ItMi_InnosEye_Broken_MIS);

	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_01"); //�wietnie. Mo�emy zatem przyst�pi� do odprawienia rytua�u.
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_02"); //A co z bagiennym zielem?
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_03"); //Ach, tak. Przynios�e� dla mnie trzy ro�liny?
	
	if (B_GiveInvItems (other, self, ItPL_SwampHerb,3))
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_04"); //Tak. Oto one.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_05"); //Znakomicie.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_06"); //Nie. Niestety, nie.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_07"); //Trudno. Poradzimy sobie jako� bez nich.
	};
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_08"); //Dobrze si� spisa�e�, ale teraz odsu� si� na bok, by�my mogli przyst�pi� do ceremonii. Niech zjednocz� si� nasze si�y!
 	
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
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //Ju� po wszystkim. Uda�o si� nam pokrzy�owa� plan nieprzyjaciela. Oko odzyska�o sw� moc!
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //Pyrokar wyja�ni ci, jak u�ywa� Oka.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //Mam nadziej�, �e spotkamy si� jeszcze, gdy wype�nisz ju� swoj� misj�. Bywaj!
 	
 	B_LogEntry (TOPIC_INNOSEYE, "Oko zosta�o uzdrowione. Kiedy Pyrokar mi je wr�czy, udam si� na polowanie na smoki.");
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

	description	 = 	"Dzi�ki ci za pomoc w naprawieniu Oka Innosa.";
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
	AI_Output			(other, self, "DIA_Vatras_PERMKAP3_15_00"); //Dzi�ki ci za pomoc w naprawieniu Oka Innosa.
	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_01"); //Zachowaj podzi�kowania na p�niej. Czeka ci� teraz najwi�ksze wyzwanie.

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_02"); //Porozmawiaj z Pyrokarem. On ci wszystko wyt�umaczy.
	};

	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_03"); //Mam nadziej�, �e jeszcze si� kiedy� spotkamy, m�j synu.

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

	description	 = 	"�ona Lobarta, Hilda, zachorowa�a.";
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
	AI_Output			(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //�ona Lobarta, Hilda, zachorowa�a.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //Co? Znowu? Ta biedna kobieta powinna bardziej na siebie uwa�a�.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //Jeszcze jedna ci�ka zima, a odejdzie z tego �wiata. Dobrze. Dam jej lekarstwo, kt�re zmniejszy gor�czk�.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //Hmmm... Skoro ju� tu jeste�, m�g�by� jej zanie�� lekarstwo?
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
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_01"); //Nie wygl�dasz najlepiej. Chyba zbyt d�ugo wystawia�e� si� na czarne spojrzenia Poszukiwaczy.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_02"); //Mog� uzdrowi� twoje cia�o, ale spok�j duszy odzyskasz jedynie w klasztorze. Porozmawiaj z Pyrokarem. On ci pomo�e.
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 	  				   Ich habe alle Drachen get�tet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_Vatras_AllDragonsDead(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 59;
	condition	= DIA_Vatras_AllDragonsDead_Condition;
	information	= DIA_Vatras_AllDragonsDead_Info;
	description = "Nie musimy ju� obawia� si� smok�w.";
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
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_00"); //Nie musimy ju� obawia� si� smok�w.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_01"); //Wiedzia�em, �e wr�cisz ca�y i zdrowy! Jednak najwi�ksze wyzwanie dopiero przed tob�.
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_02"); //Tak, wiem.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_03"); //Zatem wyposa� si� odpowiednio i przyjd� do mnie, gdyby� potrzebowa� pomocy. Zawsze miej przy sobie Oko Innosa! Niech Adanos b�dzie z tob�.
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
	description	 = 	"Wiem, gdzie czai si� nasz nieprzyjaciel.";
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
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //Wiem, gdzie czai si� nasz nieprzyjaciel.
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //Zatem nie tra�my czasu i pierwsi si� z nim rozprawmy.
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //Chcesz mi towarzyszy�?
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //D�ugo si� nad tym zastanawia�em, ale teraz nie mam w�tpliwo�ci. Chc� wyruszy� z tob�.
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                    	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                    	
	B_LogEntry (TOPIC_Crew,"Vatras, ku mojemu zaskoczeniu, chce mi towarzyszy� w mojej wyprawie. Tak do�wiadczony towarzysz by�by dla mnie prawdziwym skarbem.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Vatras_KnowWhereEnemy_15_04"); //Moja za�oga jest i tak bardzo liczna. Obawiam si�, �e mo�e dla ciebie zabrakn�� miejsca.
		AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //Zatem zwolnij dla mnie miejsce. B�d� ci potrzebny.
	}
	else 
	{
		Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Musz� to sobie jeszcze przemy�le�.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Jestem zaszczycony twoj� propozycj�.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //Jestem zaszczycony twoj� propozycj�. Spotkamy si� na przystani.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //Spiesz si�. Nieprzyjaciel nie zasypia gruszek w popiele.
	
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

	// ------ Zuh�rer weg -------
	B_Vatras_GeheWeg (lang);
	
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_No_15_00"); //Musz� to sobie jeszcze przemy�le�.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_No_05_01"); //Jak uwa�asz. Wr�� do mnie, gdy ju� podejmiesz decyzj�.

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
	description	 = 	"Lepiej b�dzie, je�li tu zostaniesz. To miasto ci� potrzebuje.";
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
	AI_Output			(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //Lepiej b�dzie, je�li tu zostaniesz. To miasto ci� potrzebuje.
	AI_Output			(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //Mo�e masz racj�... Mimo to, je�li zechcesz, wyrusz� z tob�! Pami�taj o tym.
	
	Vatras_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"PRAY"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_StillNeedYou_Condition;
	information	 = 	DIA_Vatras_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Chc� ci� zabra� na wysp� nieprzyjaciela.";
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
	AI_Output	(other, self, "DIA_Vatras_StillNeedYou_15_00"); //Chc� ci� zabra� na wysp� nieprzyjaciela.
	AI_Output	(self, other, "DIA_Vatras_StillNeedYou_05_01"); //M�dra decyzja. Mam nadziej�, �e ostateczna?
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);

	// ------ Zuh�rer weg -------
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


