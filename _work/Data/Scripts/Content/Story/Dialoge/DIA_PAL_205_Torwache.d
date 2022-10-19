// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_PAL_205_Torwache_EXIT (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 999;
	condition	= DIA_PAL_205_Torwache_EXIT_Condition;
	information	= DIA_PAL_205_Torwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_PAL_205_Torwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_PAL_205_Torwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string PAL_205_Checkpoint	= "NW_CITY_CITYHALL_IN";	//WP im Rathaus
// -----------------------------------------------------------
	var int PAL_205_schonmalreingelassen;
// -----------------------------------------------------------

instance DIA_PAL_205_Torwache_FirstWarn (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 1;
	condition	= DIA_PAL_205_Torwache_FirstWarn_Condition;
	information	= DIA_PAL_205_Torwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_PAL_205_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, PAL_205_Checkpoint) <= 550) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (PAL_205_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (PAL_205_schonmalreingelassen == TRUE)
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

func void DIA_PAL_205_Torwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_00"); //HALTE !

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_01"); //Je faillirais à ma mission sacrée si je laissais entrer un meurtrier !
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_02"); //Vous êtes accusé de vol. Tant que ce sera vrai, vous n'entrerez pas !
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_03"); //Je refuse de vous laisser passer car vous êtes d'un tempérament bagarreur.
		};
	
		AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_04"); //Allez voir le seigneur André et réglez cette affaire !
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_05"); //Seuls ceux qui sont au service du roi peuvent entrer à l'hôtel de ville.
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
	
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_PAL_205_Torwache_SecondWarn (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 2;
	condition	= DIA_PAL_205_Torwache_SecondWarn_Condition;
	information	= DIA_PAL_205_Torwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_PAL_205_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,PAL_205_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_PAL_205_Torwache_SecondWarn_12_00"); //Si vous faites un pas de plus, je devrai vous assommer, par Innos !

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_PAL_205_Torwache_Attack (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 3;
	condition	= DIA_PAL_205_Torwache_Attack_Condition;
	information	= DIA_PAL_205_Torwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_PAL_205_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,PAL_205_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_StopProcessInfos	(self);		
	
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 					Ich muss mit Lord Hagen sprechen			  
// ************************************************************
INSTANCE DIA_PAL_205_Torwache_Hagen (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 2;
	condition	= DIA_PAL_205_Torwache_Hagen_Condition;
	information	= DIA_PAL_205_Torwache_Hagen_Info;
	permanent	= TRUE;
	description = "Je dois parler au seigneur Hagen !";
};                       
FUNC INT DIA_PAL_205_Torwache_Hagen_Condition()
{	
	if (PAL_205_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_PAL_205_Torwache_Hagen_Info()
{
	AI_Output (other, self,"DIA_PAL_205_Torwache_Hagen_15_00"); //Il faut que je parle au seigneur Hagen !
	AI_Output (self, other,"DIA_PAL_205_Torwache_Hagen_12_01"); //Savez-vous combien de fois par jour j'entends cette phrase ? Vous n'avez pas le droit d'entrer. Si vous essayez tout de même, je serai obligé de vous tuer.
	 
	
	AI_StopProcessInfos(self);
};
// ************************************************************
// 						Pass as MILIZ
// ************************************************************

INSTANCE DIA_PAL_205_Torwache_PassAsMil (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 3;
	condition	= DIA_PAL_205_Torwache_PassAsMil_Condition;
	information	= DIA_PAL_205_Torwache_PassAsMil_Info;
	permanent 	= TRUE; 
	description	= "Je suis membre de la milice.";
};                       

FUNC INT DIA_PAL_205_Torwache_PassAsMil_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_MIL)
	&& (PAL_205_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_205_Torwache_PassAsMil_Info()
{
	AI_Output (other, self,"DIA_PAL_205_Torwache_PassAsMil_15_00"); //Je fais partie de la milice.
	AI_Output (self, other,"DIA_PAL_205_Torwache_PassAsMil_12_01"); //Très bien, vous pouvez entrer.
	
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Pass as MAGE
// ************************************************************

INSTANCE DIA_PAL_205_Torwache_PassAsMage (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 3;
	condition	= DIA_PAL_205_Torwache_PassAsMage_Condition;
	information	= DIA_PAL_205_Torwache_PassAsMage_Info;
	permanent 	= TRUE; 
	description	= "Je suis un Magicien du feu.";
};                       

FUNC INT DIA_PAL_205_Torwache_PassAsMage_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_KDF)
	&& (PAL_205_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_205_Torwache_PassAsMage_Info()
{
	AI_Output (other, self,"DIA_PAL_205_Torwache_PassAsMage_15_00"); //Je suis un Magicien du feu.
	AI_Output (self, other,"DIA_PAL_205_Torwache_PassAsMage_12_01"); //Bien sûr. Pardonnez-moi, ô Elu, mais je ne fais que mon devoir.
	
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 						Pass as SÖLDNER
// ************************************************************

INSTANCE DIA_PAL_205_Torwache_PassAsSld (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 3;
	condition	= DIA_PAL_205_Torwache_PassAsSld_Condition;
	information	= DIA_PAL_205_Torwache_PassAsSld_Info;
	permanent 	= TRUE; 
	description	= "Laissez-moi passer, j'apporte un message des mercenaires.";
};                       

FUNC INT DIA_PAL_205_Torwache_PassAsSld_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_SLD)
	&& (PAL_205_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_205_Torwache_PassAsSld_Info()
{
	AI_Output (other, self,"DIA_PAL_205_Torwache_PassAsSld_15_00"); //Laissez-moi passer. Je suis porteur d'un message des mercenaires.
	AI_Output (self, other,"DIA_PAL_205_Torwache_PassAsSld_12_01"); //Très bien, mais je vous préviens : si vous causez des ennuis en ce lieu, vous n'aurez pas le temps de le regretter.
	
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
INSTANCE DIA_PAL_205_Torwache_PERM (C_INFO)
{
	npc			= PAL_205_Torwache;
	nr			= 2;
	condition	= DIA_PAL_205_Torwache_PERM_Condition;
	information	= DIA_PAL_205_Torwache_PERM_Info;
	permanent	= TRUE;
	description	= "Comment ça se passe ?";
};        
         
FUNC INT DIA_PAL_205_Torwache_PERM_Condition()
{	
	if (PAL_205_schonmalreingelassen == TRUE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_205_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_PAL_205_Torwache_PERM_15_00"); //Comment ça se passe ?
	
	if (other.guild == GIL_PAL) 
	|| (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_01"); //La situation est sous contrôle.
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_02"); //Ma mission me comble, ô Elu.
	}
	else if (other.guild == GIL_SLD)
	||		(other.guild == GIL_DJG)
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_03"); //Taisez-vous et entrez.
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_04"); //Que voulez-vous ?
	};
	
	AI_StopProcessInfos	(self);
};

























