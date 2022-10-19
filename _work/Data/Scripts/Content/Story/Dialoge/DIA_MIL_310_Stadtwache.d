// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_310_Stadtwache_EXIT (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 999;
	condition	= DIA_Mil_310_Stadtwache_EXIT_Condition;
	information	= DIA_Mil_310_Stadtwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_310_Stadtwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_310_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_310_Checkpoint	= "NW_CITY_ENTRANCE_MAIN";	//WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
	var int MIL_310_Personal_AbsolutionLevel;
	//var int Mil_310_schonmalreingelassen; --> GLOBALS
// -----------------------------------------------------------

instance DIA_Mil_310_Stadtwache_FirstWarn (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 1;
	condition	= DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information	= DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_310_Stadtwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_310_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel) //und noch nicht bezahlt
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_310_schonmalreingelassen == TRUE)
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

func void DIA_Mil_310_Stadtwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00"); //ST�T!
		
	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01"); //(vzdychne si) Co je?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02"); //V� dob�e co!
	
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03"); //Ve m�st� jsi hled�n pro vra�du!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04"); //Nechceme tady ��dn� �pinav� zlod�je!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05"); //V na�em m�st� nepot�ebujeme ��dn� pot�isty!
		};
	
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06"); //Pro� mysl�, �e bychom t� m�li nechat j�t d�l?
	}
	else // ------ normales Reinkommen ------
	{
		 var C_Item itm; itm = Npc_GetEquippedArmor(other);
		
		// ------ ohne R�stung ------
		if (Npc_HasEquippedArmor(other) == FALSE)
		&& (hero.guild == GIL_NONE) 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07"); //Co je?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08"); //TEBE dovnit� nepust�me, chlap�e!
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09"); //Pro� ne?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10"); //Takov� hadrn�k jako ty ur�it� bude d�lat jenom pot�e!
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11"); //Ve m�st� m�me ch�try dost. Lidi bez pen�z tady nepot�ebujeme.
			
			Log_CreateTopic (TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
			B_LogEntry (TOPIC_City,"Aby m� str�e pustily do m�sta, mus�m vypadat bu� jako boh��, nebo mus�m vykoumat n�jak� jin� zp�sob.");
		}
 	 	 
 		// ------ als Bauer ------		
		else if (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE)
		|| 		(Hlp_IsItem(itm, ItAr_Bau_M) == TRUE)
		{
			if (self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12"); //Co chce� tentokr�t?
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13"); //Pos�l� m� farm��.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14"); //No a? M� tentokr�t alespo� jeden dobr� d�vod, pro� jsi tady?
			}
			else //zum ersten Mal da
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15"); //Jsi jeden z pracovn�k� na Lobartov� farm�? Nikdy jsem t� tady nevid�l!
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16"); //Nejsem u Lobarta dlouho.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17"); //Co chce� ve m�st�?
			};
		}
		
		// ------ alle anderen R�stungen ------
		else 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18"); //(ti�e) Co�e?
			if (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19"); //Odpus� mi, ale takov� m�me rozkazy.
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20"); //Sna�� se m� zastavit?
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21"); //Samoz�ejm� ne. V�ichni �lenov� Innosovy c�rkve jsou v�t�ni.
				
			}
			else
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22"); //Jen jsem se na tebe cht�l pod�vat. Zd� se, �e m� pen�ze. M��e� j�t.
			};
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
			Mil_310_schonmalreingelassen = TRUE;
			B_CheckLog();
			
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_SecondWarn (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 2;
	condition	= DIA_Mil_310_Stadtwache_SecondWarn_Condition;
	information	= DIA_Mil_310_Stadtwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_310_Stadtwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_310_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00"); //O nic se nepokou�ej. Je�t� jeden krok a rozsek�m t� na kousky!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Attack (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 3;
	condition	= DIA_Mil_310_Stadtwache_Attack_Condition;
	information	= DIA_Mil_310_Stadtwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_310_Stadtwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_310_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Attack_07_00"); //�ekl sis o to.
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};


// ************************************************************
// 							Bestechung!
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Bribe (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_310_Stadtwache_Bribe_Condition;
	information	= DIA_Mil_310_Stadtwache_Bribe_Info;
	permanent	= TRUE;
	description	= "Tady je 100 zlat�ch. Nech m� proj�t!";
};                       

