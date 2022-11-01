// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Torlof_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_EXIT_Condition;
	information	= DIA_Torlof_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Torlof_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Torlof_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				Hallo
// ************************************************************
instance DIA_Torlof_Hallo (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 1;
	condition	= DIA_Torlof_HALLO_Condition;
	information	= DIA_Torlof_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Torlof_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Torlof_Hallo_01_00"); //(nevrle) Co po mnę chceš?
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Torlof_WannaJoin (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 2;
	condition	= DIA_Torlof_WannaJoin_Condition;
	information	= DIA_Torlof_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "Chci se pâidat k žoldnéâům!";
};

func int DIA_Torlof_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Chci se pâidat k žoldnéâům!
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Hm? A proč si myslíš, že bych męl být pro, abychom tę sem pâijali?
};

// ************************************************************
// 			  				Probe
// ************************************************************
var int Torlof_Go;

instance DIA_Torlof_Probe (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 3;
	condition	= DIA_Torlof_Probe_Condition;
	information	= DIA_Torlof_Probe_Info;
	permanent 	= TRUE;
	description	= "Nech mę projít zkouškou!";
};

func int DIA_Torlof_Probe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Torlof_WannaJoin))
	&& (hero.guild == GIL_NONE)
	&& (Torlof_Go == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Probe_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Nech mę projít zkouškou!
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Poslal tę za mnou Lee?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //Âekl, že mi pomůžeš.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //(vzdychne si) Fajn. Tak dobrá. Než se k nám budeš moct pâidat, musíš udęlat dvę vęci.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Za prvé - musíš prokázat, že budeš schopný zvládnout úkoly, které budeš jako žoldnéâ dostávat. Sám tę ozkouším.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //A za druhé - musíš si vysloužit respekt ostatních žoldáků.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Začít"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Aby mę žoldnéâi pâijali mezi sebe, musím podstoupit zkoušku, kterou mi zadá Torlof, a vysloužit si respekt ostatních.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Ne.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Tak co tady plkáš?
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 			  				Respekt
// ************************************************************
instance DIA_Torlof_Respekt (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 4;
	condition	= DIA_Torlof_Respekt_Condition;
	information	= DIA_Torlof_Respekt_Info;
	permanent 	= FALSE;
	description	= "Jak si získám respekt ostatních žoldáků?";
};

func int DIA_Torlof_Respekt_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Respekt_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Jak si vysloužím respekt ostatních žoldnéâů?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //Vętšinę z nich bude stačit, když splníš svůj úkol a projdeš mým testem.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //Nękteré ale budeš muset pâesvędčit jinak a sám musíš zjistit jak.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //Nękteâí budou chtít využít toho, v jaké jsi situaci, jiným se prostę nebude líbit tvůj ksicht.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //Męl by ses snažit najít společnou âeč s co nejvíce z nich - ale když nepomůže nic jiného, můžeš se vždycky utkat v souboji.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Když vyhraješ, získáš si u vętšiny uznání. Dej si ale pozor, abys nękoho náhodou nezabil. V tom pâípadę bys byl v pękné kaši.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Splním-li Torlofovu zkoušku, získám si tím respekt i u ostatních žoldnéâů. Také na nę mohu zapůsobit, pokud nękteré z nich pâemůžu v souboji.");
	
};

// ************************************************************
// 			  				Duellregeln
// ************************************************************
instance DIA_Torlof_Duellregeln (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 5;
	condition	= DIA_Torlof_Duellregeln_Condition;
	information	= DIA_Torlof_Duellregeln_Info;
	permanent 	= FALSE;
	description	= "Jaká jsou pravidla pro souboj?";
};

func int DIA_Torlof_Duellregeln_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Torlof_Respekt))
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Duellregeln_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Jaká jsou pravidla pro souboj?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Je to prosté. Pâed prvním úderem musejí mít oba soupeâi možnost vytasit zbraŕ.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Nemůžeš jen tak nękoho propíchnout bez varování.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Musí dojít k nęjaké formę ústní výzvy. Urážce, nebo jinému důvodu k boji.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //Do takového souboje se nebude nikdo jiný míchat. Leda že by bęhem nęj nękdo z tęch dvou zemâel.
	
	B_LogEntry (TOPIC_SLDRespekt,"Pravidla souboje: souboj musí začít výzvou, aby do nęj již nikdo další nezasahoval. Také pâi nęm nikdo nesmí být zabit.");
};

