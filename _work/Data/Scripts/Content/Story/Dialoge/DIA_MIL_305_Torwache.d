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
	AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_00"); //ALT!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_01"); //Sei ricercato in città per omicidio! Fino a che tutto non sarà stato chiarito, non posso farti entrare nella parte alta della città.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_02"); //Fino a che sarai accusato di furto, non puoi entrare nella parte alta della città!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_03"); //Un sobillatore come te non può entrare nella parte alta della città.
		};
	
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_04"); //Vai da Lord Andre e sistema la faccenda!
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_05"); //Solo i cittadini di qui e le guardie del re possono accedere alla parte alta della città!
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
	AI_Output (self, other,"DIA_Mil_305_Torwache_SecondWarn_03_00"); //Te lo ripeto per l'ultima volta. Fai un altro passo e sarò costretto a farti del male.

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
	
	AI_Output (self, other,"DIA_Mil_305_Torwache_Attack_03_00"); //L'hai voluto tu...
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
	description	 = 	"Ho un messaggio importante da parte di Lord Hagen.";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_MESSAGE_15_00"); //Ho un messaggio importante per Lord Hagen.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_01"); //Mezza città desidera parlare di affari urgenti con Lord Hagen.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_02"); //Se lasciassimo entrare tutti, finirebbe per occuparsi solo degli insignificanti problemi della popolazione.
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
	description	 = 	"Non possiamo fare un’eccezione?";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //Non possiamo fare un’eccezione?
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //(urla) Cosa? Ci sono delle regole in questa città! Regole che si applicano a tutti, senza eccezione!
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //Se ti lasciassimo infrangere queste regole, non sarebbe corretto verso tutti coloro che le rispettano.
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
	description = "Sono un rispettabile cittadino di Khorinis! Fammi passare!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00"); //Sono un rispettabile cittadino di Khorinis! Fammi passare!

	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01"); //Non voglio sapere cos'abbia spinto i signori di Khorinis a permetterti di prestare servizio come apprendista.
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //Puoi entrare, ma fai attenzione a come ti muovi, altrimenti ti ritroverai in grossi guai!
		
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
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03"); //Potrai anche esserti fatto amico qualche signore nella parte bassa della città, ma se tu fossi un cittadino di qui lo avrei sputo!
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04"); //Non cercare di gettarmi fumo negli occhi! Ti avverto!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05"); //Sei un essere infimo e spregevole! Sparisci!
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
	description	= "Faccio parte della guardia cittadina... fammi passare!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMil_15_00"); //Faccio parte della guardia cittadina... fammi passare!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_01"); //E così Andre ti ha accettato? Forse dopotutto non sei un ragazo così male!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_02"); //Ora sei uno dei protettori della città, dunque sii carino e gentile verso i cittadini!
	
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
	description	= "Come osi ostacolare il passaggio di un rappresentante di Khorinis?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_00"); //Come osi ostacolare il passaggio di un rappresentante di Khorinis?
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_01"); //Ehm... no! Certo che no! L'ingresso è aperto al prescelto di Innos!
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_02"); //Prega Innos per questo sacrilegio!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_03"); //Sì, prescelto!
	
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
	description	= "Ho un messaggio importante da parte di Lord Hagen!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_00"); //Ho un messaggio importante per Lord Hagen.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_01"); //Tu sei una di quelle canaglie dei mercenari! Cosa potresti volere da Lord Hagen?
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_02"); //Porto una proposta di pace.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_03"); //Ah! Dunque voi furfanti avete finalmente deciso di ragionare. Allora vai da Lord Hagen, ma comportati bene ed educatamente, o ti prenderò a calci nel sedere!
	
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
	description	= "Come va?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PERM_15_00"); //Come va?
	
	if (other.guild == GIL_PAL) 
	|| (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_01"); //Va tutto bene compagno!
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_02"); //Stiamo solo assolvendo al nostro dovere qui. Grazie per avermi prestato attenzione, prescelto!
	}
	else if (other.guild == GIL_SLD)
	||		(other.guild == GIL_DJG)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_03"); //Posso lasciarti entrare, ma non sono autorizzato a parlarti!
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_04"); //Che vuoi?
	};
	
	AI_StopProcessInfos	(self);
};

























