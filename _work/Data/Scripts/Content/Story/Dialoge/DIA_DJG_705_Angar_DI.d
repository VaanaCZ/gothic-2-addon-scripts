
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Angar_DI_EXIT   (C_INFO)
{
	npc         = DJG_705_Angar_DI;
	nr          = 999;
	condition   = DIA_Angar_DI_EXIT_Condition;
	information = DIA_Angar_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Angar_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Angar_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_HALLO		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	10;
	condition	 = 	DIA_Angar_DI_HALLO_Condition;
	information	 = 	DIA_Angar_DI_HALLO_Info;
	permanent	 = 	TRUE;

	description 	 =  "Jak się masz?";
};

func int DIA_Angar_DI_HALLO_Condition ()
{
	if ((Npc_IsDead(UndeadDragon)) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_HALLO_15_00"); //Jak się czujesz?

	if ((Npc_IsDead(UndeadDragon)) == FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_01"); //Odkąd wylądowaliśmy na tej wyspie, moje bóle głowy stały się nie do zniesienia.
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_02"); //Cholera. To się musi wreszcie skończyć.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_03"); //O mnie się nie martw. Wynośmy się stąd!
	};

};

///////////////////////////////////////////////////////////////////////
//	Info ORKS
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_ORKS		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_ORKS_Condition;
	information	 = 	DIA_Angar_DI_ORKS_Info;
	important	 = 	TRUE;

};

func int DIA_Angar_DI_ORKS_Condition ()
{
	if (ORkSturmDI == TRUE) 
	&& ((Npc_IsDead(UndeadDragon)) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_ORKS_Info ()
{
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_00"); //Pospiesz się, do diaska! Następnego ataku orków możemy nie przeżyć.
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_15_01"); //Robię, co mogę.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_02"); //To trochę za mało!

	Info_ClearChoices	(DIA_Angar_DI_ORKS);
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Spokojnie.", DIA_Angar_DI_ORKS_no );
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Pomóż mi...", DIA_Angar_DI_ORKS_follow );
};
func void DIA_Angar_DI_ORKS_follow ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_follow_15_00"); //Zamiast narzekać, mógłbyś mi pomóc.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_follow_04_01"); //Tak zrobię. No dalej, ruszaj przodem!
	AI_StopProcessInfos (self); 
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FollowDI");
	Angar_DI_Party = LOG_RUNNING;
};

func void DIA_Angar_DI_ORKS_no ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_no_15_00"); //Uspokój się trochę.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_no_04_01"); //Łatwo ci powiedzieć, ale ja tu odchodzę od zmysłów.
	AI_StopProcessInfos (self); 
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOW
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOW		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_FOLLOW_Condition;
	information	 = 	DIA_Angar_DI_FOLLOW_Info;
	permanent	 = 	TRUE;

	description  =  "Chcę, żebyś tu został.";

};