// ************************************************************
// 			  				DeineStimme
// ************************************************************
instance DIA_Torlof_DeineStimme (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 6;
	condition	= DIA_Torlof_DeineStimme_Condition;
	information	= DIA_Torlof_DeineStimme_Info;
	permanent 	= FALSE;
	description	= "A co ty? Budeš pro mę hlasovat?";
};

func int DIA_Torlof_DeineStimme_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (other.guild == GIL_NONE)
	&& (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DeineStimme_Info ()
{
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //A co ty? Budeš pro mę hlasovat?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Pokud prokážeš, že jsi schopný plnit úkoly žoldnéâe, tak ano.
};


// ************************************************************
// 			  					RUF
// ************************************************************
var int Points_Sld;

instance DIA_Torlof_RUF (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 7;
	condition	= DIA_Torlof_RUF_Condition;
	information	= DIA_Torlof_RUF_Info;
	permanent 	= TRUE;
	description	= "Jak to vypadá s mojí reputací mezi žoldnéâi?";
};

func int DIA_Torlof_RUF_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (Torlof_GenugStimmen == FALSE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_RUF_Info ()
{
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Jak to vypadá s mojí reputací mezi žoldnéâi?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Tak se na to podívejme...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Vlk nemá nic proti tomu, aby ses pâidal.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis si myslí, že stojíš na správné stranę.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis si stále není jistý, jestli stojíš na správné stranę.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Nechce, aby nękdo další tancoval tak, jak Sylvio píská. Když jsme u toho, tak já také ne.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord si myslí, že bys mohl být dost dobrý na to, abychom tę pâijali.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Podle Cordova názoru se budeš muset nejdâív naučit poâádnę zacházet s mečem, než se budeš moci pâidat.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher âíká, že pro nęj bylo od začátku jasné, že by ses k nám męl pâidat. Vypadá to, že ho nęco vážnę potęšilo.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher âíká, že mu dlužíš laskavost a že víš, o čem je âeč.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod chce jen dostat zpátky svůj meč.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Zdá se, žes Roda pâesvędčil o tom, že jsi dostatečnę silný.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod si myslí, že jsi slaboch.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza pro tebe ruku zvedne. Âíká, že ses zachoval velice rozumnę.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza pro tebe ruku nezvedne. Âíká, že mu stále dlužíš 50 zlatých.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul je proti tobę. Myslím, že tę nemůže vystát.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //O Sylviovi a Bullcovi mluvit nemusím. Ti dva tupci jsou proti každému.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster âíká, že jsi v pohodę.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //I když jsi prohrál.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster âíká, že když tę vyzval, tak jsi vymękl.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //To nebyl dobrý nápad. Možná bys za ním męl zajít a vyzvat ho.
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //A Dar âíká, že jsi žvanil. Ale jeho hlas tady moc neznamená.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Zbytek žoldnéâů neâekl nic.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //Vętšina z nich čeká, jak si povedeš bęhem zkoušky.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //Vętšinu z nich jsi pâesvędčil tím, že jsi prošel zkouškou.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //(ušklíbne se) I když v tom má trochu prsty Cord.
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //I když hodnę z nich âíká, že pâesvędčit farmáâe, aby zaplatil svůj nájem, bylo na zkoušku moc jednoduché.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //Můj hlas každopádnę máš.
		Points_Sld = Points_Sld + 1;
	};
	
	// --------------------
	// ------ Duelle ------
	// --------------------
	if (Sld_Duelle_gewonnen >= 3)//geändert M.F.
	{
		Points_Sld = Points_Sld + 1;
		
		if (Points_Sld >= 9)//geändert M.F.
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //A vyhrál jsi nękolik čestných soubojů.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //To hodnę žoldnéâů respektuje.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //Každopádnę jsi vyhrál nękolik čestných soubojů.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //geändert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 für Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //Vętšina žoldnéâů stojí za tebou - co se nás týče, můžeš u nás začít, kdy se ti zlíbí.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //Bęž za Leem. Vysvętlí ti všechno potâebné.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Mezi žoldnéâi už jsem si vysloužil dost úcty. Teë bych męl prohodit pár slov s Leem."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //To je dost, ale poâád to nestačí.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Budeš se muset s chlapci ještę chvíli prát.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Nemáš to ani zdaleka za sebou, chlapče. Jestli chceš, abychom tę pâijali mezi sebe, budeš pro to muset udęlat trochu víc.
	};
};

// ************************************************************
// 			  				Aufgaben
// ************************************************************

instance DIA_Torlof_Aufgaben (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 8;
	condition	= DIA_Torlof_Aufgaben_Condition;
	information	= DIA_Torlof_Aufgaben_Info;
	permanent 	= FALSE;
	description	= "Jaké mám jako žoldnéâ povinnosti?";
};

func int DIA_Torlof_Aufgaben_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //Jaké mám jako žoldnéâ povinnosti?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar nás najal ze dvou důvodů: chce, abychom od nęj drželi dál domobranu a udržovali poâádek na jeho farmách.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //To zahrnuje vybírání pachtovného, když nebudou chtít drobní farmáâi zaplatit.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //Takže, co to bude?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Nech mę vybrat ten nájem!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Vypoâádám se s domobranou, žádné obavy!", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Dobrá. Poslouchej. Farmáâ Sekob už nękolik týdnů Onarovi nezaplatil nájem.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar po nęm chce, aby vysolil 50 zlatých. Nęjaké otázky?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Kde je Sekobova farma?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //V severní části údolí. Když se díváš odsud, je to napravo u té velké kâižovatky.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Kdybys męl nęjaké problémy, farmáâi na polích ti pomůžou najít cestu.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof mę požádal, abych od sedláka Sekoba vyinkasoval nájemné, které činí 50 zlaăáků.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Farmáâ Bengar si stęžoval, že mu domobrana z męsta v poslední dobę leze na nervy.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Vyvíjejí na toho farmáâe nátlak - nejspíš chtęjí, aby se otočil k Onarovi zády.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Chci, abys šel na jeho farmu a vyjasnil domobranę, že tady nemají co pohledávat! Otázky?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Jak najdu Bengarovu farmu?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //Na jihozápadę údolí je velké schodištę, které vede na planinu. Tam má Bengar svou farmu.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Kdyby ses ztratil, zeptej se farmáâů na polích, kudy se dát.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof mę povęâil, abych na planinę ze statku sedláka Bengara vyhnal domobranu.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Nech mę vybrat ten nájem!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Vypoâádám se s domobranou, žádné obavy!
	B_Torlof_BengarMilizKlatschen();
	Torlof_Probe = Probe_Bengar;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

// ************************************************************
// 			  			Sekob Success
// ************************************************************
var int Torlof_TheOtherMission_Day;
// ------------------------------------------------------------
func void B_Torlof_TheOtherMissionDay()
{
	if (Torlof_TheOtherMission_Day < (Wld_GetDay() - 1)) 
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Trvalo ti to strašnę dlouho. Onar nebude mít radost.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //A je mu jedno, jestli paladiny nęco sežere v Hornickém údolí, nebo ne.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Dobrá práce! Až budu mít nęco dalšího, dám ti vędęt.
	};
};
// ------------------------------------------------------------
instance DIA_Torlof_SekobSuccess (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 9;
	condition	= DIA_Torlof_SekobSuccess_Condition;
	information	= DIA_Torlof_SekobSuccess_Info;
	permanent 	= TRUE;
	description	= "Vybral jsem nájem od Sekoba.";
};

