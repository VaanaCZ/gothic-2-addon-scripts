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
	AI_Output (self, other, "DIA_Torlof_Hallo_01_00"); //(nevrle) Co po mnê chceš?
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
	description	= "Chci se pâidat k žoldnéâùm!";
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
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Chci se pâidat k žoldnéâùm!
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Hm? A proè si myslíš, že bych mêl být pro, abychom tê sem pâijali?
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
	description	= "Nech mê projít zkouškou!";
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
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Nech mê projít zkouškou!
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Poslal tê za mnou Lee?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //Âekl, že mi pomùžeš.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //(vzdychne si) Fajn. Tak dobrá. Než se k nám budeš moct pâidat, musíš udêlat dvê vêci.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Za prvé - musíš prokázat, že budeš schopný zvládnout úkoly, které budeš jako žoldnéâ dostávat. Sám tê ozkouším.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //A za druhé - musíš si vysloužit respekt ostatních žoldákù.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Zaèít"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Aby mê žoldnéâi pâijali mezi sebe, musím podstoupit zkoušku, kterou mi zadá Torlof, a vysloužit si respekt ostatních.");
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
	description	= "Jak si získám respekt ostatních žoldákù?";
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
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Jak si vysloužím respekt ostatních žoldnéâù?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //Vêtšinê z nich bude staèit, když splníš svùj úkol a projdeš mým testem.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //Nêkteré ale budeš muset pâesvêdèit jinak a sám musíš zjistit jak.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //Nêkteâí budou chtít využít toho, v jaké jsi situaci, jiným se prostê nebude líbit tvùj ksicht.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //Mêl by ses snažit najít spoleènou âeè s co nejvíce z nich - ale když nepomùže nic jiného, mùžeš se vždycky utkat v souboji.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Když vyhraješ, získáš si u vêtšiny uznání. Dej si ale pozor, abys nêkoho náhodou nezabil. V tom pâípadê bys byl v pêkné kaši.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Splním-li Torlofovu zkoušku, získám si tím respekt i u ostatních žoldnéâù. Také na nê mohu zapùsobit, pokud nêkteré z nich pâemùžu v souboji.");
	
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
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Je to prosté. Pâed prvním úderem musejí mít oba soupeâi možnost vytasit zbraà.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Nemùžeš jen tak nêkoho propíchnout bez varování.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Musí dojít k nêjaké formê ústní výzvy. Urážce, nebo jinému dùvodu k boji.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //Do takového souboje se nebude nikdo jiný míchat. Leda že by bêhem nêj nêkdo z têch dvou zemâel.
	
	B_LogEntry (TOPIC_SLDRespekt,"Pravidla souboje: souboj musí zaèít výzvou, aby do nêj již nikdo další nezasahoval. Také pâi nêm nikdo nesmí být zabit.");
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
	description	= "A co ty? Budeš pro mê hlasovat?";
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
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //A co ty? Budeš pro mê hlasovat?
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
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis si myslí, že stojíš na správné stranê.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis si stále není jistý, jestli stojíš na správné stranê.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Nechce, aby nêkdo další tancoval tak, jak Sylvio píská. Když jsme u toho, tak já také ne.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord si myslí, že bys mohl být dost dobrý na to, abychom tê pâijali.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Podle Cordova názoru se budeš muset nejdâív nauèit poâádnê zacházet s meèem, než se budeš moci pâidat.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher âíká, že pro nêj bylo od zaèátku jasné, že by ses k nám mêl pâidat. Vypadá to, že ho nêco vážnê potêšilo.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher âíká, že mu dlužíš laskavost a že víš, o èem je âeè.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod chce jen dostat zpátky svùj meè.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Zdá se, žes Roda pâesvêdèil o tom, že jsi dostateènê silný.
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
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza pro tebe ruku zvedne. Âíká, že ses zachoval velice rozumnê.
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
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul je proti tobê. Myslím, že tê nemùže vystát.
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
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster âíká, že jsi v pohodê.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //I když jsi prohrál.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster âíká, že když tê vyzval, tak jsi vymêkl.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //To nebyl dobrý nápad. Možná bys za ním mêl zajít a vyzvat ho.
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
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Zbytek žoldnéâù neâekl nic.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //Vêtšina z nich èeká, jak si povedeš bêhem zkoušky.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //Vêtšinu z nich jsi pâesvêdèil tím, že jsi prošel zkouškou.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //(ušklíbne se) I když v tom má trochu prsty Cord.
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //I když hodnê z nich âíká, že pâesvêdèit farmáâe, aby zaplatil svùj nájem, bylo na zkoušku moc jednoduché.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //Mùj hlas každopádnê máš.
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
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //A vyhrál jsi nêkolik èestných soubojù.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //To hodnê žoldnéâù respektuje.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //Každopádnê jsi vyhrál nêkolik èestných soubojù.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //geändert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 für Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //Vêtšina žoldnéâù stojí za tebou - co se nás týèe, mùžeš u nás zaèít, kdy se ti zlíbí.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //Bêž za Leem. Vysvêtlí ti všechno potâebné.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Mezi žoldnéâi už jsem si vysloužil dost úcty. Teë bych mêl prohodit pár slov s Leem."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //To je dost, ale poâád to nestaèí.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Budeš se muset s chlapci ještê chvíli prát.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Nemáš to ani zdaleka za sebou, chlapèe. Jestli chceš, abychom tê pâijali mezi sebe, budeš pro to muset udêlat trochu víc.
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
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar nás najal ze dvou dùvodù: chce, abychom od nêj drželi dál domobranu a udržovali poâádek na jeho farmách.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //To zahrnuje vybírání pachtovného, když nebudou chtít drobní farmáâi zaplatit.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //Takže, co to bude?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Nech mê vybrat ten nájem!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Vypoâádám se s domobranou, žádné obavy!", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Dobrá. Poslouchej. Farmáâ Sekob už nêkolik týdnù Onarovi nezaplatil nájem.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar po nêm chce, aby vysolil 50 zlatých. Nêjaké otázky?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Kde je Sekobova farma?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //V severní èásti údolí. Když se díváš odsud, je to napravo u té velké kâižovatky.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Kdybys mêl nêjaké problémy, farmáâi na polích ti pomùžou najít cestu.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof mê požádal, abych od sedláka Sekoba vyinkasoval nájemné, které èiní 50 zlaãákù.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Farmáâ Bengar si stêžoval, že mu domobrana z mêsta v poslední dobê leze na nervy.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Vyvíjejí na toho farmáâe nátlak - nejspíš chtêjí, aby se otoèil k Onarovi zády.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Chci, abys šel na jeho farmu a vyjasnil domobranê, že tady nemají co pohledávat! Otázky?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Jak najdu Bengarovu farmu?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //Na jihozápadê údolí je velké schodištê, které vede na planinu. Tam má Bengar svou farmu.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Kdyby ses ztratil, zeptej se farmáâù na polích, kudy se dát.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof mê povêâil, abych na planinê ze statku sedláka Bengara vyhnal domobranu.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Nech mê vybrat ten nájem!
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
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Trvalo ti to strašnê dlouho. Onar nebude mít radost.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //A je mu jedno, jestli paladiny nêco sežere v Hornickém údolí, nebo ne.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Dobrá práce! Až budu mít nêco dalšího, dám ti vêdêt.
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
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //A? Zaplatil dobrovolnê?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //No, potkal ho smrtelný úraz...
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Nejdâív jsem ho musel pâesvêdèit.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Dobrá práce! Prošel jsi zkouškou. To pâesvêdèí hodnê žoldnéâù o tom, že víš, co se sluší a patâí.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem úkol, který mi svêâil Torlof."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //A? Utratil jsi to snad za chlast? Pâines mi peníze! A hezky zèerstva!
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
	description	= "Postaral jsem se o Bengarùv problém s domobranou.";
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
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Postaral jsem se o Bengarùv problém s domobranou.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Ujistil ses, že nebudou zítra zase stát na jeho zápraží?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //S tím by mêli docela potíže...
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Dobrá práce!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Prošel jsi zkouškou. Když dokážeš zvládnout domobranu, vêtšina tê tady bude uznávat.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem úkol, který mi svêâil Torlof."); 
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
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //Vítej mezi žoldnéâi, chlapèe!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //Díky!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Jakmile pro tebe budu mít nêco na práci, dám ti vêdêt.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Kde jsi byl?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //Byl jsem v Hornickém údolí! Jsou tam draci! Dali paladinùm pêknê zabrat!
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Fakt? Takže na všech têch povídaèkách vážnê nêco je!
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
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Dobâe že jsi tady. Mám pro tebe nêco na práci.
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //O co jde?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //A postarej se o to, aã je to do zítra hotové!
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
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //Mùžeš mi pomoci vylepšit moje schopnosti?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Mohl bych ti ukázat, jak lépe využít svou sílu pâi boji na blízko.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Spousta bojovníkù je strašnê slabá, protože nemají správnou techniku, s jejíž pomocí by správnê využívali svou sílu.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //To samé platí u stâelných zbraní a obratnosti.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof mi pomùže vylepšit obratnost a sílu.");
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
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //Âekl jsem, že bych ti MOHL pomoci, ne že ti POMÙŽU.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Dokud nejsi jedním z nás, musíš si najít nêkoho jiného, kdo by tê uèil!
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

	description	 = 	"Nemáš pro mê nêco na práci?";
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
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Nemáš pro mê nêco na práci?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Vidêls ty chlapíky s èernými kápêmi, co se potulují po okolí? Âeknu ti, bêhá mi z nich mráz po zádech.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Když jsem byl na moâi, vidêl jsem pár vážnê divných vêcí, ale tihle lidi mê vážnê dêsí.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //Šli smêrem k táboru banditù, co je v horách na jižním konci údolí.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Možná by ses tam mêl vydat, zjistit, co jsou zaè, a vypoâádat se s nimi!
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"Pár têch zakuklencù se nejspíš bude skrývat v táboâe banditù v horách jižnê od údolí. Torlofovi poâádnê pijí krev - mám pro nêj tenhle problém vyâešit."); 

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

	description	 = 	"Ti èernokápníci z hor už nejsou mezi námi.";
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
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Ti èernokápníci z hor už nejsou mezi námi.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Dokázal jsi je vyâídit? Frajer!
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Ani za mák jsem têm chlapíkùm nevêâil. Jenom by dêlali trable.
	
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

	description	 = 	"Nêkteâí žoldnéâi odešli?";
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
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //Nêkteâí žoldnéâi odešli?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio sebral pár chlapcù a zmizel s nimi na druhou stranu prùsmyku.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //Povídá se, že se tam objevili draci. Když se to doslechl, nešlo ho zastavit.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Kdo ví? Za draèí trofej by dostal na trhu hromadu penêz.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //To pro mê není. Jsem námoâník. Patâím na moâe, a ne do nêjakého smradlavého draèího doupête.

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
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //Koneènê tê to trklo? Jo, ksakru, jsem námoâník. Proè se ptáš?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Hodily by se mi tvoje schopnosti. Potâebuji se dostat na jeden ostrov.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //(zasmêje se) Na ostrov? Vždyã ani nemáš loë, natož posádku, která by ji âídila.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Ne, chlapèe. Jestli chceš využít mých služeb jako kapitána a uèitele síly, musíš mi nejdâív dokázat, že víš, o èem mluvíš.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Kromê toho mám už tak dost svých vlastních starostí. Paladinové se nestáhli z mêsta, jak jsme oèekávali.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Muselo by se stát nêco opravdu vážného, aby vyklidili pole.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //Bêž do hradu v Hornickém údolí. Ukradni strážím klíè od hlavní brány a otevâi ji. Skâeti se už postarají o zbytek!

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Ještê než Torlof pâijme funkci kapitána, musím pâimêt paladiny, aby opustili mêsto. Když mu pomohu, spoleènê na hradê v Hornickém údolí nastražíme malou lest. Musím strážci ukrást klíè od hlavní brány a otevâít ji, aby do hradu mohli proniknout skâeti. Torlof doufá, že tahle pohroma pâimêje paladiny, aby odešli z mêsta a vydali se na pomoc svým kamarádùm.");
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Brána do hradu v Hornickém údolí je otevâená a zaseknutá. Skâetùm už nic nebrání v tom, aby vzali hrad útokem.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Paladinové utrpêli v bitvê se skâety vážné ztráty.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //Âekl bych, že už nebude trvat dlouho, než se paladinové odsud z mêsta vydají do Hornického údolí, aby dostali své kamarády pryè z hradu.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //To jsou pâíjemné zprávy. Takže už nic nestojí v cestê tomu, abych utekl z tohohle prokletého kraje.
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

	description	 = 	"Teë už mi pomùžeš dostat se na ten ostrov?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Teë už mi pomùžeš dostat se na ten ostrov?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //No jasnê. Chtêl jsi jet na nêjaký ostrov. Hmm. Dám ti jeden návrh.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Zaplatíš mi 2500 zlatých a já se ujmu velení tvé lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Navíc tê budu trénovat v síle a obratnosti, kdykoliv to jen budeš chtít.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "To je strašná spousta penêz.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "Dobrá. Tady máš své peníze.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //To je strašná spousta penêz.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //To jo. Dobrá pomoc je drahá. Nemáš na výbêr. Tady v okolí nenajdeš nikoho dalšího, kdo by velel tvé lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Tak zaplaã a nedêlej vlny.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof je nyní ochoten âídit loë. Bohužel za to ale požaduje 2500 zlaãákù.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //Dobrá. Tady máš své peníze.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //Nádhera. Teë mi jen pâesnê âekni, co po mnê budeš chtít.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Potom, co jsem mu pâedal 2500 zlaãákù, se Torlof koneènê uvolil dopravit mê k cíli.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Snažíš se mê oblbnout pár mincemi? Nejdâív pâines peníze. Pak uvidíme.
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
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //Dobrá. Sežeà mi loë a dostateènê silnou posádku a já tê dostanu na ten tvùj mizerný ostrov.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //Máš námoâní mapy? Bez nich se moc daleko nedostaneme.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //O to se postarám. Setkáme se v pâístavu.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //Jsem vážnê zvêdavý, jak to chceš udêlat.
	
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

	description	 = 	"Vzhùru na ostrov!";
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
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Vzhùru na ostrov!

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Dobrá. Dej mi mapy a mùžeme vyplout.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //(zavolá) Všichni na palubu.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Ujisti se, že máš opravdu všechno, co bys mohl potâebovat. Vracet se nemùžeme.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Jestli si jsi jistý, bêž se natáhnout do kapitánské kajuty. Za chvíli vyrazíme na cestu.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //Žádná loë, žádná posádka, žádná mapa, žádný výlet, pâíteli.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Chci vidêt aspoà pêt chlapù ochotných a schopných plavby.
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
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Rozhodl jsem se pro jiného kapitána. Mùžeš mi hned vrátit mé peníze.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //To by nešlo. Nic takového. Když mi nejdâív zaplatíš a pak nakonec moje služby odmítáš, je to tvùj problém.
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

































