FUNC INT DIA_Mil_310_Stadtwache_Bribe_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};
	
func void DIA_Mil_310_Stadtwache_Bribe_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Bribe_15_00"); //Tady je 100 zlat�ch. Nech m� proj�t!
	
	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_01"); //(hami�n�) 100 zlat�ch zn� dob�e. Tak b�.
		
		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_02"); //A jdi rovnou za lordem Andrem! Jinak t� to bude p��t� st�t dal��ch 100 zlat�ch!
		};
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
		Mil_310_schonmalreingelassen = TRUE;
		B_CheckLog();
		
		// ------ wenn bezahlt, pers�nliche Absolution erteilen -------
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else //nicht genug Gold
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_03"); //Co?! Kde?! Nevid�m ��dn�ch 100 zlat�ch. Zmiz!
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 						Passierschein
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Passierschein (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 4;
	condition	= DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information	= DIA_Mil_310_Stadtwache_Passierschein_Info;
	permanent 	= FALSE;
	description	= "M�m propustku!";
};

FUNC INT DIA_Mil_310_Stadtwache_Passierschein_Condition()
{	
	if (Npc_HasItems (other,ItWr_Passierschein))
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	&& (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_Passierschein_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_00"); //M�m propustku!
	
	if (Npc_HasEquippedArmor(other) == FALSE) //ohne R�stung
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_01"); //V�n�? A koho jsi kv�li n� zamordoval, ty vrahoune?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_02"); //Tak nech�te m� proj�t, nebo ne?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_03"); //No, b� d�l, ne� si to rozmysl�m!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_04"); //Zd� se, �e to je v po��dku. Tak b�.
	};

	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Will zum Schmied
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_ZumSchmied (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 3;
	condition	= DIA_Mil_310_Stadtwache_ZumSchmied_Condition;
	information	= DIA_Mil_310_Stadtwache_ZumSchmied_Info;
	permanent 	= FALSE;
	description	= "Pot�ebuji j�t za kov��em. Opravit n�jak� n�stroje.";
};

FUNC INT DIA_Mil_310_Stadtwache_ZumSchmied_Condition()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if ( (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE) || (Hlp_IsItem(itm, ItAr_Bau_M) == TRUE) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_ToTheCity))
	&& (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_ZumSchmied_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00"); //Pot�ebuji za kov��em. Nechat opravit n�jak� n�stroje.
	
	if (Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01"); //(rozzloben�) Fakt? A pro� jsi to ne�ekl rovnou?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02"); //Jen m� zaj�malo, jak zareaguje�.
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03"); //Co�e?! Zkus na m� n�co takov�ho je�t� jednou a uk�u ti, jak na takov� v�ci reaguju, ty hloupej vtip�lku!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04"); //Dobr�, v po��dku, m��e� j�t.
	};
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05"); //A jestli uvid� Lobarta, vy�i� mu, �e by m�l sv� ovce po��dn� krmit, brzy se u n�j zase zastav�me! (zle se zasm�je)

	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	B_GivePlayerXP (XP_Ambient);
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				Planzen f�r Constantino
// ************************************************************

INSTANCE DIA_Addon_Mil_310_Stadtwache_Constantino (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 2;
	condition	= DIA_Addon_Mil_310_Stadtwache_Constantino_Condition;
	information	= DIA_Addon_Mil_310_Stadtwache_Constantino_Info;
	permanent 	= TRUE;
	description	= "Nesu n�jak� bylinky pro alchymistu Constantina.";
};

