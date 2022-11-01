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
	AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00"); //Aspetta un momento! Cosa credi di fare?
	AI_Output (other, self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01"); //Volevo solamente...

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02"); //Spiacente, non puoi passare.
	}
	else
	{	
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03"); //Non c'è niente da vedere. Vai via.
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
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00"); //Nessuno può passare. Nessuna eccezione.
	}
	else
	{
		AI_Output (self, other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01"); //Non vorrai COSTRINGERMI a farti del male, non è vero?
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
	description = "Voglio salire sulla nave.";
};

FUNC INT DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00"); //Voglio salire sulla nave.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01"); //Nessuno potrà salire sulla nave! Ho i miei ordini!
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02"); //Ucciderò chiunque salga sulla nave senza permesso.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03"); //Nel nome di Innos, difenderò la nave con la mia vita.
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
	description = "Metti in discussione la volontà di un mago del fuoco?";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF_15_00"); //Metti in discussione la volontà di un mago del fuoco?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01"); //(nervoso) No, certo che no. Possa Innos perdonarmi.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02"); //(nervoso) I Maghi del Fuoco sono i guardiani della saggezza di Innos...
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03"); //(nervoso) ...chiunque dubiti di loro, dubita di Innos stesso e rinuncia a qualsiasi diritto alla pietà.
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
	description = "Cosa succede, se vado a bordo?";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00"); //Cosa succede, se vado a bordo?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01"); //(nervoso) Ti uccider... voglio dire, ti fermerei.
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
	description = "Attaccheresti un mago del fuoco?";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00"); //Attaccheresti un mago del fuoco?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01"); //(nervoso) Non muoverei un dito contro un mago.
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02"); //Allora cosa faresti se salissi a bordo?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03"); //(timidamente) Niente, signore.
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
	description = "Vado a bordo.";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00"); //Vado a bordo.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01"); //(nervoso) Non può farlo, gli ordini di Lord Hagen sono molto chiari.
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
	description = "Gli ordini di Lord Hagen valgono anche per me?";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00"); //Gli ordini di Lord Hagen valgono anche per me?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01"); //(nervoso) Non saprei.
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02"); //Pensaci bene, Lord Hagen sospetterebbe mai un mago di furto?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03"); //Non credo.
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
	description = "Per l’ultima volta: lasciami andare a bordo della nave!";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00"); //Per l’ultima volta: lasciami andare a bordo della nave!
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01"); //(nervoso) Ho capito. Può salire a bordo.

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
	description = "Non ti fidi di me, cavaliere?";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL_15_00"); //Non ti fidi di me, cavaliere?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01"); //No, sto solo eseguendo gli ordini.
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
	description = "Allora dovresti sapere chi di noi due ha il grado più alto.";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00"); //Allora dovresti sapere chi di noi ha il grado più alto.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01"); //Sissignore!
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
	description = "Ti ordino di lasciarmi salire su questa nave.";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00"); //Pertanto ti ordino di lasciarmi salire sulla nave.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01"); //Ho capito, signore, le garantirò l'accesso.
	
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
	description = "Non si può fare nulla?";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG_15_00"); //Non si può fare nulla?
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01"); //Credo di non capire.
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
	description = "Potrei darti dei soldi.";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00"); //Potrei darti dei soldi per guardare dall'altra parte.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01"); //Non puoi corrompermi e se non sparisci all'istante lo considererò un insulto.
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
	description = "Ho un’autorizzazione scritta.";
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
	AI_Output (other,self ,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00"); //Ho un'autorizzazione scritta. Ho il permesso di salire a bordo.
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01"); //Fammi vedere.
	
	B_GiveInvItems (other,self,ItWr_ForgedShipLetter_Mis,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02"); //D'accordo, puoi passare.
	
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine	(Girion,"WaitForShip");
};