func int DIA_Torlof_SekobSuccess_Condition ()
{
	if (MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)
	{
		if (Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_IsDead (Sekob))
		{
			return TRUE;
		};
	};
};

func void DIA_Torlof_SekobSuccess_Info ()
{
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Vybral jsem nájem od Sekoba.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //A? Zaplatil dobrovolnę?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //No, potkal ho smrtelný úraz...
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Nejdâív jsem ho musel pâesvędčit.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Dobrá práce! Prošel jsi zkouškou. To pâesvędčí hodnę žoldnéâů o tom, že víš, co se sluší a patâí.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem úkol, který mi svęâil Torlof."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //A? Utratil jsi to snad za chlast? Pâines mi peníze! A hezky zčerstva!
	};
};

// ************************************************************
// 			  			Bengar Success
// ************************************************************
instance DIA_Torlof_BengarSuccess (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 10;
	condition	= DIA_Torlof_BengarSuccess_Condition;
	information	= DIA_Torlof_BengarSuccess_Info;
	permanent 	= FALSE;
	description	= "Postaral jsem se o Bengarův problém s domobranou.";
};

func int DIA_Torlof_BengarSuccess_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_IsDead (Rumbold))
	&& (Npc_IsDead (Rick))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BengarSuccess_Info ()
{
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Postaral jsem se o Bengarův problém s domobranou.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Ujistil ses, že nebudou zítra zase stát na jeho zápraží?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //S tím by męli docela potíže...
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Dobrá práce!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Prošel jsi zkouškou. Když dokážeš zvládnout domobranu, vętšina tę tady bude uznávat.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem úkol, který mi svęâil Torlof."); 
	Torlof_ProbeBestanden = TRUE;
};