FUNC INT DIA_Addon_Mil_310_Stadtwache_Constantino_Condition()
{	
	if (MIS_Addon_Lester_PickForConstantino == LOG_RUNNING)
	&& (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Mil_310_Stadtwache_Constantino_Info()
{
	AI_Output (other, self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00"); //Nesu n�jak� byliny alchymistovi Constantinovi.

	if ((Npc_HasItems (other, ItPl_Mana_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Mana_Herb_02) > 0)
		|| (Npc_HasItems (other, ItPl_Mana_Herb_03) > 0)
		|| (Npc_HasItems (other, ItPl_Health_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Health_Herb_02) > 0)
		|| (Npc_HasItems (other, ItPl_Health_Herb_03) > 0)
		|| (Npc_HasItems (other, ItPl_Dex_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Strength_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Speed_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Temp_Herb) > 0)
		|| (Npc_HasItems (other, ItPl_Perm_Herb) > 0)
		|| (Npc_HasItems (other, ItPl_Beet) > 0))
	{
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01"); //(potuteln�) V�n�? Pak mi ur�it� r�d uk�e�, co mu nese�.
		
		if 	((Npc_HasItems (other, ItPl_Mana_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Mana_Herb_02) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Mana_Herb_03) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Health_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Health_Herb_02) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Health_Herb_03) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Dex_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Strength_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Speed_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Temp_Herb) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Perm_Herb) >= MinimumPassagePlants))
		{
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02"); //(souhlasn�) Hmm, to vypad� dob�e. No tak jdi d�l, ale ��dn� skopi�iny, rozum�?

			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
			Mil_310_schonmalreingelassen = TRUE;
			MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
			B_CheckLog();
			B_GivePlayerXP (XP_Addon_PickForConstantino);
			AI_StopProcessInfos (self);
		}
		else 
		{
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03"); //Co�e? Co to m� jako bejt?

			if (Npc_HasItems (other, ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04"); //Co by alchymista d�lal s tu��nama? To si d�l� srandu, ne? Vypadni.
			}
			else 
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05"); //O alchymii toho moc nev�m, ale na� by n�komu byla zm�� takov�ho plevele? P��t� to zkus l�p.
			};	
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06"); //Jak� byliny? Dyk u sebe ��dn� nem�! T�hni!
	};

	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Miliz werden
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_MilizWerden (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 2;
	condition	= DIA_Mil_310_Stadtwache_MilizWerden_Condition;
	information	= DIA_Mil_310_Stadtwache_MilizWerden_Info;
	permanent 	= FALSE;
	description	= "P�i�el jsem, abych vstoupil do domobrany!";
};

FUNC INT DIA_Mil_310_Stadtwache_MilizWerden_Condition()
{	
	if (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_MilizWerden_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00"); //P�i�el jsem, abych vstoupil do domobrany!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01"); //Dobrej vtip! Zkus to u druh� br�ny - ONI ti to mo�n� spolknou.
	
	Mil_310_Scheisse_erzaehlt = TRUE;
};

// ************************************************************
// 				Wichtige Nachricht f�r Paladine
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Paladine (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 1;
	condition	= DIA_Mil_310_Stadtwache_Paladine_Condition;
	information	= DIA_Mil_310_Stadtwache_Paladine_Info;
	permanent 	= FALSE;
	description	= "Mus�m vid�t v�dce paladin�!";
};

