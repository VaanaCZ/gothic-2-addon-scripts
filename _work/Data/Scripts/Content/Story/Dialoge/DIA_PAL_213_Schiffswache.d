///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pal_213_Schiffswache_EXIT   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 999;
	condition   = DIA_Pal_213_Schiffswache_EXIT_Condition;
	information = DIA_Pal_213_Schiffswache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pal_213_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pal_213_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// ------------------------------------------------------------
	const string Pal_213_Checkpoint		= "SHIP_DECK_09";					//Auf dem Schiff
// ------------------------------------------------------------

instance DIA_Pal_213_Schiffswache_FirstWarn (C_INFO)
{
	npc			= Pal_213_Schiffswache;
	nr			= 1;
	condition	= DIA_Pal_213_Schiffswache_FirstWarn_Condition;
	information	= DIA_Pal_213_Schiffswache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Pal_213_Schiffswache_FirstWarn_Condition()
{
	if ((MIS_ShipIsFree == FALSE) 
	&&	(self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00"); //Zaczekaj chwilkę! A gdzie to się wybierasz?
	AI_Output (other, self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01"); //Chciałem tylko...

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02"); //Wybacz, nie możesz przejść.
	}
	else
	{	
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03"); //Nie ma tu nic do oglądania. Odejdź.
	};

	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]		= GP_FirstWarnGiven;
};


// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Pal_213_Schiffswache_SecondWarn (C_INFO)
{
	npc			= Pal_213_Schiffswache;
	nr			= 2;
	condition	= DIA_Pal_213_Schiffswache_SecondWarn_Condition;
	information	= DIA_Pal_213_Schiffswache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Pal_213_Schiffswache_SecondWarn_Condition()
{
	if ((MIS_ShipIsFree == FALSE) 
	&&	(self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven						)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Pal_213_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_SecondWarn_Info()
{
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00"); //Ani kroku dalej. Nie robimy żadnych wyjątków.
	}
	else
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01"); //Nie chcesz chyba, bym MUSIAŁ zrobić ci krzywdę?
	};
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Pal_213_Schiffswache_Attack (C_INFO)
{
	npc			= Pal_213_Schiffswache;
	nr			= 3;
	condition	= DIA_Pal_213_Schiffswache_Attack_Condition;
	information	= DIA_Pal_213_Schiffswache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Pal_213_Schiffswache_Attack_Condition()
{
	if ((MIS_ShipIsFree == FALSE) 
	&&	(self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Pal_213_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_StopProcessInfos	(self);												//dem Spieler sofort wieder die Kontrolle zurückgeben
	
	B_Attack (self, other, AR_GuardStopsIntruder, 1);
};


//#############################
//###						###
//###		Kapitel 5		###
//###						###
//#############################


///////////////////////////////////////////////////////////////////////
//	Abziehen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pal_213_Schiffswache_GoOnBoard   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 5;
	condition   = DIA_Pal_213_Schiffswache_GoOnBoard_Condition;
	information = DIA_Pal_213_Schiffswache_GoOnBoard_Info;
	permanent   = FALSE;
	description = "Muszę dostać się na statek.";
};

FUNC INT DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00"); //Muszę dostać się na statek.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01"); //Nikt nie ma tam wstępu! Takie dostałem rozkazy!
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02"); //Zabiję każdego, kto wejdzie na pokład bez zezwolenia.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03"); //W imię Innosa, będę chronił statku do ostatniej kropli krwi.
};

//**********************************************************
//sc ist kdf -Du stellst den Wunsch eines eines Magiers des Feuers in Frage?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF_Info;
	permanent   = FALSE;
	description = "Śmiesz przeciwstawiać się woli Maga Ognia?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF_15_00"); //Śmiesz przeciwstawiać się woli Maga Ognia?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01"); //Nie. Skądże. Niech Innos mi wybaczy.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02"); //Magowie Ognia to strażnicy mądrości Innosa...
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03"); //...Ktokolwiek im się sprzeciwia, sprzeciwia się woli samego Innosa, odrzucając jego łaskę.
};

//**********************************************************
//Was passiert, wenn ich an Bord gehe?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF2   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF2_Info;
	permanent   = FALSE;
	description = "Co będzie, jeśli wejdę na pokład?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF2_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF2_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00"); //Co będzie, jeśli wejdę na pokład?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01"); //Zabiję... to znaczy, będę cię musiał powstrzymać.
};

//**********************************************************
//Du würdest einen Magier des Feuers angreifen?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF3   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF3_Info;
	permanent   = FALSE;
	description = "Zaatakowałbyś Maga Ognia?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF3_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF3_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00"); //Zaatakowałbyś Maga Ognia?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01"); //Nie śmiałbym podnieść ręki na maga.
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02"); //Więc co byś zrobił, gdybym wszedł na pokład?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03"); //Nic, Panie.
};