// ************************************************************
// 			  				Welcome
// ************************************************************
instance DIA_Torlof_Welcome (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 11;
	condition	= DIA_Torlof_Welcome_Condition;
	information	= DIA_Torlof_Welcome_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Torlof_Welcome_Condition ()
{
	if (other.guild == GIL_SLD)
	&& (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Welcome_Info ()
{
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //Vítej mezi žoldnéâi, chlapče!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //Díky!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Jakmile pro tebe budu mít nęco na práci, dám ti vędęt.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Kde jsi byl?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //Byl jsem v Hornickém údolí! Jsou tam draci! Dali paladinům pęknę zabrat!
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Fakt? Takže na všech tęch povídačkách vážnę nęco je!
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Leeho to bude zajímat.
		Torlof_KnowsDragons = TRUE;
	};

instance DIA_Torlof_TheOtherMission (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 11;
	condition	= DIA_Torlof_TheOtherMission_Condition;
	information	= DIA_Torlof_TheOtherMission_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Torlof_TheOtherMission_Condition ()
{
	if (other.guild == GIL_SLD)
	&& (Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Torlof_TheOtherMission_Info ()
{
	if (Torlof_KnowsDragons == FALSE)
	&& (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE)
	{
		B_Torlof_Dragons();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Dobâe že jsi tady. Mám pro tebe nęco na práci.
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //O co jde?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //A postarej se o to, aă je to do zítra hotové!
	Torlof_TheOtherMission_Day = Wld_GetDay();
};

// ************************************************************
// 			  			Dragons
// ************************************************************
instance DIA_Torlof_Dragons (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 12;
	condition	= DIA_Torlof_Dragons_Condition;
	information	= DIA_Torlof_Dragons_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Torlof_Dragons_Condition ()
{
	if (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE)
	&& (Kapitel <= 3)
	&& (other.guild == GIL_SLD)
	&& (Torlof_KnowsDragons == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Dragons_Info ()
{
	B_Torlof_Dragons();
};

//*******************************************
//	WhatCanYouTeach
//*******************************************

INSTANCE DIA_Torlof_WhatCanYouTeach(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 140;
	condition	= DIA_Torlof_WhatCanYouTeach_Condition;
	information	= DIA_Torlof_WhatCanYouTeach_Info;
	permanent	= FALSE;
	description = "Pomohl bys mi vylepšit moje schopnosti?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //Můžeš mi pomoci vylepšit moje schopnosti?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Mohl bych ti ukázat, jak lépe využít svou sílu pâi boji na blízko.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Spousta bojovníků je strašnę slabá, protože nemají správnou techniku, s jejíž pomocí by správnę využívali svou sílu.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //To samé platí u stâelných zbraní a obratnosti.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof mi pomůže vylepšit obratnost a sílu.");
};

// *******************************************
//					Teach
// *******************************************

var int Torlof_Merke_STR;
var int Torlof_Merke_DEX;
// -------------------------------------------

INSTANCE DIA_Torlof_Teach(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 150;
	condition	= DIA_Torlof_Teach_Condition;
	information	= DIA_Torlof_Teach_Info;
	permanent	= TRUE;
	description = "Chci si vylepšit schopnosti!";
};                       

FUNC INT DIA_Torlof_Teach_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Torlof_WhatCanYouTeach))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Torlof_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Chci si vylepšit schopnosti!
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	|| (other.guild == GIL_NONE)
	{
		Torlof_Merke_STR = other.attribute[ATR_STRENGTH];
		Torlof_Merke_DEX = other.attribute[ATR_DEXTERITY];
		
		Info_ClearChoices (DIA_Torlof_Teach);
		Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
	}
	else
	{
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //Âekl jsem, že bych ti MOHL pomoci, ne že ti POMŮŽU.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Dokud nejsi jedním z nás, musíš si najít nękoho jiného, kdo by tę učil!
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //Dobrá! Nyní dokážeš používat svoje schopnosti lépe!
	};

	Info_ClearChoices (DIA_Torlof_Teach);
};

FUNC VOID DIA_Torlof_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};

FUNC VOID DIA_Torlof_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);

	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};

FUNC VOID DIA_Torlof_Teach_DEX_1 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);	

	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};

FUNC VOID DIA_Torlof_Teach_DEX_5 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);

	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Torlof_KAP3_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP3_EXIT_Condition;
	information	= DIA_Torlof_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dementoren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DEMENTOREN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	30;
	condition	 = 	DIA_Torlof_DEMENTOREN_Condition;
	information	 = 	DIA_Torlof_DEMENTOREN_Info;

	description	 = 	"Nemáš pro mę nęco na práci?";
};

