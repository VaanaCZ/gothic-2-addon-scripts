// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_333_Stadtwache_EXIT (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 999;
	condition	= DIA_Mil_333_Stadtwache_EXIT_Condition;
	information	= DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_333_Stadtwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_333_Checkpoint	= "NW_CITY_MERCHANT_PATH_29";	//Eingang City Hintereingang!
// -----------------------------------------------------------
	var int MIL_333_Personal_AbsolutionLevel;
	//var int Mil_333_schonmalreingelassen; --> GLOBALS
// -----------------------------------------------------------

instance DIA_Mil_333_Stadtwache_FirstWarn (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 1;
	condition	= DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information	= DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_333_Checkpoint) <= 1000) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};

	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel) //und noch nicht bezahlt
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_333_schonmalreingelassen == TRUE)
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

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00"); //HALTE !
		
	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01"); //(soupirs) Qu'y a-t-il ?
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02"); //Vous ne le savez que trop bien !
	
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03"); //Vous être recherché pour meurtre en ville !
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04"); //Nous n'aimons pas les sales voleurs, par ici !
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05"); //Les fauteurs de troubles ne sont pas les bienvenus en ville !
		};
	
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06"); //Pourquoi croyez-vous que nous devrions vous laisser entrer ?
	}
	else // ------ normales Reinkommen ------
	{
		 var C_Item itm; itm = Npc_GetEquippedArmor(other);
		
		// ------ ohne Rüstung ODER als Bauer ------
		if (Npc_HasEquippedArmor(other) == FALSE)
		|| (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE)
		|| (Hlp_IsItem(itm, ItAr_Bau_M) == TRUE)
		{
			AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07"); //Oui ?
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08"); //Vous avez l'air d'un mendiant et nous n'avons que faire des miséreux, ici !
			
			if (Npc_HasItems(other, ItWr_Passierschein))
			{
				AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09"); //Mais j'ai un laissez-passer !
				AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10"); //Il n'est valable qu'à l'autre porte.
			};
			
			if (Npc_KnowsInfo (other, DIA_Mil_310_Stadtwache_MilizWerden))
			{
				AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11"); //Mais j'ai l'intention d'intégrer la garde de la ville !
				AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12"); //Ha ! Ne me faites pas rire ! Allez à l'autre porte, pour voir si on croit vos inepties, là-bas...
				AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13"); //J'y suis déjà allé et on m'a dit de venir vous trouver.
				AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14"); //(rire sadique) Ha ! Ils nous envoient toujours la crème de la crème...
			};
		}
 	 	// ------ alle anderen Rüstungen ------
		else 
		{
			AI_Output (other, self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15"); //(calmement) Quoi ?
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16"); //Je voulais juste vous regarder. Bah, vous semblez avoir un peu d'argent. Très bien, entrez.
			
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_310.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
			Mil_333_schonmalreingelassen = TRUE;
			
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_SecondWarn (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 2;
	condition	= DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information	= DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_333_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00"); //Vous avez un problème d'audition ? Un pas de plus et vous goûterez au fil de mon épée...

	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_Attack (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 3;
	condition	= DIA_Mil_333_Stadtwache_Attack_Condition;
	information	= DIA_Mil_333_Stadtwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_333_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_Attack_06_00"); //Vous l'aurez voulu...
	
	AI_StopProcessInfos	(self);			
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};


// ************************************************************
// 							Bestechung!
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_Bribe (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_333_Stadtwache_Bribe_Condition;
	information	= DIA_Mil_333_Stadtwache_Bribe_Info;
	permanent	= TRUE;
	description	= "Tenez, voici 100 pièces d'or. Laissez-moi passer !";
};                       

FUNC INT DIA_Mil_333_Stadtwache_Bribe_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};
	
func void DIA_Mil_333_Stadtwache_Bribe_Info()
{
	AI_Output (other, self,"DIA_Mil_333_Stadtwache_Bribe_15_00"); //Voici 100 pièces d'or. Laissez-moi passer !
	
	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_Bribe_06_01"); //(cupide) 100 pièces d'or ? Ça me paraît honnête. Très bien, entrez.
		
		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_333_Stadtwache_Bribe_06_02"); //Et allez directement voir André, ou je vous ferai payer 100 pièces d'or de plus, la prochaine fois !
		};
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_310.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
		Mil_333_schonmalreingelassen = TRUE;
		B_CheckLog();
		
		// ------ wenn bezahlt, persönliche Absolution erteilen -------
		MIL_333_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else //nicht genug Gold
	{
		AI_Output (self, other,"DIA_Mil_333_Stadtwache_Bribe_06_03"); //Quoi ? Où ? Je ne vois aucune pièce d'or ! Tirez-vous !
	};
	
	AI_StopProcessInfos (self);
};


// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_Mil_333_Stadtwache_PERM (C_INFO)
{
	npc			= Mil_333_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_333_Stadtwache_PERM_Condition;
	information	= DIA_Mil_333_Stadtwache_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Mil_333_Stadtwache_PERM_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
	
func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output (self, other,"DIA_Mil_333_Stadtwache_PERM_06_00"); //Ne restez pas là !
	
	AI_StopProcessInfos (self);
};




