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
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00"); //STÁT!
		
	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01"); //(vzdychne si) Co je?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02"); //Víš dobâe co!
	
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03"); //Ve męstę jsi hledán pro vraždu!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04"); //Nechceme tady žádné špinavé zlodęje!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05"); //V našem męstę nepotâebujeme žádné potížisty!
		};
	
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06"); //Proč myslíš, že bychom tę męli nechat jít dál?
	}
	else // ------ normales Reinkommen ------
	{
		 var C_Item itm; itm = Npc_GetEquippedArmor(other);
		
		// ------ ohne Rüstung ------
		if (Npc_HasEquippedArmor(other) == FALSE)
		&& (hero.guild == GIL_NONE) 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07"); //Co je?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08"); //TEBE dovnitâ nepustíme, chlapče!
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09"); //Proč ne?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10"); //Takový hadrník jako ty určitę bude dęlat jenom potíže!
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11"); //Ve męstę máme chátry dost. Lidi bez penęz tady nepotâebujeme.
			
			Log_CreateTopic (TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
			B_LogEntry (TOPIC_City,"Aby mę stráže pustily do męsta, musím vypadat buë jako boháč, nebo musím vykoumat nęjaký jiný způsob.");
		}
 	 	 
 		// ------ als Bauer ------		
		else if (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE)
		|| 		(Hlp_IsItem(itm, ItAr_Bau_M) == TRUE)
		{
			if (self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12"); //Co chceš tentokrát?
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13"); //Posílá mę farmáâ.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14"); //No a? Máš tentokrát alespoŕ jeden dobrý důvod, proč jsi tady?
			}
			else //zum ersten Mal da
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15"); //Jsi jeden z pracovníků na Lobartovę farmę? Nikdy jsem tę tady nevidęl!
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16"); //Nejsem u Lobarta dlouho.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17"); //Co chceš ve męstę?
			};
		}
		
		// ------ alle anderen Rüstungen ------
		else 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18"); //(tiše) Cože?
			if (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19"); //Odpusă mi, ale takové máme rozkazy.
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20"); //Snažíš se mę zastavit?
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21"); //Samozâejmę ne. Všichni členové Innosovy církve jsou vítáni.
				
			}
			else
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22"); //Jen jsem se na tebe chtęl podívat. Zdá se, že máš peníze. Můžeš jít.
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
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00"); //O nic se nepokoušej. Ještę jeden krok a rozsekám tę na kousky!

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
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Attack_07_00"); //Âekl sis o to.
	
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
	description	= "Tady je 100 zlatých. Nech mę projít!";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Bribe_15_00"); //Tady je 100 zlatých. Nech mę projít!
	
	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_01"); //(hamižnę) 100 zlatých zní dobâe. Tak bęž.
		
		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_02"); //A jdi rovnou za lordem Andrem! Jinak tę to bude pâíštę stát dalších 100 zlatých!
		};
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
		Mil_310_schonmalreingelassen = TRUE;
		B_CheckLog();
		
		// ------ wenn bezahlt, persönliche Absolution erteilen -------
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else //nicht genug Gold
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_03"); //Co?! Kde?! Nevidím žádných 100 zlatých. Zmiz!
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
	description	= "Mám propustku!";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_00"); //Mám propustku!
	
	if (Npc_HasEquippedArmor(other) == FALSE) //ohne Rüstung
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_01"); //Vážnę? A koho jsi kvůli ní zamordoval, ty vrahoune?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_02"); //Tak necháte mę projít, nebo ne?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_03"); //No, bęž dál, než si to rozmyslím!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_04"); //Zdá se, že to je v poâádku. Tak bęž.
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
	description	= "Potâebuji jít za kováâem. Opravit nęjaké nástroje.";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00"); //Potâebuji za kováâem. Nechat opravit nęjaké nástroje.
	
	if (Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01"); //(rozzlobenę) Fakt? A proč jsi to neâekl rovnou?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02"); //Jen mę zajímalo, jak zareaguješ.
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03"); //Cože?! Zkus na mę nęco takového ještę jednou a ukážu ti, jak na takové vęci reaguju, ty hloupej vtipálku!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04"); //Dobrá, v poâádku, můžeš jít.
	};
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05"); //A jestli uvidíš Lobarta, vyâië mu, že by męl své ovce poâádnę krmit, brzy se u nęj zase zastavíme! (zle se zasmęje)

	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	B_GivePlayerXP (XP_Ambient);
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				Planzen für Constantino
// ************************************************************

INSTANCE DIA_Addon_Mil_310_Stadtwache_Constantino (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 2;
	condition	= DIA_Addon_Mil_310_Stadtwache_Constantino_Condition;
	information	= DIA_Addon_Mil_310_Stadtwache_Constantino_Info;
	permanent 	= TRUE;
	description	= "Nesu nęjaké bylinky pro alchymistu Constantina.";
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
	AI_Output (other, self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00"); //Nesu nęjaké byliny alchymistovi Constantinovi.

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
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01"); //(potutelnę) Vážnę? Pak mi určitę rád ukážeš, co mu neseš.
		
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
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02"); //(souhlasnę) Hmm, to vypadá dobâe. No tak jdi dál, ale žádné skopičiny, rozumíš?

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
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03"); //Cože? Co to má jako bejt?

			if (Npc_HasItems (other, ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04"); //Co by alchymista dęlal s tuâínama? To si dęláš srandu, ne? Vypadni.
			}
			else 
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05"); //O alchymii toho moc nevím, ale nač by nękomu byla zmęă takovýho plevele? Pâíštę to zkus líp.
			};	
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06"); //Jaký byliny? Dyk u sebe žádný nemáš! Táhni!
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
	description	= "Pâišel jsem, abych vstoupil do domobrany!";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00"); //Pâišel jsem, abych vstoupil do domobrany!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01"); //Dobrej vtip! Zkus to u druhé brány - ONI ti to možná spolknou.
	
	Mil_310_Scheisse_erzaehlt = TRUE;
};