func int DIA_Torlof_DEMENTOREN_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Torlof_DEMENTOREN_Info ()
{
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Nemáš pro mę nęco na práci?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Vidęls ty chlapíky s černými kápęmi, co se potulují po okolí? Âeknu ti, bęhá mi z nich mráz po zádech.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Když jsem byl na moâi, vidęl jsem pár vážnę divných vęcí, ale tihle lidi mę vážnę dęsí.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //Šli smęrem k táboru banditů, co je v horách na jižním konci údolí.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Možná by ses tam męl vydat, zjistit, co jsou zač, a vypoâádat se s nimi!
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"Pár tęch zakuklenců se nejspíš bude skrývat v táboâe banditů v horách jižnę od údolí. Torlofovi poâádnę pijí krev - mám pro nęj tenhle problém vyâešit."); 

	MIS_Torlof_Dmt = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info Dementoren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DmtSuccess	(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	30;
	condition	 = 	DIA_Torlof_DmtSuccess_Condition;
	information	 = 	DIA_Torlof_DmtSuccess_Info;

	description	 = 	"Ti černokápníci z hor už nejsou mezi námi.";
};

func int DIA_Torlof_DmtSuccess_Condition ()
{
	if (MIS_Torlof_Dmt == LOG_RUNNING) 
	&& (Npc_IsDead(CastlemineDMT))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DmtSuccess_Info ()
{
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Ti černokápníci z hor už nejsou mezi námi.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Dokázal jsi je vyâídit? Frajer!
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Ani za mák jsem tęm chlapíkům nevęâil. Jenom by dęlali trable.
	
	MIS_Torlof_Dmt = LOG_SUCCESS;
	B_GivePlayerXP (XP_Torlof_DMT);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Torlof_KAP4_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP4_EXIT_Condition;
	information	= DIA_Torlof_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WoistSylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_WOISTSYLVIO		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	40;
	condition	 = 	DIA_Torlof_WOISTSYLVIO_Condition;
	information	 = 	DIA_Torlof_WOISTSYLVIO_Info;

	description	 = 	"Nękteâí žoldnéâi odešli?";
};

func int DIA_Torlof_WOISTSYLVIO_Condition ()
{
	if ((MIS_ReadyforChapter4 == TRUE)	|| (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Torlof_WOISTSYLVIO_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //Nękteâí žoldnéâi odešli?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio sebral pár chlapců a zmizel s nimi na druhou stranu průsmyku.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //Povídá se, že se tam objevili draci. Když se to doslechl, nešlo ho zastavit.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Kdo ví? Za dračí trofej by dostal na trhu hromadu penęz.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //To pro mę není. Jsem námoâník. Patâím na moâe, a ne do nęjakého smradlavého dračího doupęte.

};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Torlof_KAP5_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP5_EXIT_Condition;
	information	= DIA_Torlof_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	51;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN_Info;

	description	 = 	"Ty jsi námoâník?";
};

func int DIA_Torlof_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //Ty jsi námoâník?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //Konečnę tę to trklo? Jo, ksakru, jsem námoâník. Proč se ptáš?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Hodily by se mi tvoje schopnosti. Potâebuji se dostat na jeden ostrov.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //(zasmęje se) Na ostrov? Vždyă ani nemáš loë, natož posádku, která by ji âídila.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Ne, chlapče. Jestli chceš využít mých služeb jako kapitána a učitele síly, musíš mi nejdâív dokázat, že víš, o čem mluvíš.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Kromę toho mám už tak dost svých vlastních starostí. Paladinové se nestáhli z męsta, jak jsme očekávali.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Muselo by se stát nęco opravdu vážného, aby vyklidili pole.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //Bęž do hradu v Hornickém údolí. Ukradni strážím klíč od hlavní brány a otevâi ji. Skâeti se už postarají o zbytek!

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Ještę než Torlof pâijme funkci kapitána, musím pâimęt paladiny, aby opustili męsto. Když mu pomohu, společnę na hradę v Hornickém údolí nastražíme malou lest. Musím strážci ukrást klíč od hlavní brány a otevâít ji, aby do hradu mohli proniknout skâeti. Torlof doufá, že tahle pohroma pâimęje paladiny, aby odešli z męsta a vydali se na pomoc svým kamarádům.");
};                                                                                                                                                                                                                                                                                                                                                                                                                   
///////////////////////////////////////////////////////////////////////                                                                                                                                                                                                                                                                                                                                              
//	Info BeMyCaptain2s
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	52;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN2_Info;

	description	 = 	"Brána od hradu v Hornickém údolí je otevâena...";
};

