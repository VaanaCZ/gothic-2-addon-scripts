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
	AI_Output (self, other, "DIA_Torlof_Hallo_01_00"); //(nevrle) Co po mnÏ chceö?
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
	description	= "Chci se p¯idat k ûoldnÈ¯˘m!";
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
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Chci se p¯idat k ûoldnÈ¯˘m!
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Hm? A proË si myslÌö, ûe bych mÏl b˝t pro, abychom tÏ sem p¯ijali?
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
	description	= "Nech mÏ projÌt zkouökou!";
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
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Nech mÏ projÌt zkouökou!
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Poslal tÏ za mnou Lee?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //ÿekl, ûe mi pom˘ûeö.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //(vzdychne si) Fajn. Tak dobr·. Neû se k n·m budeö moct p¯idat, musÌö udÏlat dvÏ vÏci.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Za prvÈ - musÌö prok·zat, ûe budeö schopn˝ zvl·dnout ˙koly, kterÈ budeö jako ûoldnÈ¯ dost·vat. S·m tÏ ozkouöÌm.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //A za druhÈ - musÌö si vyslouûit respekt ostatnÌch ûold·k˘.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Start"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Aby mÏ ûoldnÈ¯i p¯ijali mezi sebe, musÌm podstoupit zkouöku, kterou mi zad· Torlof, a vyslouûit si respekt ostatnÌch.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Ne.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Tak co tady plk·ö?
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
	description	= "Jak si zÌsk·m respekt ostatnÌch ûold·k˘?";
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
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Jak si vyslouûÌm respekt ostatnÌch ûoldnÈ¯˘?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //VÏtöinÏ z nich bude staËit, kdyû splnÌö sv˘j ˙kol a projdeö m˝m testem.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //NÏkterÈ ale budeö muset p¯esvÏdËit jinak a s·m musÌö zjistit jak.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //NÏkte¯Ì budou chtÌt vyuûÌt toho, v jakÈ jsi situaci, jin˝m se prostÏ nebude lÌbit tv˘j ksicht.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //MÏl by ses snaûit najÌt spoleËnou ¯eË s co nejvÌce z nich - ale kdyû nepom˘ûe nic jinÈho, m˘ûeö se vûdycky utkat v souboji.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Kdyû vyhrajeö, zÌsk·ö si u vÏtöiny uzn·nÌ. Dej si ale pozor, abys nÏkoho n·hodou nezabil. V tom p¯ÌpadÏ bys byl v pÏknÈ kaöi.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"SplnÌm-li Torlofovu zkouöku, zÌsk·m si tÌm respekt i u ostatnÌch ûoldnÈ¯˘. TakÈ na nÏ mohu zap˘sobit, pokud nÏkterÈ z nich p¯em˘ûu v souboji.");
	
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
	description	= "Jak· jsou pravidla pro souboj?";
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
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Jak· jsou pravidla pro souboj?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Je to prostÈ. P¯ed prvnÌm ˙derem musejÌ mÌt oba soupe¯i moûnost vytasit zbraÚ.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Nem˘ûeö jen tak nÏkoho propÌchnout bez varov·nÌ.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //MusÌ dojÌt k nÏjakÈ formÏ ˙stnÌ v˝zvy. Ur·ûce, nebo jinÈmu d˘vodu k boji.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //Do takovÈho souboje se nebude nikdo jin˝ mÌchat. Leda ûe by bÏhem nÏj nÏkdo z tÏch dvou zem¯el.
	
	B_LogEntry (TOPIC_SLDRespekt,"Pravidla souboje: souboj musÌ zaËÌt v˝zvou, aby do nÏj jiû nikdo dalöÌ nezasahoval. TakÈ p¯i nÏm nikdo nesmÌ b˝t zabit.");
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
	description	= "A co ty? Budeö pro mÏ hlasovat?";
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
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //A co ty? Budeö pro mÏ hlasovat?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Pokud prok·ûeö, ûe jsi schopn˝ plnit ˙koly ûoldnÈ¯e, tak ano.
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
	description	= "Jak to vypad· s mojÌ reputacÌ mezi ûoldnÈ¯i?";
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
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Jak to vypad· s mojÌ reputacÌ mezi ûoldnÈ¯i?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Tak se na to podÌvejme...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Vlk nem· nic proti tomu, aby ses p¯idal.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis si myslÌ, ûe stojÌö na spr·vnÈ stranÏ.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis si st·le nenÌ jist˝, jestli stojÌö na spr·vnÈ stranÏ.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Nechce, aby nÏkdo dalöÌ tancoval tak, jak Sylvio pÌsk·. Kdyû jsme u toho, tak j· takÈ ne.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord si myslÌ, ûe bys mohl b˝t dost dobr˝ na to, abychom tÏ p¯ijali.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Podle Cordova n·zoru se budeö muset nejd¯Ìv nauËit po¯·dnÏ zach·zet s meËem, neû se budeö moci p¯idat.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher ¯Ìk·, ûe pro nÏj bylo od zaË·tku jasnÈ, ûe by ses k n·m mÏl p¯idat. Vypad· to, ûe ho nÏco v·ûnÏ potÏöilo.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher ¯Ìk·, ûe mu dluûÌö laskavost a ûe vÌö, o Ëem je ¯eË.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod chce jen dostat zp·tky sv˘j meË.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Zd· se, ûes Roda p¯esvÏdËil o tom, ûe jsi dostateËnÏ siln˝.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod si myslÌ, ûe jsi slaboch.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza pro tebe ruku zvedne. ÿÌk·, ûe ses zachoval velice rozumnÏ.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza pro tebe ruku nezvedne. ÿÌk·, ûe mu st·le dluûÌö 50 zlat˝ch.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul je proti tobÏ. MyslÌm, ûe tÏ nem˘ûe vyst·t.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //O Sylviovi a Bullcovi mluvit nemusÌm. Ti dva tupci jsou proti kaûdÈmu.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster ¯Ìk·, ûe jsi v pohodÏ.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //I kdyû jsi prohr·l.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster ¯Ìk·, ûe kdyû tÏ vyzval, tak jsi vymÏkl.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //To nebyl dobr˝ n·pad. Moûn· bys za nÌm mÏl zajÌt a vyzvat ho.
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //A Dar ¯Ìk·, ûe jsi ûvanil. Ale jeho hlas tady moc neznamen·.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Zbytek ûoldnÈ¯˘ ne¯ekl nic.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //VÏtöina z nich Ëek·, jak si povedeö bÏhem zkouöky.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //VÏtöinu z nich jsi p¯esvÏdËil tÌm, ûe jsi proöel zkouökou.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //(uöklÌbne se) I kdyû v tom m· trochu prsty Cord.
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //I kdyû hodnÏ z nich ¯Ìk·, ûe p¯esvÏdËit farm·¯e, aby zaplatil sv˘j n·jem, bylo na zkouöku moc jednoduchÈ.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //M˘j hlas kaûdop·dnÏ m·ö.
		Points_Sld = Points_Sld + 1;
	};
	
	// --------------------
	// ------ Duelle ------
	// --------------------
	if (Sld_Duelle_gewonnen >= 3)//ge‰ndert M.F.
	{
		Points_Sld = Points_Sld + 1;
		
		if (Points_Sld >= 9)//ge‰ndert M.F.
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //A vyhr·l jsi nÏkolik Ëestn˝ch souboj˘.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //To hodnÏ ûoldnÈ¯˘ respektuje.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //Kaûdop·dnÏ jsi vyhr·l nÏkolik Ëestn˝ch souboj˘.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //ge‰ndert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 f¸r Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //VÏtöina ûoldnÈ¯˘ stojÌ za tebou - co se n·s t˝Ëe, m˘ûeö u n·s zaËÌt, kdy se ti zlÌbÌ.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //BÏû za Leem. VysvÏtlÌ ti vöechno pot¯ebnÈ.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Mezi ûoldnÈ¯i uû jsem si vyslouûil dost ˙cty. TeÔ bych mÏl prohodit p·r slov s Leem."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //To je dost, ale po¯·d to nestaËÌ.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Budeö se muset s chlapci jeötÏ chvÌli pr·t.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Nem·ö to ani zdaleka za sebou, chlapËe. Jestli chceö, abychom tÏ p¯ijali mezi sebe, budeö pro to muset udÏlat trochu vÌc.
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
	description	= "JakÈ m·m jako ûoldnÈ¯ povinnosti?";
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
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //JakÈ m·m jako ûoldnÈ¯ povinnosti?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar n·s najal ze dvou d˘vod˘: chce, abychom od nÏj drûeli d·l domobranu a udrûovali po¯·dek na jeho farm·ch.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //To zahrnuje vybÌr·nÌ pachtovnÈho, kdyû nebudou chtÌt drobnÌ farm·¯i zaplatit.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //Takûe, co to bude?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Nech mÏ vybrat ten n·jem!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Vypo¯·d·m se s domobranou, û·dnÈ obavy!", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Dobr·. Poslouchej. Farm·¯ Sekob uû nÏkolik t˝dn˘ Onarovi nezaplatil n·jem.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar po nÏm chce, aby vysolil 50 zlat˝ch. NÏjakÈ ot·zky?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Kde je Sekobova farma?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //V severnÌ Ë·sti ˙dolÌ. Kdyû se dÌv·ö odsud, je to napravo u tÈ velkÈ k¯iûovatky.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Kdybys mÏl nÏjakÈ problÈmy, farm·¯i na polÌch ti pom˘ûou najÌt cestu.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof mÏ poû·dal, abych od sedl·ka Sekoba vyinkasoval n·jemnÈ, kterÈ ËinÌ 50 zlaù·k˘.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Farm·¯ Bengar si stÏûoval, ûe mu domobrana z mÏsta v poslednÌ dobÏ leze na nervy.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //VyvÌjejÌ na toho farm·¯e n·tlak - nejspÌö chtÏjÌ, aby se otoËil k Onarovi z·dy.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Chci, abys öel na jeho farmu a vyjasnil domobranÏ, ûe tady nemajÌ co pohled·vat! Ot·zky?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Jak najdu Bengarovu farmu?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //Na jihoz·padÏ ˙dolÌ je velkÈ schodiötÏ, kterÈ vede na planinu. Tam m· Bengar svou farmu.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Kdyby ses ztratil, zeptej se farm·¯˘ na polÌch, kudy se d·t.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof mÏ povÏ¯il, abych na planinÏ ze statku sedl·ka Bengara vyhnal domobranu.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Nech mÏ vybrat ten n·jem!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Vypo¯·d·m se s domobranou, û·dnÈ obavy!
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
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Trvalo ti to straönÏ dlouho. Onar nebude mÌt radost.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //A je mu jedno, jestli paladiny nÏco seûere v HornickÈm ˙dolÌ, nebo ne.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Dobr· pr·ce! Aû budu mÌt nÏco dalöÌho, d·m ti vÏdÏt.
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
	description	= "Vybral jsem n·jem od Sekoba.";
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
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Vybral jsem n·jem od Sekoba.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //A? Zaplatil dobrovolnÏ?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //No, potkal ho smrteln˝ ˙raz...
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Nejd¯Ìv jsem ho musel p¯esvÏdËit.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Dobr· pr·ce! Proöel jsi zkouökou. To p¯esvÏdËÌ hodnÏ ûoldnÈ¯˘ o tom, ûe vÌö, co se sluöÌ a pat¯Ì.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem ˙kol, kter˝ mi svÏ¯il Torlof."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //A? Utratil jsi to snad za chlast? P¯ines mi penÌze! A hezky zËerstva!
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
	description	= "Postaral jsem se o Bengar˘v problÈm s domobranou.";
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
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Postaral jsem se o Bengar˘v problÈm s domobranou.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Ujistil ses, ûe nebudou zÌtra zase st·t na jeho z·praûÌ?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //S tÌm by mÏli docela potÌûe...
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Dobr· pr·ce!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Proöel jsi zkouökou. Kdyû dok·ûeö zvl·dnout domobranu, vÏtöina tÏ tady bude uzn·vat.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem ˙kol, kter˝ mi svÏ¯il Torlof."); 
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
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //VÌtej mezi ûoldnÈ¯i, chlapËe!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //DÌky!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Jakmile pro tebe budu mÌt nÏco na pr·ci, d·m ti vÏdÏt.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Kde jsi byl?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //Byl jsem v HornickÈm ˙dolÌ! Jsou tam draci! Dali paladin˘m pÏknÏ zabrat!
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Fakt? Takûe na vöech tÏch povÌdaËk·ch v·ûnÏ nÏco je!
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Leeho to bude zajÌmat.
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
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Dob¯e ûe jsi tady. M·m pro tebe nÏco na pr·ci.
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //O co jde?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //A postarej se o to, aù je to do zÌtra hotovÈ!
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
	description = "Pomohl bys mi vylepöit moje schopnosti?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //M˘ûeö mi pomoci vylepöit moje schopnosti?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Mohl bych ti uk·zat, jak lÈpe vyuûÌt svou sÌlu p¯i boji na blÌzko.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Spousta bojovnÌk˘ je straönÏ slab·, protoûe nemajÌ spr·vnou techniku, s jejÌû pomocÌ by spr·vnÏ vyuûÌvali svou sÌlu.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //To samÈ platÌ u st¯eln˝ch zbranÌ a obratnosti.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof mi pom˘ûe vylepöit obratnost a sÌlu.");
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
	description = "Chci si vylepöit schopnosti!";
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
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Chci si vylepöit schopnosti!
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
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //ÿekl jsem, ûe bych ti MOHL pomoci, ne ûe ti POMŸéU.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Dokud nejsi jednÌm z n·s, musÌö si najÌt nÏkoho jinÈho, kdo by tÏ uËil!
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //Dobr·! NynÌ dok·ûeö pouûÌvat svoje schopnosti lÈpe!
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

	description	 = 	"Nem·ö pro mÏ nÏco na pr·ci?";
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
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Nem·ö pro mÏ nÏco na pr·ci?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //VidÏls ty chlapÌky s Ëern˝mi k·pÏmi, co se potulujÌ po okolÌ? ÿeknu ti, bÏh· mi z nich mr·z po z·dech.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Kdyû jsem byl na mo¯i, vidÏl jsem p·r v·ûnÏ divn˝ch vÏcÌ, ale tihle lidi mÏ v·ûnÏ dÏsÌ.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //äli smÏrem k t·boru bandit˘, co je v hor·ch na jiûnÌm konci ˙dolÌ.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Moûn· by ses tam mÏl vydat, zjistit, co jsou zaË, a vypo¯·dat se s nimi!
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"P·r tÏch zakuklenc˘ se nejspÌö bude skr˝vat v t·bo¯e bandit˘ v hor·ch jiûnÏ od ˙dolÌ. Torlofovi po¯·dnÏ pijÌ krev - m·m pro nÏj tenhle problÈm vy¯eöit."); 

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

	description	 = 	"Ti Ëernok·pnÌci z hor uû nejsou mezi n·mi.";
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
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Ti Ëernok·pnÌci z hor uû nejsou mezi n·mi.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Dok·zal jsi je vy¯Ìdit? Frajer!
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Ani za m·k jsem tÏm chlapÌk˘m nevÏ¯il. Jenom by dÏlali trable.
	
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

	description	 = 	"NÏkte¯Ì ûoldnÈ¯i odeöli?";
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
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //NÏkte¯Ì ûoldnÈ¯i odeöli?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio sebral p·r chlapc˘ a zmizel s nimi na druhou stranu pr˘smyku.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //PovÌd· se, ûe se tam objevili draci. Kdyû se to doslechl, neölo ho zastavit.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Kdo vÌ? Za draËÌ trofej by dostal na trhu hromadu penÏz.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //To pro mÏ nenÌ. Jsem n·mo¯nÌk. Pat¯Ìm na mo¯e, a ne do nÏjakÈho smradlavÈho draËÌho doupÏte.

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

	description	 = 	"Ty jsi n·mo¯nÌk?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //Ty jsi n·mo¯nÌk?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //KoneËnÏ tÏ to trklo? Jo, ksakru, jsem n·mo¯nÌk. ProË se pt·ö?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Hodily by se mi tvoje schopnosti. Pot¯ebuji se dostat na jeden ostrov.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //(zasmÏje se) Na ostrov? Vûdyù ani nem·ö loÔ, natoû pos·dku, kter· by ji ¯Ìdila.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Ne, chlapËe. Jestli chceö vyuûÌt m˝ch sluûeb jako kapit·na a uËitele sÌly, musÌö mi nejd¯Ìv dok·zat, ûe vÌö, o Ëem mluvÌö.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //KromÏ toho m·m uû tak dost sv˝ch vlastnÌch starostÌ. PaladinovÈ se nest·hli z mÏsta, jak jsme oËek·vali.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Muselo by se st·t nÏco opravdu v·ûnÈho, aby vyklidili pole.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //BÏû do hradu v HornickÈm ˙dolÌ. Ukradni str·ûÌm klÌË od hlavnÌ br·ny a otev¯i ji. Sk¯eti se uû postarajÌ o zbytek!

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"JeötÏ neû Torlof p¯ijme funkci kapit·na, musÌm p¯imÏt paladiny, aby opustili mÏsto. Kdyû mu pomohu, spoleËnÏ na hradÏ v HornickÈm ˙dolÌ nastraûÌme malou lest. MusÌm str·ûci ukr·st klÌË od hlavnÌ br·ny a otev¯Ìt ji, aby do hradu mohli proniknout sk¯eti. Torlof douf·, ûe tahle pohroma p¯imÏje paladiny, aby odeöli z mÏsta a vydali se na pomoc sv˝m kamar·d˘m.");
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

	description	 = 	"Br·na od hradu v HornickÈm ˙dolÌ je otev¯ena...";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Br·na do hradu v HornickÈm ˙dolÌ je otev¯en· a zaseknut·. Sk¯et˘m uû nic nebr·nÌ v tom, aby vzali hrad ˙tokem.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //PaladinovÈ utrpÏli v bitvÏ se sk¯ety v·ûnÈ ztr·ty.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //ÿekl bych, ûe uû nebude trvat dlouho, neû se paladinovÈ odsud z mÏsta vydajÌ do HornickÈho ˙dolÌ, aby dostali svÈ kamar·dy pryË z hradu.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //To jsou p¯ÌjemnÈ zpr·vy. Takûe uû nic nestojÌ v cestÏ tomu, abych utekl z tohohle prokletÈho kraje.
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

	description	 = 	"TeÔ uû mi pom˘ûeö dostat se na ten ostrov?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //TeÔ uû mi pom˘ûeö dostat se na ten ostrov?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //No jasnÏ. ChtÏl jsi jet na nÏjak˝ ostrov. Hmm. D·m ti jeden n·vrh.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //ZaplatÌö mi 2500 zlat˝ch a j· se ujmu velenÌ tvÈ lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //NavÌc tÏ budu trÈnovat v sÌle a obratnosti, kdykoliv to jen budeö chtÌt.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "To je straön· spousta penÏz.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "Dobr·. Tady m·ö svÈ penÌze.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //To je straön· spousta penÏz.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //To jo. Dobr· pomoc je drah·. Nem·ö na v˝bÏr. Tady v okolÌ nenajdeö nikoho dalöÌho, kdo by velel tvÈ lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Tak zaplaù a nedÏlej vlny.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof je nynÌ ochoten ¯Ìdit loÔ. Bohuûel za to ale poûaduje 2500 zlaù·k˘.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //Dobr·. Tady m·ö svÈ penÌze.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //N·dhera. TeÔ mi jen p¯esnÏ ¯ekni, co po mnÏ budeö chtÌt.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Potom, co jsem mu p¯edal 2500 zlaù·k˘, se Torlof koneËnÏ uvolil dopravit mÏ k cÌli.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //SnaûÌö se mÏ oblbnout p·r mincemi? Nejd¯Ìv p¯ines penÌze. Pak uvidÌme.
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

	description	 = 	"BuÔ m˝m kapit·nem.";
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
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //BuÔ m˝m kapit·nem.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //Dobr·. SeûeÚ mi loÔ a dostateËnÏ silnou pos·dku a j· tÏ dostanu na ten tv˘j mizern˝ ostrov.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //M·ö n·mo¯nÌ mapy? Bez nich se moc daleko nedostaneme.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //O to se postar·m. Setk·me se v p¯Ìstavu.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //Jsem v·ûnÏ zvÏdav˝, jak to chceö udÏlat.
	
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

	description	 = 	"Vzh˘ru na ostrov!";
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
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Vzh˘ru na ostrov!

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Dobr·. Dej mi mapy a m˘ûeme vyplout.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //(zavol·) Vöichni na palubu.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Ujisti se, ûe m·ö opravdu vöechno, co bys mohl pot¯ebovat. Vracet se nem˘ûeme.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Jestli si jsi jist˝, bÏû se nat·hnout do kapit·nskÈ kajuty. Za chvÌli vyrazÌme na cestu.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //é·dn· loÔ, û·dn· pos·dka, û·dn· mapa, û·dn˝ v˝let, p¯Ìteli.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Chci vidÏt aspoÚ pÏt chlap˘ ochotn˝ch a schopn˝ch plavby.
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

	description	 = 	"Rozhodl jsem se pro jinÈho kapit·na.";
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
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Rozhodl jsem se pro jinÈho kapit·na. M˘ûeö mi hned vr·tit mÈ penÌze.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //To by neölo. Nic takovÈho. Kdyû mi nejd¯Ìv zaplatÌö a pak nakonec moje sluûby odmÌt·ö, je to tv˘j problÈm.
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

































































