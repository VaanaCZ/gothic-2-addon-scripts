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
	AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_00"); //STÓJ!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_01"); //Sprzeniewierzy³bym siê swoim zasadom, gdybym wpuœci³ mordercê.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_02"); //Jesteœ oskar¿ony o kradzie¿. Dopóki nie oczyœcisz siê z zarzutów, nie wpuszczê ciê do œrodka.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_03"); //Twoje zami³owanie do awantur jest powszechnie znane. Nie wpuszczê ciê do œrodka.
		};
	
		AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_04"); //Udaj siê do Lorda Andre i wyjaœnij sprawê.
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_FirstWarn_12_05"); //Tylko osoby w s³u¿bie u Króla mog¹ wejœæ do ratusza.
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
	AI_Output (self, other,"DIA_PAL_205_Torwache_SecondWarn_12_00"); //Jeszcze jeden krok, a klnê siê na Innosa, ¿e oberwiesz.

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
	description = "Muszê porozmawiaæ z Lordem Hagenem!";
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
	AI_Output (other, self,"DIA_PAL_205_Torwache_Hagen_15_00"); //Muszê porozmawiaæ z Lordem Hagenem!
	AI_Output (self, other,"DIA_PAL_205_Torwache_Hagen_12_01"); //Czy wiesz, ile razy dziennie s³yszê te s³owa? Nie mo¿esz wejœæ. Jeœli spróbujesz, bêdê musia³ ciê zabiæ.
	 
	
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
	description	= "Nale¿ê do stra¿y miejskiej.";
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
	AI_Output (other, self,"DIA_PAL_205_Torwache_PassAsMil_15_00"); //Nale¿ê do stra¿y miejskiej.
	AI_Output (self, other,"DIA_PAL_205_Torwache_PassAsMil_12_01"); //W porz¹dku, mo¿esz wejœæ.
	
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
	description	= "Jestem Magiem Ognia.";
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
	AI_Output (other, self,"DIA_PAL_205_Torwache_PassAsMage_15_00"); //Jestem Magiem Ognia.
	AI_Output (self, other,"DIA_PAL_205_Torwache_PassAsMage_12_01"); //Tak, oczywiœcie. Wybacz mi, Wybrañcze, wykonujê tylko polecenia.
	
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
	description	= "Przepuœæ mnie, przynoszê wieœci od najemników.";
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
	AI_Output (other, self,"DIA_PAL_205_Torwache_PassAsSld_15_00"); //Przepuœæ mnie, przynoszê wieœci od najemników.
	AI_Output (self, other,"DIA_PAL_205_Torwache_PassAsSld_12_01"); //Dobrze, ale ostrzegam ciê. Jeœli bêdziesz sprawia³ k³opoty, nie zd¹¿ysz tego nawet po¿a³owaæ.
	
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
	description	= "Jak tam na s³u¿bie?";
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
	AI_Output (other, self,"DIA_PAL_205_Torwache_PERM_15_00"); //Jak tam na s³u¿bie?
	
	if (other.guild == GIL_PAL) 
	|| (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_01"); //Wszystko pod kontrol¹.
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_02"); //Jestem zadowolony ze swojej pracy, Wybrañcze.
	}
	else if (other.guild == GIL_SLD)
	||		(other.guild == GIL_DJG)
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_03"); //Zamknij siê i wchodŸ.
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_PAL_205_Torwache_PERM_12_04"); //Czego chcesz?
	};
	
	AI_StopProcessInfos	(self);
};

























