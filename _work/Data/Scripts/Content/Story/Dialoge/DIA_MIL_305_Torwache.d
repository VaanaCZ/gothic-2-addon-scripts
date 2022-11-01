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
	AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_00"); //¡ALTO!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_01"); //¡Te buscan en la ciudad por asesinato! Hasta que se aclare el asunto, no puedo dejarte entrar en la parte alta de la ciudad.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_02"); //¡Mientras estés acusado de robo, no puedes entrar en la parte alta de la ciudad!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_03"); //Un alborotador como tú no puede entrar en la parte alta de la ciudad.
		};
	
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_04"); //¡Ve a ver a lord Andre y arregla el asunto!
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_05"); //¡En la parte alta de la ciudad solo pueden entrar los ciudadanos y las tropas del rey!
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
	AI_Output (self, other,"DIA_Mil_305_Torwache_SecondWarn_03_00"); //Te lo advierto por última vez. Si das un paso más, te vas a ganar una paliza.

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
	
	AI_Output (self, other,"DIA_Mil_305_Torwache_Attack_03_00"); //Tú lo has querido...
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
	description	 = 	"Tengo un mensaje importante para lord Hagen.";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_MESSAGE_15_00"); //Tengo un mensaje importante para lord Hagen.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_01"); //Media ciudad quiere hablar con lord Hagen de asuntos importantes.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_02"); //Si dejáramos entrar a todos los suplicantes, no haría más que encargarse de los problemillas de los ciudadanos.
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
	description	 = 	"¿No podríamos hacer una excepción?";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //¿No podríamos hacer una excepción?
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //(Echando pestes) ¡¿Qué?! ¡En esta ciudad hay normas! ¡Normas que se aplican a todos sin excepciones!
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //Si permitimos que infrinjas estas normas, sería injusto para todos aquellos que las obedecen.
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
	description = "¡Soy un ciudadano respetable de Khorinis! ¡Déjame pasar!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00"); //¡Soy un ciudadano respetable de Khorinis! ¡Déjame pasar!

	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01"); //No sé lo que ha llevado a los maestros de Khorinis a tomarte como aprendiz, pero no quiero saberlo.
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //¡Entra, pero compórtate! ¡Si no, vas a meterte en un lío tremendo!
		
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
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03"); //¡Tal vez estés a buenas con algunos maestros de la parte baja de la ciudad, pero si fueras ciudadano, lo sabría!
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04"); //¡No intentes engañarme! ¡Te lo advierto!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05"); //¡Eres como la roña que se me queda en las uñas! ¡Esfúmate!
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
	description	= "¡Pertenezco a la milicia! ¡Déjame pasar!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMil_15_00"); //¡Pertenezco a la milicia! ¡Déjame pasar!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_01"); //¿Andre te ha aceptado? ¡Entonces no serás tan mal tipo!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_02"); //¡Ahora eres uno de los protectores de la ciudad! ¡Sé simpático y amable con los ciudadanos!
	
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
	description	= "¿Te atreves a obstaculizar a un representante de Innos?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_00"); //¿Te atreves a obstaculizar a un representante de Innos?
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_01"); //Eh... ¡no! ¡Claro que no! ¡Los elegidos de Innos tienen la entrada franca!
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_02"); //¡Reza a Innos por este sacrilegio!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_03"); //¡Sí, elegido!
	
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
	description	= "¡Tengo un mensaje importante para lord Hagen!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_00"); //¡Tengo un mensaje importante para lord Hagen!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_01"); //¡Eres uno de esos canallas mercenarios! ¿Qué puedes querer de lord Hagen?
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_02"); //Traigo una propuesta de paz.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_03"); //¡Ah! Por fin los granujas habéis entrado en razón. En ese caso ve a ver a lord Hagen, pero sé amable o te dará una buena tunda.
	
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
	description	= "¿Qué tal va todo?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PERM_15_00"); //¿Cómo va todo?
	
	if (other.guild == GIL_PAL) 
	|| (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_01"); //¡Estupendamente, camarada!
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_02"); //Solo cumplimos con nuestra obligación. ¡Gracias por acordarte de mí, elegido!
	}
	else if (other.guild == GIL_SLD)
	||		(other.guild == GIL_DJG)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_03"); //¡Tal vez tenga que dejarte entrar, pero no estoy obligado a hablar contigo!
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_04"); //¿Qué es lo que quieres?
	};
	
	AI_StopProcessInfos	(self);
};

























