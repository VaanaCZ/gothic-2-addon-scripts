// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_EXIT (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 999;
	condition	= DIA_Mil_305_Torwache_EXIT_Condition;
	information	= DIA_Mil_305_Torwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_305_Torwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_305_Checkpoint	= "NW_CITY_UPTOWN_PATH_02";	//WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
//	var int Mil_305_schonmalreingelassen; Hab ich mal in Globals geschrieben, weils im Close Log abgefragt wird Mattes
// -----------------------------------------------------------

instance DIA_Mil_305_Torwache_FirstWarn (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_FirstWarn_Condition;
	information	= DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_305_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (Mil_305_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_305_schonmalreingelassen == TRUE)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_00"); //HALT!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_01"); //You are wanted in the city for murder! Until that is cleared up, I can't let you into the upper end of town.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_02"); //As long as you are accused of theft, you can't enter the upper end of town!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_03"); //A troublemaker like you can't be let into the upper end of town.
		};
	
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_04"); //Go to Lord Andre and settle the matter!
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_05"); //Only the citizens of the town and the King's troops can get into the upper end of town!
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_SecondWarn (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 2;
	condition	= DIA_Mil_305_Torwache_SecondWarn_Condition;
	information	= DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_305_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_SecondWarn_03_00"); //I'm telling you for the last time. One step farther and you'll be in a world of hurt.

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_Attack (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_Attack_Condition;
	information	= DIA_Mil_305_Torwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_305_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_305_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_305_Torwache_Attack_03_00"); //You asked for it ...
	AI_StopProcessInfos	(self);	
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};

// ***************************************************************
//					Nachricht für Lord Hagen 
// ***************************************************************
instance DIA_Mil_305_Torwache_MESSAGE		(C_INFO)
{
	npc			 = 	Mil_305_Torwache;
	nr			 = 	1;
	condition	 = 	DIA_Mil_305_Torwache_MESSAGE_Condition;
	information	 = 	DIA_Mil_305_Torwache_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"I carry an important message for Lord Hagen.";
};
func int DIA_Mil_305_Torwache_MESSAGE_Condition ()
{	
	if (Player_KnowsLordHagen == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Mil_305_Torwache_MESSAGE_Info ()
{
	AI_Output (other, self, "DIA_Mil_305_Torwache_MESSAGE_15_00"); //I carry an important message for Lord Hagen.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_01"); //Half the city wants to speak to Lord Hagen on important matters.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_02"); //If we let in every petitioner, he wouldn't have anything to do but deal with the petty problems of the townspeople.
};	

// ***************************************************************
//							Ausnahme (PERM)
// ***************************************************************
instance DIA_Mil_305_Torwache_Ausnahme (C_INFO)
{
	npc			 = 	Mil_305_Torwache;
	nr			 = 	2;
	condition	 = 	DIA_Mil_305_Torwache_Ausnahme_Condition;
	information	 = 	DIA_Mil_305_Torwache_Ausnahme_Info;
	permanent    =  TRUE;
	description	 = 	"Couldn't we make an exception?";
};
func int DIA_Mil_305_Torwache_Ausnahme_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Mil_305_Torwache_Ausnahme_Info ()
{
	AI_Output (other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //Couldn't we make an exception?
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //(ranting) What?! There are rules in this town! Rules that apply to everyone without exception!
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //If we let you break those rules, it would be unfair towards all those who obey them.
};	

// ************************************************************
// 						Ich BIN Bürger!  				  
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_PassAsCitizen (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 2;
	condition	= DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information	= DIA_Mil_305_Torwache_PassAsCitizen_Info;
	permanent	= TRUE;
	description = "I'm a respected citizen of Khorinis! Let me pass!";
};                       
FUNC INT DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{	
	if (Mil_305_schonmalreingelassen == FALSE)
	&& (Kapitel <= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00"); //I'm a respected citizen of Khorinis! Let me pass!

	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01"); //Whatever prompted the masters of Khorinis to let you sign on as an apprentice - I don't want to know about it.
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //You may enter! But behave yourself! Otherwise you'll have the worst trouble in your life!
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Mil_305_schonmalreingelassen = TRUE;
		B_CheckLog();
		AI_StopProcessInfos (self);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS)
	||		(MIS_Thorben_GetBlessings == LOG_SUCCESS)
	||		(MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	|| 		(MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03"); //You may have gotten on the good side of some masters in the lower part of town, but if you were a citizen of this town, I'd know about it!
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04"); //Don't try to pull the wool over my eyes! I'm warning you!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05"); //You are the dirt under my fingernails! Make yourself scarce!
		AI_StopProcessInfos(self);
	};
};


// ************************************************************
// 						Pass as MILIZ
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_PassAsMil (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_PassAsMil_Condition;
	information	= DIA_Mil_305_Torwache_PassAsMil_Info;
	permanent 	= TRUE; 
	description	= "I belong to the militia - let me pass!";
};                       

FUNC INT DIA_Mil_305_Torwache_PassAsMil_Condition()
{	
	if (other.guild == GIL_MIL)
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PassAsMil_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMil_15_00"); //I belong to the militia - let me pass!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_01"); //So Andre accepted you? Then you can't be such a bad guy after all!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_02"); //You are now one of the protectors of the city! So be nice and friendly toward the citizens!
	
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Pass as MAGE
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_PassAsMage (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_PassAsMage_Condition;
	information	= DIA_Mil_305_Torwache_PassAsMage_Info;
	permanent 	= TRUE; 
	description	= "You dare stand in the way of a representative of Innos?";
};                       

FUNC INT DIA_Mil_305_Torwache_PassAsMage_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PassAsMage_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_00"); //You dare stand in the way of a representative of Innos?
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_01"); //Ehm ... no! Of course not! The entrance is open to the chosen of Innos!
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_02"); //Pray to Innos for this sacrilege!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_03"); //Yes, chosen one!
	
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 						Pass as SÖLDNER
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_PassAsSld (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_PassAsSld_Condition;
	information	= DIA_Mil_305_Torwache_PassAsSld_Info;
	permanent 	= TRUE; 
	description	= "I carry an important message for Lord Hagen!";
};                       

FUNC INT DIA_Mil_305_Torwache_PassAsSld_Condition()
{	
	if (other.guild == GIL_SLD)
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PassAsSld_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_00"); //I carry an important message for Lord Hagen!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_01"); //You're one of those mercenary rabble! Whatever could you want from Lord Hagen?
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_02"); //I bring an offer of peace.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_03"); //Ah! So you scoundrels have finally seen reason. Then go to Lord Hagen, but be nice and polite or he'll kick your fat, stupid ass!
	
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_PERM (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_PERM_Condition;
	information	= DIA_Mil_305_Torwache_PERM_Info;
	permanent	= TRUE;
	description	= "How's it going?";
};        
         
FUNC INT DIA_Mil_305_Torwache_PERM_Condition()
{	
	if (Mil_305_schonmalreingelassen == TRUE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PERM_15_00"); //How's it going?
	
	if (other.guild == GIL_PAL) 
	|| (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_01"); //All is well, comrade!
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_02"); //We are only doing our duty here. Thank you for taking notice of me, chosen one!
	}
	else if (other.guild == GIL_SLD)
	||		(other.guild == GIL_DJG)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_03"); //I may have to let you in, but I don't have to talk to you!
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_04"); //What do you want?
	};
	
	AI_StopProcessInfos	(self);
};

























