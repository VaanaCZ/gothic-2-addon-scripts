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
	AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_00"); //ST�J!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_01"); //Jeste� poszukiwany za morderstwo. Dop�ki ta sprawa si� nie wyja�ni, nie mog� ci� wpu�ci� do g�rnego miasta.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_02"); //Dop�ki jeste� oskar�ony o kradzie�, nie mo�esz wej�� do g�rnego miasta.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_03"); //Takich �otrzyk�w jak ty nie wpuszczamy do g�rnego miasta.
		};
	
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_04"); //Udaj si� do Lorda Andre i z nim ustal ca�� spraw�.
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_05"); //Do g�rnego miasta wpuszczamy jedynie obywateli Khorinis oraz oddzia�y kr�lewskie.
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
	AI_Output (self, other,"DIA_Mil_305_Torwache_SecondWarn_03_00"); //M�wi� ci po raz ostatni. Jeszcze jeden krok i po�a�ujesz, �e si� urodzi�e�.

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
	
	AI_Output (self, other,"DIA_Mil_305_Torwache_Attack_03_00"); //Sam si� o to prosi�e�...
	AI_StopProcessInfos	(self);	
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};

// ***************************************************************
//					Nachricht f�r Lord Hagen 
// ***************************************************************
instance DIA_Mil_305_Torwache_MESSAGE		(C_INFO)
{
	npc			 = 	Mil_305_Torwache;
	nr			 = 	1;
	condition	 = 	DIA_Mil_305_Torwache_MESSAGE_Condition;
	information	 = 	DIA_Mil_305_Torwache_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Przynosz� wa�ne informacje dla Lorda Hagena.";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_MESSAGE_15_00"); //Przynosz� wa�ne informacje dla Lorda Hagena.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_01"); //Po�owa miasta ma dla Lorda Hagena 'wa�ne' informacje.
	AI_Output (self, other, "DIA_Mil_305_Torwache_MESSAGE_03_02"); //Gdyby�my wpuszczali ka�dego interesanta, Lord Hagen nie robi�by nic, tylko zajmowa� si� przyziemnymi problemami posp�lstwa.
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
	description	 = 	"Mo�e m�g�by� zrobi� wyj�tek?";
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
	AI_Output (other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //Mo�e m�g�by� zrobi� wyj�tek?
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //Co?! W tym mie�cie panuj� pewne zasady! Zasady, kt�re obejmuj� wszystkich bez wyj�tku!
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //Je�li pozwolimy ci je z�ama�, b�dziemy niesprawiedliwi w stosunku do ca�ej reszty.
};	

// ************************************************************
// 						Ich BIN B�rger!  				  
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_PassAsCitizen (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 2;
	condition	= DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information	= DIA_Mil_305_Torwache_PassAsCitizen_Info;
	permanent	= TRUE;
	description = "Jestem szanowanym obywatelem Khorinis! Pozw�l mi przej��.";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00"); //Jestem szanowanym obywatelem Khorinis! Pozw�l mi przej��.

	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01"); //Cokolwiek sk�oni�o mistrz�w z Khorinis do przyj�cia ci� jako ucznia - nie chc� nawet o tym s�ysze�.
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //Mo�esz wej��! Ale uwa�aj, jeden wybryk i b�dziesz mia� powa�ne problemy.
		
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
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03"); //Mo�e w jaki� spos�b uda�o ci si� wkupi� w �aski niekt�rych mistrz�w z dolnej cz�ci miasta, ale gdyby� by� obywatelem Khorinis, wiedzia�bym o tym!
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04"); //Ostrzegam ci�, nie pr�buj bawi� si� ze mn� w kotka i myszk�!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05"); //Jeste� wart tyle, co brud pod paznokciem! Znikaj st�d!
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
	description	= "Nale�� do stra�y - pozw�l mi przej��!";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMil_15_00"); //Nale�� do stra�y - pozw�l mi przej��!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_01"); //Andre ci� przyj��? To mo�e faktycznie jeste� w porz�dku!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_02"); //Jeste� teraz jednym z obro�c�w miasta. Pami�taj wi�c, aby by� uprzejmym wobec jego mieszka�c�w.
	
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
	description	= "�miesz stawa� na drodze wybra�cowi Innosa?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_00"); //�miesz stawa� na drodze wybra�cowi Innosa?
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_01"); //Ehm... Nie! Oczywi�cie, �e nie! Przed wybra�cami Innosa bramy zawsze stoj� otworem.
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_02"); //Blu�nierco, m�dl si� o �ask� Innosa!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_03"); //Tak, Wybra�cze!
	
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 						Pass as S�LDNER
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_PassAsSld (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_PassAsSld_Condition;
	information	= DIA_Mil_305_Torwache_PassAsSld_Info;
	permanent 	= TRUE; 
	description	= "Przynosz� wa�ne informacje dla Lorda Hagena.";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_00"); //Przynosz� wa�ne informacje dla Lorda Hagena.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_01"); //Jeste� najemnikiem! Czeg� takie �cierwo mo�e chcie� od Lorda Hagena?
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsSld_15_02"); //Przybywam z ofert� pokoju.
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsSld_03_03"); //Ach! Wi�c w ko�cu poszli�cie po rozum do g�owy, dranie. Id� wi�c do Lorda Hagena, ale uwa�aj na j�zyk i zachowanie, albo skopi� ci to twoje t�uste dupsko!
	
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
	description	= "Co s�ycha�?";
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
	AI_Output (other, self,"DIA_Mil_305_Torwache_PERM_15_00"); //Co s�ycha�?
	
	if (other.guild == GIL_PAL) 
	|| (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_01"); //Wszystko w porz�dku, Bracie!
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_02"); //Wykonujemy tylko nasze obowi�zki. Mi�o, �e zechcia�e� mnie dostrzec, Wybra�cze.
	}
	else if (other.guild == GIL_SLD)
	||		(other.guild == GIL_DJG)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_03"); //To, �e powinienem ci� wpu�ci�, nie znaczy, �e musz� z tob� gada�!
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_04"); //Czego chcesz?
	};
	
	AI_StopProcessInfos	(self);
};

