// ************************************************************
// 				Wichtige Nachricht für Paladine
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Paladine (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 1;
	condition	= DIA_Mil_310_Stadtwache_Paladine_Condition;
	information	= DIA_Mil_310_Stadtwache_Paladine_Info;
	permanent 	= FALSE;
	description	= "Musím vidęt vůdce paladinů!";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_15_00"); //Potâebuji mluvit s vůdcem paladinů! Mám pro nęj důležitou zprávu!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_07_01"); //Vážnę? Copak to asi může být za zprávu?
	
	Mil_310_Scheisse_erzaehlt = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Brzy zaútočí na męsto!",DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"V khorinidském údolí se sbírají zlé síly!",DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Pâišel jsem si pro Innosovo oko!",DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos() //1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00"); //Pâišel jsem si pro Innosovo oko!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01"); //Cože? Nikdy jsem o nęčem takovém neslyšel. Co to má být?
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02"); //Je to důležitý artefakt.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03"); //Nevypadáš jako človęk, kterému by nękdo svęâoval důležité zprávy. Máš nęco, čím by ses mohl prokázat?
	if (!Npc_HasItems(other, itwr_passierschein) > 0)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04"); //Ne, nemám!
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05"); //Tak pâestaŕ plýtvat mým časem!
	};
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy() //2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00"); //V khorinidském údolí se shromažëují síly zla!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01"); //V Hornickém údolí? Pâišel jsi odtamtud? Vidęl jsi tu armádu?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne - ale posílá mę nękdo, kdo ji vidęl.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne. Ale vím, že ji vedou draci!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ano. Byl jsem v khoriniském údolí. Vidęl jsem nękolik obâích draků!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon() //3 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00"); //Brzy zaútočí na męsto!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01"); //Cože? Kdo? Skâeti? Vidęl jsi tu armádu?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne - ale posílá mę nękdo, kdo ji vidęl.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne. Ale vím, že ji vedou draci!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ano. Byl jsem v khoriniském údolí. Vidęl jsem nękolik obâích draků!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};
// ------------------------------------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_NoDragons() //+1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00"); //Ne. Ale vím, že ji vedou draci!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01"); //Jistę! A moje babička je poradce skâetích generálů.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02"); //Nemysli si, že tę necháme jít za lordem Hagenem s takovými babskými povídačkami!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03"); //Zmiz!
	Player_KnowsLordHagen = TRUE;
	
	AI_StopProcessInfos(self);	
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone() //+2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00"); //Ne - ale posílá mę nękdo, kdo ji vidęl.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01"); //(nedůvęâivę) KDO tę posílá?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Nemám povolení ti ho âíct.",DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Jeden paladin.",DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Jeden mág.",DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons() //+3
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00"); //Ano. Byl jsem v khorinidském údolí. Vidęl jsem nękolik obâích draků!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01"); //Lháâi! Průsmyk do údolí je z obou stran uzavâený. Nikdo se nedostane skrz!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02"); //Vypadni odsud!
	
	AI_StopProcessInfos(self);	
};
// -------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_AMage() //++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00"); //Jeden mág.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01"); //Máš zprávy od mágů? Pak jistę máš pečeă jako důkaz!
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02"); //Ne.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03"); //Cože? Mágové VŽDYCKY dávají svým poslům pečeă.
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04"); //Tenhle mág ne.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05"); //Nevęâím ti. Jestli jsi opravdu posel, tak vybal ty zprávy, nebo zmiz!
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Mohu ten vzkaz pâedat jen paladinům!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Armádu zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin() //++2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00"); //Jeden paladin.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01"); //Hm, to by mohla být pravda - paladinové drží průsmyk do Hornického údolí.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02"); //Dej mi ten vzkaz a já tę ohlásím.
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Mohu ten vzkaz pâedat jen paladinům!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Armádu zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou() //++3 - k.A.
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00"); //Nemám povolení ti ho âíct.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01"); //Takhle se ke mnę nechovej, chlapče! Jsem členem męstské stráže.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02"); //Můžeš mi âíct VŠECHNO. Takže - kdo tę posílá?
};
// -------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons() //+++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00"); //Armádu zla vedou draci!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01"); //Cože? To nemůže být pravda. A já už tę málem pustil dál.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02"); //Kdybys pâišel za lordem Hagenem s TAKOVOUHLE pohádkou, nechal by mę zkrátit o hlavu.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03"); //Zmiz!
	Player_KnowsLordHagen = TRUE;	
	
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins() //+++2 --> 2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00"); //Mohu ten vzkaz pâedat jen paladinům!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01"); //Takhle by to nešlo, chlapče!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02"); //Jak bych tę asi tak mohl pustit za lordem Hagenem, když si nemůžu být jist, že nebudeš plýtvat jeho drahocenným časem?
	Player_KnowsLordHagen = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Ne. Ten vzkaz je VÝHRADNĘ pro paladiny.",DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Armádu zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2() //+++2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00"); //Ne. Ten vzkaz je VÝHRADNĘ pro paladiny.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01"); //V tom pâípadę tady tvoje cesta končí, cizinče.

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






