func int DIA_Angar_DI_FOLLOW_Condition ()
{
	if (Angar_DI_Party == LOG_RUNNING) 
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_FOLLOW_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_00"); //Chcę, żebyś tu został.

	if (Npc_GetDistToWP(self,"SKELETTE")<4000) 
		{
			AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_01"); //Dalej poradzę sobie sam.
			AI_Output			(self ,other, "DIA_Angar_DI_FOLLOW_04_02"); //Powodzenia.
			
			AI_StopProcessInfos (self); 
			Npc_ExchangeRoutine	(self,"Start");
			Angar_DI_Party = LOG_SUCCESS; //Joly: (Schluss mit Follow)
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{	
			AI_Output			(self, other, "DIA_Angar_DI_FOLLOW_04_03"); //Jasne.

			AI_StopProcessInfos (self); 
						
			if (Npc_GetDistToWP(self,"SHIP")<10000) 
			{
				Npc_ExchangeRoutine	(self,"Start");
			}
			else
			{			
				if	(Npc_IsDead(FireDragonIsland))
				{
					Npc_ExchangeRoutine	(self,"FireDragonIsland");
				}			
				else if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
				{
					Npc_ExchangeRoutine	(self,"ORKOBERST_DI");
				}
				else if (Npc_IsDead(Troll_DI))
				{
					Npc_ExchangeRoutine	(self,"Troll_DI");
				}
				else
				{
					Npc_ExchangeRoutine	(self,"Start");
				};
			};
		};
		
	Angar_DI_Party = LOG_OBSOLETE;
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOWAGAIN
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOWAGAIN		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_FOLLOWAGAIN_Condition;
	information	 = 	DIA_Angar_DI_FOLLOWAGAIN_Info;
	permanent	 = 	TRUE;

	description  =  "Chodźmy!";

};

func int DIA_Angar_DI_FOLLOWAGAIN_Condition ()
{
	if (Angar_DI_Party == LOG_OBSOLETE) 
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_FOLLOWAGAIN_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOWAGAIN_15_00"); //Chodźmy!
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWAGAIN_04_01"); //Ty przodem.
	Angar_DI_Party = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowDI");
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOW
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOWSTOP		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_FOLLOWSTOP_Condition;
	information	 = 	DIA_Angar_DI_FOLLOWSTOP_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Angar_DI_FOLLOWSTOP_Condition ()
{
	if (Angar_DI_Party == LOG_RUNNING) 
	&& 	(
		((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON")<3000) && (Npc_IsDead(FireDragonIsland)== FALSE))
		|| ((Npc_GetDistToWP(self,"SKELETTE")<3000))
		)
			{
					return TRUE;
			};
};

func void DIA_Angar_DI_FOLLOWSTOP_Info ()
{
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWSTOP_04_00"); //Aaargh! Moja głowa! Zaraz oszaleję!
};

///////////////////////////////////////////////////////////////////////
//	Info UNDEADDRGDEAD
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_UNDEADDRGDEAD		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	2;
	condition	 = 	DIA_Angar_DI_UNDEADDRGDEAD_Condition;
	information	 = 	DIA_Angar_DI_UNDEADDRGDEAD_Info;
	
	description	 = 	"(z uśmiechem) Udało ci się przeżyć.";

};

func int DIA_Angar_DI_UNDEADDRGDEAD_Condition ()
{
	if (Npc_IsDead(UndeadDragon))
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_UNDEADDRGDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_00"); //Udało ci się przeżyć.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_01"); //Możemy się stąd wreszcie wynieść?
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_02"); //Czemu nie... Wróg został pokonany.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_03"); //No to nie traćmy czasu. Idź do kapitana i każ mu podnosić kotwicę.

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_04"); //Mam tylko nadzieję, że nie natkniemy się już na twoich dawnych kompanów.
		AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_05"); //Wszystko jest możliwe. Prześladowcy byli niezwykle skuteczni. Mało brakowało, a ja też uległbym ich mocy. Kto wie?
	};

	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_06"); //Co zamierzasz teraz robić?
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_07"); //Może osiądę gdzieś na wsi i zostanę rolnikiem? Dość już mam wojaczki.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Angar_DI_PICKPOCKET (C_INFO)
{
	npc			= DJG_705_Angar_DI;
	nr			= 900;
	condition	= DIA_Angar_DI_PICKPOCKET_Condition;
	information	= DIA_Angar_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Angar_DI_PICKPOCKET_Condition()
{
	C_Beklauen (47, 45);
};
 
FUNC VOID DIA_Angar_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Angar_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Angar_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Angar_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Angar_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Angar_DI_PICKPOCKET_DoIt);
};

func void DIA_Angar_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Angar_DI_PICKPOCKET);
};
	
func void DIA_Angar_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Angar_DI_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOUNDAMULETT		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	7;
	condition	 = 	DIA_Angar_DI_FOUNDAMULETT_Condition;
	information	 = 	DIA_Angar_DI_FOUNDAMULETT_Info;

	description	 = 	"Znalazłem twój amulet.";
};

func int DIA_Angar_DI_FOUNDAMULETT_Condition ()
{
	if 	(Npc_HasItems (other,ItAm_Mana_Angar_MIS))
		&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();
};