func int DIA_Torlof_BEMYCAPTAIN2_Condition ()
{
	if (MIS_OCGateOpen == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Torlof_BEMYCAPTAIN))
		{
			return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN2_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Brána do hradu v Hornickém údolí je otevâená a zaseknutá. Skâetům už nic nebrání v tom, aby vzali hrad útokem.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Paladinové utrpęli v bitvę se skâety vážné ztráty.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //Âekl bych, že už nebude trvat dlouho, než se paladinové odsud z męsta vydají do Hornického údolí, aby dostali své kamarády pryč z hradu.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //To jsou pâíjemné zprávy. Takže už nic nestojí v cestę tomu, abych utekl z tohohle prokletého kraje.
	B_GivePlayerXP (XP_Ambient);
	
};
///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	53;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Teë už mi pomůžeš dostat se na ten ostrov?";
};
var int Torlof_PaidToBeCaptain;
func int DIA_Torlof_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Torlof_BEMYCAPTAIN2))
		&& (Torlof_PaidToBeCaptain == FALSE)
		&& (SCGotCaptain == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Teë už mi pomůžeš dostat se na ten ostrov?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //No jasnę. Chtęl jsi jet na nęjaký ostrov. Hmm. Dám ti jeden návrh.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Zaplatíš mi 2500 zlatých a já se ujmu velení tvé lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Navíc tę budu trénovat v síle a obratnosti, kdykoliv to jen budeš chtít.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "To je strašná spousta penęz.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "Dobrá. Tady máš své peníze.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //To je strašná spousta penęz.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //To jo. Dobrá pomoc je drahá. Nemáš na výbęr. Tady v okolí nenajdeš nikoho dalšího, kdo by velel tvé lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Tak zaplaă a nedęlej vlny.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof je nyní ochoten âídit loë. Bohužel za to ale požaduje 2500 zlaăáků.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //Dobrá. Tady máš své peníze.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //Nádhera. Teë mi jen pâesnę âekni, co po mnę budeš chtít.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Potom, co jsem mu pâedal 2500 zlaăáků, se Torlof konečnę uvolil dopravit mę k cíli.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Snažíš se mę oblbnout pár mincemi? Nejdâív pâines peníze. Pak uvidíme.
	};
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
};


