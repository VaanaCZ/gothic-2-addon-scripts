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
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00"); //ALT!
		
	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01"); //(sospira) Cosa c'è?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02"); //Lo sai benissimo!
	
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03"); //Sei ricercato in città per omicidio!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04"); //Non vogliamo degli sporchi ladri qui!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05"); //Non vogliamo nessun sobillatore qui!
		};
	
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06"); //Cosa ti fa pensare che ti faremo entrare?
	}
	else // ------ normales Reinkommen ------
	{
		 var C_Item itm; itm = Npc_GetEquippedArmor(other);
		
		// ------ ohne Rüstung ------
		if (Npc_HasEquippedArmor(other) == FALSE)
		&& (hero.guild == GIL_NONE) 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07"); //Di che si tratta?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08"); //TU non puoi entrare qui, amico!
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09"); //Perché?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10"); //A giudicare dal tuo aspetto trasandato, una volta dentro combineresti solo guai!
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11"); //Abbiamo già abbastanza furfanti in città. Non ci serve la gente senza soldi.
			
			Log_CreateTopic (TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
			B_LogEntry (TOPIC_City,"Per fare in modo che le guardie all'ingresso mi lasciano entrare in città, devo apparire come una persona benestante. O così, oppure devo trovare un altro modo.");
		}
 	 	 
 		// ------ als Bauer ------		
		else if (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE)
		|| 		(Hlp_IsItem(itm, ItAr_Bau_M) == TRUE)
		{
			if (self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12"); //Cosa vuoi stavolta?
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13"); //Mi manda il contadino.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14"); //Allora? Hai una buona ragione per venire qui stavolta?
			}
			else //zum ersten Mal da
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15"); //Sei uno degli aiutanti alla fattoria di Lobart? Non ti ho mai visto qui!
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16"); //È da parecchio tempo che non vedo più Lobart.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17"); //Che ci fai in città?
			};
		}
		
		// ------ alle anderen Rüstungen ------
		else 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18"); //(calmo) Cosa?
			if (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19"); //Scusa, ma questi sono i nostri ordini.
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20"); //Stai cercando di fermarmi?
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21"); //Certo che no. Tutti i membri della chiesa di Innos sono i benvenuti.
				
			}
			else
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22"); //Volevo solo controllarti. Pare che tu abbia i soldi. Puoi entrare.
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
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00"); //Non sto scherzando. Fai un altro passo e ti ridurrò a pezzetti!

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
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Attack_07_00"); //L'hai voluto tu...
	
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
	description	= "Ecco 100 pezzi d’oro. Fammi passare!";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Bribe_15_00"); //Ecco 100 monete d’oro. Fammi passare!
	
	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_01"); //(avido) 100 monete d'oro vanno bene. Puoi entrare dunque.
		
		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_02"); //E vai subito da Lord Andre, altrimenti la prossima volta dovrai sborsare altre 100 monete d'oro!
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
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_03"); //Cosa? Dove? Io non vedo 100 monete d'oro. Sparisci!
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
	description	= "Ho un lasciapassare!";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_00"); //Ho un lasciapassare!
	
	if (Npc_HasEquippedArmor(other) == FALSE) //ohne Rüstung
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_01"); //Davvero? E chi hai dovuto uccidere per ottenerlo, lurido tagliagole?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_02"); //Ora vuoi farmi entrare o no?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_03"); //Beh, entra prima che cambi idea!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_04"); //Sembra che sia tutto a posto. Entra.
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
	description	= "Voglio vedere il fabbro: devo farmi riparare alcuni attrezzi.";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00"); //Voglio vedere il fabbro, devo far riparare alcuni attrezzi.
	
	if (Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01"); //(arrabbiato) Oh? E perché non l'hai detto prima?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02"); //Ero solo curioso di vedere come avresti reagito.
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03"); //Cosa? Provaci di nuovo e ti farò vedere come reagisco a questo genere di cose, stupido bifolco!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04"); //D’accordo, puoi entrare.
	};
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05"); //E se dovessi vedere Lobart, digli di nutrire bene le sue pecore perché gli faremo visita a breve! (risata maligna)

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
	description	= "Ho portato delle erbe per Costantino, l'alchimista.";
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
	AI_Output (other, self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00"); //Ho delle erbe per Constantino l'alchimista.

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
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01"); //(furbescamente) Davvero? Allora non ti dispiacerà mostrarmi cos'hai lì.
		
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
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02"); //(in tono di approvazione) Mmh. Sembra a posto. D'accordo, entra. Ma non creare problemi, intesi?

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
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03"); //Eh? Cosa sarebbe questa roba?

			if (Npc_HasItems (other, ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04"); //Cosa se ne fa un alchimista di un mazzo di rape? Stai cercando di fare lo spiritoso? Sparisci!
			}
			else 
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05"); //Non so molto di alchimia, ma a chi vuoi che serva questo fastello di verdure miste? Bel tentativo.
			};	
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06"); //Quali erbe? Non hai erbe con te. Sparisci!
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
	description	= "Sono venuto per unirmi alla guardia cittadina.";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00"); //Sono venuto per unirmi alla guardia cittadina.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01"); //Bella mossa, ma non mi incanti! Prova all'altro cancello, forse avrai più fortuna con loro.
	
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
	description	= "Devo incontrare il capo dei paladini!";
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
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_15_00"); //Devo vedere il capo dei paladini! Ho un messaggio urgente da consegnargli!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_07_01"); //Oh? E di cosa si tratterebbe?
	
	Mil_310_Scheisse_erzaehlt = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"La città sarà presto sotto assedio!",DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Gli eserciti del male sono accampati nella valle di Khorinis!",DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Sono venuto per prendere l’Occhio di Innos!",DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos() //1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00"); //Sono venuto per prendere l’Occhio di Innos!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01"); //Che? Non l'ho mai sentito nominare prima, cos'è?
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02"); //È un artefatto importante.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03"); //Tu non hai propriamente l'aspetto di un messaggero importante. Hai un documento di identità?
	if (!Npc_HasItems(other, itwr_passierschein) > 0)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04"); //No!
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05"); //Allora non farmi perdere tempo!
	};
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy() //2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00"); //Gli eserciti del male sono accampati nella valle di Khorinis!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01"); //Nella Valle delle Miniere? Tu vieni da lì? Hai visto l'esercito?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No... ma mi manda qualcuno che li ha visti.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No. Ma so che è guidato dai draghi!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Sì. Mi trovavo nella valle di Khorinis. Ho visto dei draghi giganteschi!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon() //3 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00"); //La città sarà presto sotto assedio!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01"); //Cosa? Da parte di chi? Degli orchi? Hai visto il nostro esercito?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No... ma mi manda qualcuno che li ha visti.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No. Ma so che è guidato dai draghi!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Sì. Mi trovavo nella valle di Khorinis. Ho visto dei draghi giganteschi!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};
// ------------------------------------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_NoDragons() //+1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00"); //No. Ma so che è guidato dai draghi!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01"); //Certo! E mia nonna è la consigliera dei generali degli orchi.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02"); //Non crederai mica che ti lasceremo raccontare queste favole a Lord Hagen?
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03"); //Sparisci!
	Player_KnowsLordHagen = TRUE;
	
	AI_StopProcessInfos(self);	
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone() //+2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00"); //No... ma mi manda qualcuno che li ha visti.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01"); //(sospettoso) CHI ti ha mandato?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Non ho il permesso di dirtelo.",DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Un paladino.",DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Un mago.",DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons() //+3
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00"); //Sì. Mi trovavo nella valle di Khorinis. Ho visto dei draghi giganteschi!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01"); //Tu menti! Il passo che conduce alla valle è sorvegliato da entrambi i lati. Nessuno può attraversarlo!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02"); //Fuori da qui!
	
	AI_StopProcessInfos(self);	
};
// -------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_AMage() //++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00"); //Un mago.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01"); //Hai notizie dai maghi? Allora avrai certamente un sigillo come prova!
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02"); //No.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03"); //Cosa? I maghi consegnano SEMPRE un sigillo ai loro messaggeri.
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04"); //Non questo mago.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05"); //Non ti credo. Se sei davvero un messaggero, allora di' quello che devi dire e sparisci!
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Posso solo consegnare questo messaggio ai paladini!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"L’esercito del male è guidato dai draghi!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin() //++2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00"); //Un paladino.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01"); //Mmmh, potrebbe essere, i paladini difendono il passo che conduce alla Valle delle Miniere.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02"); //Dammi il tuo messaggio e lo riporterò per te.
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Posso solo consegnare questo messaggio ai paladini!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"L’esercito del male è guidato dai draghi!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou() //++3 - k.A.
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00"); //Non ho il permesso di dirtelo.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01"); //Non fare così con me, ragazzo! Io sono un membro della guardia cittadina.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02"); //Puoi dirmi OGNI COSA. Allora, chi ti manda?
};
// -------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons() //+++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00"); //L’esercito del male è guidato dai draghi!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01"); //Cosa? Non può essere vero. E dire che ero quasi sul punto di lasciarti entrare.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02"); //Se avessi raccontato QUESTA storia a Lord Hagen, mi avrebbe fatto tagliare la testa.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03"); //Sparisci!
	Player_KnowsLordHagen = TRUE;	
	
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins() //+++2 --> 2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00"); //Posso solo consegnare questo messaggio ai paladini!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01"); //Non funziona così, ragazzo!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02"); //Se prima non mi assicuro che non farai perdere tempo a Lord Hagen, non ti farò entrare per niente al mondo.
	Player_KnowsLordHagen = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No. Il messaggio è SOLO per i paladini.",DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"L’esercito del male è guidato dai draghi!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2() //+++2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00"); //No. Il messaggio è SOLO per i paladini.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01"); //Allora il tuo viaggio termina qui, straniero.

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
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_PERM_07_00"); //Vattene!
	
	AI_StopProcessInfos (self);
};






