FUNC INT DIA_Mil_310_Stadtwache_Paladine_Condition()
{	
	if (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_Paladine_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_15_00"); //Pot�ebuji mluvit s v�dcem paladin�! M�m pro n�j d�le�itou zpr�vu!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_07_01"); //V�n�? Copak to asi m��e b�t za zpr�vu?
	
	Mil_310_Scheisse_erzaehlt = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Brzy za�to�� na m�sto!",DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"V khorinidsk�m �dol� se sb�raj� zl� s�ly!",DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"P�i�el jsem si pro Innosovo oko!",DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos() //1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00"); //P�i�el jsem si pro Innosovo oko!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01"); //Co�e? Nikdy jsem o n��em takov�m nesly�el. Co to m� b�t?
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02"); //Je to d�le�it� artefakt.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03"); //Nevypad� jako �lov�k, kter�mu by n�kdo sv��oval d�le�it� zpr�vy. M� n�co, ��m by ses mohl prok�zat?
	if (!Npc_HasItems(other, itwr_passierschein) > 0)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04"); //Ne, nem�m!
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05"); //Tak p�esta� pl�tvat m�m �asem!
	};
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy() //2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00"); //V khorinidsk�m �dol� se shroma��uj� s�ly zla!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01"); //V Hornick�m �dol�? P�i�el jsi odtamtud? Vid�l jsi tu arm�du?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne - ale pos�l� m� n�kdo, kdo ji vid�l.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne. Ale v�m, �e ji vedou draci!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ano. Byl jsem v khorinisk�m �dol�. Vid�l jsem n�kolik ob��ch drak�!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon() //3 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00"); //Brzy za�to�� na m�sto!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01"); //Co�e? Kdo? Sk�eti? Vid�l jsi tu arm�du?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne - ale pos�l� m� n�kdo, kdo ji vid�l.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne. Ale v�m, �e ji vedou draci!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ano. Byl jsem v khorinisk�m �dol�. Vid�l jsem n�kolik ob��ch drak�!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};
// ------------------------------------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_NoDragons() //+1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00"); //Ne. Ale v�m, �e ji vedou draci!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01"); //Jist�! A moje babi�ka je poradce sk�et�ch gener�l�.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02"); //Nemysli si, �e t� nech�me j�t za lordem Hagenem s takov�mi babsk�mi pov�da�kami!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03"); //Zmiz!
	Player_KnowsLordHagen = TRUE;
	
	AI_StopProcessInfos(self);	
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone() //+2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00"); //Ne - ale pos�l� m� n�kdo, kdo ji vid�l.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01"); //(ned�v��iv�) KDO t� pos�l�?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Nem�m povolen� ti ho ��ct.",DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Jeden paladin.",DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Jeden m�g.",DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons() //+3
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00"); //Ano. Byl jsem v khorinidsk�m �dol�. Vid�l jsem n�kolik ob��ch drak�!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01"); //Lh��i! Pr�smyk do �dol� je z obou stran uzav�en�. Nikdo se nedostane skrz!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02"); //Vypadni odsud!
	
	AI_StopProcessInfos(self);	
};
// -------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_AMage() //++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00"); //Jeden m�g.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01"); //M� zpr�vy od m�g�? Pak jist� m� pe�e� jako d�kaz!
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02"); //Ne.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03"); //Co�e? M�gov� V�DYCKY d�vaj� sv�m posl�m pe�e�.
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04"); //Tenhle m�g ne.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05"); //Nev���m ti. Jestli jsi opravdu posel, tak vybal ty zpr�vy, nebo zmiz!
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Mohu ten vzkaz p�edat jen paladin�m!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Arm�du zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin() //++2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00"); //Jeden paladin.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01"); //Hm, to by mohla b�t pravda - paladinov� dr�� pr�smyk do Hornick�ho �dol�.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02"); //Dej mi ten vzkaz a j� t� ohl�s�m.
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Mohu ten vzkaz p�edat jen paladin�m!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Arm�du zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou() //++3 - k.A.
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00"); //Nem�m povolen� ti ho ��ct.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01"); //Takhle se ke mn� nechovej, chlap�e! Jsem �lenem m�stsk� str�e.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02"); //M��e� mi ��ct V�ECHNO. Tak�e - kdo t� pos�l�?
};
// -------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons() //+++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00"); //Arm�du zla vedou draci!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01"); //Co�e? To nem��e b�t pravda. A j� u� t� m�lem pustil d�l.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02"); //Kdybys p�i�el za lordem Hagenem s TAKOVOUHLE poh�dkou, nechal by m� zkr�tit o hlavu.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03"); //Zmiz!
	Player_KnowsLordHagen = TRUE;	
	
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins() //+++2 --> 2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00"); //Mohu ten vzkaz p�edat jen paladin�m!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01"); //Takhle by to ne�lo, chlap�e!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02"); //Jak bych t� asi tak mohl pustit za lordem Hagenem, kdy� si nem��u b�t jist, �e nebude� pl�tvat jeho drahocenn�m �asem?
	Player_KnowsLordHagen = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne. Ten vzkaz je V�HRADN� pro paladiny.",DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Arm�du zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2() //+++2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00"); //Ne. Ten vzkaz je V�HRADN� pro paladiny.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01"); //V tom p��pad� tady tvoje cesta kon��, cizin�e.

	AI_StopProcessInfos(self);	
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_PERM (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_310_Stadtwache_PERM_Condition;
	information	= DIA_Mil_310_Stadtwache_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Mil_310_Stadtwache_PERM_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
	
func void DIA_Mil_310_Stadtwache_PERM_Info()
{
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_PERM_07_00"); //Mazej!
	
	AI_StopProcessInfos (self);
};






