///////////////////////////////////////////////////////////////////////
//	Info BEMYCAPTAIN4
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN4		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	54;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN4_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Buë mým kapitánem.";
};

func int DIA_Torlof_BEMYCAPTAIN4_Condition ()
{
	if  (SCGotCaptain == FALSE)
		&& (Torlof_PaidToBeCaptain == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN4_Info ()
{
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //Buë mým kapitánem.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //Dobrá. Sežeŕ mi loë a dostatečnę silnou posádku a já tę dostanu na ten tvůj mizerný ostrov.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //Máš námoâní mapy? Bez nich se moc daleko nedostaneme.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //O to se postarám. Setkáme se v pâístavu.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //Jsem vážnę zvędavý, jak to chceš udęlat.
	
		AI_StopProcessInfos (self);
		SCGotCaptain = TRUE;
		TorlofIsCaptain = TRUE;
		self.flags = NPC_FLAG_IMMORTAL;
		Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
		
		B_GivePlayerXP (XP_Captain_Success);              

};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_LOSFAHREN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	59;
	condition	 = 	DIA_Torlof_LOSFAHREN_Condition;
	information	 = 	DIA_Torlof_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vzhůru na ostrov!";
};

func int DIA_Torlof_LOSFAHREN_Condition ()
{
	if (TorlofIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Vzhůru na ostrov!

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Dobrá. Dej mi mapy a můžeme vyplout.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //(zavolá) Všichni na palubu.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Ujisti se, že máš opravdu všechno, co bys mohl potâebovat. Vracet se nemůžeme.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Jestli si jsi jistý, bęž se natáhnout do kapitánské kajuty. Za chvíli vyrazíme na cestu.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //Žádná loë, žádná posádka, žádná mapa, žádný výlet, pâíteli.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Chci vidęt aspoŕ pęt chlapů ochotných a schopných plavby.
	AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	59;
	condition	 = 	DIA_Torlof_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Torlof_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Rozhodl jsem se pro jiného kapitána.";
};

func int DIA_Torlof_PERM5_NOTCAPTAIN_Condition ()
{
	if	(SCGotCaptain == TRUE)
		&&	(TorlofIsCaptain == FALSE)
		&& 	(Torlof_PaidToBeCaptain == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Rozhodl jsem se pro jiného kapitána. Můžeš mi hned vrátit mé peníze.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //To by nešlo. Nic takového. Když mi nejdâív zaplatíš a pak nakonec moje služby odmítáš, je to tvůj problém.
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Torlof_KAP6_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP6_EXIT_Condition;
	information	= DIA_Torlof_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Torlof_PICKPOCKET (C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 900;
	condition	= DIA_Torlof_PICKPOCKET_Condition;
	information	= DIA_Torlof_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Torlof_PICKPOCKET_Condition()
{
	C_Beklauen (76, 120);
};
 
FUNC VOID DIA_Torlof_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Torlof_PICKPOCKET);
	Info_AddChoice		(DIA_Torlof_PICKPOCKET, DIALOG_BACK 		,DIA_Torlof_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Torlof_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Torlof_PICKPOCKET_DoIt);
};

func void DIA_Torlof_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Torlof_PICKPOCKET);
};
	
func void DIA_Torlof_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Torlof_PICKPOCKET);
};

































