//**********************************************************
//Ich werde jetzt an Bord gehen.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF4   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF4_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF4_Info;
	permanent   = FALSE;
	description = "W takim razie, wchodzę.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF4_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF3))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF4_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00"); //W takim razie, wchodzę.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01"); //Nie rób tego, proszę. Rozkazy lorda Hagena były jasne.
};

//**********************************************************
//Schließen Lord Hagen Befehle auch mich mit ein?.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF5   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF5_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF5_Info;
	permanent   = FALSE;
	description = "Czy rozkazy Lorda Hagena obejmują także mnie?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF5_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF4))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF5_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00"); //Czy rozkazy Lorda Hagena obejmują także mnie?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01"); //Nie wiem.
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02"); //Pomyśl tylko, czy Lord Hagen mógłby podejrzewać maga o kradzież?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03"); //Nie sądzę.
};

//**********************************************************
//Zum letzten mal: Lass mich auf das Schiff
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmKDF6   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmKDF6_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF6_Info;
	permanent   = FALSE;
	description = "Proszę po raz ostatni: pozwól mi wejść na pokład!";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmKDF6_Condition()
{
	if (Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmKDF5))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmKDF6_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00"); //Proszę po raz ostatni: pozwól mi wejść na pokład!
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01"); //Zrozumiałem. Możesz wejść.

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine	(Girion,"WaitForShip");
};

//**********************************************************
//sc ist PA -Misstraust du mir, Ritter?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmPAL   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmPAL_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL_Info;
	permanent   = FALSE;
	description = "Czyżbyś mi nie ufał, rycerzu?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmPAL_Condition()
{
	if (Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmPAL_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL_15_00"); //Czyżbyś mi nie ufał, rycerzu?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01"); //Nie o to chodzi, po prostu wykonuję swoje rozkazy.
};

//**********************************************************
//sc ist PA -Dann solltest du wissen, wer hier den Vorgesetzter ist.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmPAL2   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmPAL2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL2_Info;
	permanent   = FALSE;
	description = "Powinieneś więc wiedzieć, który z nas ma wyższy stopień.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmPAL2_Condition()
{
	if (Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmPAL))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmPAL2_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00"); //Powinieneś więc wiedzieć, który z nas ma wyższy stopień.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01"); //Tak jest!
};

//**********************************************************
//sc ist PA -Dann solltest du wissen, wer hier den Vorgesetzter ist.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmPAL3   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmPAL3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL3_Info;
	permanent   = FALSE;
	description = "Niniejszym rozkazuję ci wpuścić mnie na okręt.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmPAL3_Condition()
{
	if (Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmPAL2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmPAL3_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00"); //Niniejszym rozkazuję ci wpuścić mnie na pokład.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01"); //Tak jest, możesz wejść, Panie.
	
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine	(Girion,"WaitForShip");
};

//**********************************************************
//sc ist DJG -Kann man da nichts machen?
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmDJG   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmDJG_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG_Info;
	permanent   = FALSE;
	description = "Nie można by czegoś zrobić w tej sprawie?";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmDJG_Condition()
{
	if (Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmDJG_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG_15_00"); //Nie można by czegoś zrobić w tej sprawie?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01"); //Nie do końca rozumiem?
};

//**********************************************************
//sc ist DJG -Ich könnte dir Geld geben.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmDJG2   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmDJG2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG2_Info;
	permanent   = FALSE;
	description = "Mógłbym ci dać trochę złota...";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmDJG2_Condition()
{
	if (Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmDJG))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmDJG2_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00"); //Mógłbym ci dać trochę złota, a ty przez moment popatrzyłbyś sobie w inną stronę.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01"); //Nie pozwolę się przekupić. Jeśli natychmiast nie odejdziesz, potraktuję to jako obrazę.
};

//**********************************************************
//sc ist DJG -Ich habe einen Brief von Lord Hagen.
//**********************************************************

INSTANCE DIA_Pal_213_Schiffswache_IAmDJG3   (C_INFO)
{
	npc         = Pal_213_Schiffswache;
	nr          = 6;
	condition   = DIA_Pal_213_Schiffswache_IAmDJG3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG3_Info;
	permanent   = FALSE;
	description = "Posiadam pisemne zezwolenie.";
};

FUNC INT DIA_Pal_213_Schiffswache_IAmDJG3_Condition()
{
	if (Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Pal_213_Schiffswache_IAmDJG))
	&& (Npc_HasItems (other,ITWr_ForgedShipLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pal_213_Schiffswache_IAmDJG3_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00"); //Posiadam pisemne zezwolenie. Wolno mi wejść na pokład statku.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01"); //Niech no spojrzę.
	
	B_GiveInvItems (other,self,ItWr_ForgedShipLetter_Mis,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02"); //W porządku, możesz przejść.
	
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine	(Girion,"WaitForShip");
};





