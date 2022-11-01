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
	AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_00"); //STÓJ!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_01"); //Jesteś poszukiwany za morderstwo. Dopóki ta sprawa się nie wyjaśni, nie mogę cię wpuścić do górnego miasta.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_02"); //Dopóki jesteś oskarżony o kradzież, nie możesz wejść do górnego miasta.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_03"); //Takich łotrzyków jak ty nie wpuszczamy do górnego miasta.
		};
	
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_04"); //Udaj się do Lorda Andre i z nim ustal całą sprawę.
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_05"); //Do górnego miasta wpuszczamy jedynie obywateli Khorinis oraz oddziały królewskie.
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
	AI_Output (self, other,"DIA_Mil_305_Torwache_SecondWarn_03_00"); //Mówię ci po raz ostatni. Jeszcze jeden krok i pożałujesz, że się urodziłeś.

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
	
	AI_Output (self, other,"DIA_Mil_305_Torwache_Attack_03_00"); //Sam się o to prosiłeś...
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
	description	 = 	"Przynoszę ważne informacje dla Lorda Hagena.";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_MESSAGE_15_00"); //Przynoszę ważne informacje dla Lorda Hagena.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_01"); //Połowa miasta ma dla Lorda Hagena 'ważne' informacje.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_02"); //Gdybyśmy wpuszczali każdego interesanta, Lord Hagen nie robiłby nic, tylko zajmował się przyziemnymi problemami pospólstwa.
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
	description	 = 	"Może mógłbyś zrobić wyjątek?";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //Może mógłbyś zrobić wyjątek?
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //Co?! W tym mieście panują pewne zasady! Zasady, które obejmują wszystkich bez wyjątku!
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //Jeśli pozwolimy ci je złamać, będziemy niesprawiedliwi w stosunku do całej reszty.
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
	description = "Jestem szanowanym obywatelem Khorinis! Pozwól mi przejść.";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00"); //Jestem szanowanym obywatelem Khorinis! Pozwól mi przejść.

	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01"); //Cokolwiek skłoniło mistrzów z Khorinis do przyjęcia cię jako ucznia - nie chcę nawet o tym słyszeć.
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //Możesz wejść! Ale uważaj, jeden wybryk i będziesz miał poważne problemy.
		
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
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03"); //Może w jakiś sposób udało ci się wkupić w łaski niektórych mistrzów z dolnej części miasta, ale gdybyś był obywatelem Khorinis, wiedziałbym o tym!
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04"); //Ostrzegam cię, nie próbuj bawić się ze mną w kotka i myszkę!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05"); //Jesteś wart tyle, co brud pod paznokciem! Znikaj stąd!
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
	description	= "Należę do straży - pozwól mi przejść!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMil_15_00"); //Należę do straży - pozwól mi przejść!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_01"); //Andre cię przyjął? To może faktycznie jesteś w porządku!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_02"); //Jesteś teraz jednym z obrońców miasta. Pamiętaj więc, aby być uprzejmym wobec jego mieszkańców.
	
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
	description	= "Śmiesz stawać na drodze wybrańcowi Innosa?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_00"); //Śmiesz stawać na drodze wybrańcowi Innosa?
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_01"); //Ehm... Nie! Oczywiście, że nie! Przed wybrańcami Innosa bramy zawsze stoją otworem.
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_02"); //Bluźnierco, módl się o łaskę Innosa!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_03"); //Tak, Wybrańcze!
	
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
	description	= "Przynoszę ważne informacje dla Lorda Hagena.";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_00"); //Przynoszę ważne informacje dla Lorda Hagena.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_01"); //Jesteś najemnikiem! Czegóż takie ścierwo może chcieć od Lorda Hagena?
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_02"); //Przybywam z ofertą pokoju.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_03"); //Ach! Więc w końcu poszliście po rozum do głowy, dranie. Idź więc do Lorda Hagena, ale uważaj na język i zachowanie, albo skopię ci to twoje tłuste dupsko!
	
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
	description	= "Co słychać?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PERM_15_00"); //Co słychać?
	
	if (other.guild == GIL_PAL) 
	|| (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_01"); //Wszystko w porządku, Bracie!
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_02"); //Wykonujemy tylko nasze obowiązki. Miło, że zechciałeś mnie dostrzec, Wybrańcze.
	}
	else if (other.guild == GIL_SLD)
	||		(other.guild == GIL_DJG)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_03"); //To, że powinienem cię wpuścić, nie znaczy, że muszę z tobą gadać!
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_04"); //Czego chcesz?
	};
	
	AI_StopProcessInfos	(self);
};

























