// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Harad_EXIT   (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 999;
	condition   = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Harad_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *****************************************************
// 							Hallo
// *****************************************************
instance DIA_Harad_Hallo		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 2;
	condition	= DIA_Harad_Hallo_Condition;
	information	= DIA_Harad_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
func int DIA_Harad_Hallo_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Harad_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Harad_Hallo_12_00"); //(nevrle) Co chceö?
};

// *****************************************************
// 							Arbeit
// *****************************************************
instance DIA_Harad_Arbeit		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Arbeit_Condition;
	information	= DIA_Harad_Arbeit_Info;
	permanent   = FALSE;
	description = "Hled·m pr·ci.";
};
func int DIA_Harad_Arbeit_Condition ()
{
	return TRUE;
};
func void DIA_Harad_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Harad_Arbeit_15_00"); //Hled·m pr·ci!
	AI_Output (self, other, "DIA_Harad_Arbeit_12_01"); //Hm - hodil by se mi nov˝ uËednÌk.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_02"); //Brian brzy dokonËÌ svÈ uËenÌ a potom opustÌ mÏsto.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_03"); //UmÌö nÏco?
	AI_Output (other, self, "DIA_Harad_Arbeit_15_04"); //Jestli m·ö na mysli kov·¯stvÌ...
	AI_Output (self, other, "DIA_Harad_Arbeit_12_05"); //Ne, to jsem zrovna nemyslel.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_06"); //D¯Ìv nebo pozdÏji sk¯eti celÈ tohle mÏsto obklÌËÌ a pak budou nÏco platnÌ pouze ti, kte¯Ì je dok·ûÌ ubr·nit.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Harad_Arbeit_12_07"); //A j· si do uËenÌ nevezmu û·dnÈho budiûkniËemu, kter˝ p¯i prvnÌ zn·mce potÌûÌ uteËe z mÏsta se ûenami a ostatnÌmi poseroutky, mÌsto aby z˘stal tady a br·nil pevnost.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Pokud se mi poda¯Ì p¯esvÏdËit Harada, ûe nejsem û·dn˝ budiûkniËemu, p¯ijme mÏ za svÈho uËnÏ.");
};

// *****************************************************
// 						MIS_Orc
// *****************************************************
instance DIA_Harad_Taugenichts (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Taugenichts_Condition;
	information	= DIA_Harad_Taugenichts_Info;
	permanent   = FALSE;
	description = "J· nejsem û·dn˝ budiûkniËemu!";
};
func int DIA_Harad_Taugenichts_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};
func void DIA_Harad_Taugenichts_Info ()
{
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_00"); //J· nejsem û·dn˝ budiûkniËemu!
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_01"); //To jsou siln· slova! M˘ûeö to ale podloûit i nÏjak˝mi skutky?
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_02"); //A to jak˝mi?
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_03"); //P¯ines mi nÏjakou sk¯etÌ zbraÚ.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_04"); //Sk¯eti uû byli zpozorov·ni p¯Ìmo u mÏsta, takûe s trochou ötÏstÌ nebudeö hledat dlouho.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_05"); //Jestli se ti povede nÏjakÈho skolit, tak tÏ p¯ijmu do uËenÌ.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_06"); //Pokud s tÌm tedy budou souhlasit i ostatnÌ mist¯i.
	
	MIS_Harad_Orc = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HaradOrk,LOG_RUNNING);
	B_LogEntry (TOPIC_HaradOrk,"Za mÏstem se usadil sk¯et, kterÈho m·m na prosbu kov·¯e Harada zabÌt. Jako d˘kaz mu postaËÌ jak·koliv sk¯etÌ zbraÚ.");
};

// *****************************************************
// 						Orc Running
// *****************************************************
instance DIA_Harad_OrcRunning (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcRunning_Condition;
	information	= DIA_Harad_OrcRunning_Info;
	permanent   = FALSE;
	description = "Promluvme si jeötÏ o tÈ sk¯etÌ z·leûitosti...";
};
func int DIA_Harad_OrcRunning_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	&& (Harad_HakonMission == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Harad_OrcRunning_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_15_00"); //Promluvme si jeötÏ o tÈ sk¯etÌ z·leûitosti...
	AI_Output (self, other, "DIA_Harad_OrcRunning_12_01"); //(stroze) Co?
	
	Info_ClearChoices (DIA_Harad_OrcRunning);	
	Info_AddChoice (DIA_Harad_OrcRunning, "Ten tv˘j sk¯et uû je teÔ mrtv˝!", DIA_Harad_OrcRunning_Done);
	Info_AddChoice (DIA_Harad_OrcRunning, "Sk¯et je zatracenÏ tuh˝ protivnÌk...", DIA_Harad_OrcRunning_TooHard);

	//AI_Output (self, other, "DIA_Harad_OrcRunning_12_02"); //Ah, ich verstehe schon. Du hast Wichtigeres zu tun. Schon in Ordnung, die Sache hat sich erledigt.
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_00"); //Ale sk¯et je zatracenÏ tuh˝ protivnÌk.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_01"); //Hm - jak tak na tebe kouk·m, moûn· m·ö pravdu. Jsi fakt docela vyûle, ale to se m˘ûe zmÏnit.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_02"); //StejnÏ mi musÌö dok·zat, ûe se nebojÌö bojovat.
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_03"); //Takûe by to mohlo b˝t nÏco menöÌho?
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_04"); //Hm - (p¯em˝ölÌ) Hakon, co na trûiöti obchoduje se zbranÏmi, se mi svÏ¯il, ûe ho p¯ed p·r dny p¯epadli banditi.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_05"); //Pr˝ se potulujÌ nÏkde za jiûnÌ branou.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_06"); //Ti zbabÏlÌ lupiËi nejspÌö moc rozumu nepobrali.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_07"); //Tak je vöechny pochytej - aû do poslednÌho! Tak mi dok·ûeö, ûe n·m tady ve mÏstÏ snad p¯ece jen budeö nÏco platn˝.
	
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	
	if (MIS_HakonBandits != LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Lehrling, "Harad mi ¯ekl, ûe nÏjacÌ banditÈ okradli za mÏstem kupce Hakona. Jestli se mi je poda¯Ì dostihnout, p¯esvÏdËÌm ho, ûe za nÏco stojÌm. MÏl bych si tedy promluvit s Hakonem - snad bude spÌö vÏdÏt, kde se ti banditÈ potloukajÌ.");
	}
	else
	{
		B_LogEntry (TOPIC_Lehrling, "Harad mi ¯ekl, ûe nÏjacÌ banditÈ okradli za mÏstem kupce Hakona. Jestli se mi je poda¯Ì dostihnout, p¯esvÏdËÌm ho, ûe za nÏco stojÌm.");
	};
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_Done_15_00"); //Jako by ten sk¯et byl uû teÔ mrtv˝!
	AI_Output (self, other, "DIA_Harad_OrcRunning_Done_12_01"); //Dob¯e! Tak teÔ p¯estaÚ pl˝tvat dechem a koukej, aù za tebe mluvÌ Ëiny!
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

// *****************************************************
// 						Orc Success
// *****************************************************
instance DIA_Harad_OrcSuccess (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcSuccess_Condition;
	information	= DIA_Harad_OrcSuccess_Info;
	permanent   = FALSE;
	description = "ZÌskal jsem tu sk¯etÌ zbraÚ, jak jsi chtÏl.";
};
func int DIA_Harad_OrcSuccess_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	{
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_OrcSuccess_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcSuccess_15_00"); //ZÌskal jsem tu sk¯etÌ zbraÚ, jak jsi chtÏl.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_01"); //Ukaû...
	
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_01, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_02, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_03, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_04, 1);
		}
		else //if (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcSword_01, 1);
		};
	
	if (Harad_HakonMission == TRUE)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_02"); //Tak tys to PÿECE dok·zal! Tos tedy fakt dobr˝!
	};
	
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_03"); //Takovou zbraÚ uû jsem nemÏl v ruce, ani nepamatuju - naposledy, kdyû jsem slouûil jako voj·k ve sk¯etÌ v·lce.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_04"); //To byly kruönÈ Ëasy, to ti povÌm.
	
	if (Player_IsApprentice == APP_Harad)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_05"); //J· vÏdÏl, ûe udÏl·m dob¯e, kdyû tÏ p¯ijmu do uËenÌ. SkvÏl· pr·ce!
	}
	else if (Player_IsApprentice == APP_NONE) 
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_06"); //NevÏ¯il jsem, ûe to zvl·dneö. Je to obdivuhodnÈ.
	}
	else //anderer Weg
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_07"); //äkoda ûe ses rozhodl pro jinou dr·hu.
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_08"); //Opravdu bych tu pro tebe naöel uplatnÏnÌ.
	};
	
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP (XP_Harad_Orc);
	B_LogEntry (Topic_Lehrling,"Harad mÏ p¯ijme jako svÈho uËednÌka, pokud s tÌm budou souhlasit i ostatnÌ mist¯i.");
};

// *****************************************************
// 						LEHRLING	(PERM)
// *****************************************************
var int Harad_StartGuild;
// ----------------------

instance DIA_Harad_LEHRLING (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_LEHRLING_Condition;
	information	= DIA_Harad_LEHRLING_Info;
	permanent   = TRUE;
	description = "Kdy m˘ûu jako tv˘j uËednÌk zaËÌt?";
};
func int DIA_Harad_LEHRLING_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Harad_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Harad_LEHRLING_15_00"); //Kdy m˘ûu jako tv˘j uËednÌk zaËÌt?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		// ------ Harad ------
		if (MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_01"); //Chlap, kter˝ dok·ûe skolit sk¯eta, se n·m opravdu hodÌ.
			
			if (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_02"); //Krom toho se mi Hakon pochlubil, jak stateËnÏ ses vypo¯·dal s bandity. To tÏ ölechtÌ!
			};
		}
		else //HakonBandits SUCCESS
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_03"); //Sice jsi nezabil û·dnÈho sk¯eta, ale Hakon se chlubil, jak skvÏle ses vypo¯·dal s bandity. To tÏ ölechtÌ!
		};
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_04"); //Co se mÏ t˝Ëe, m˘ûeö zaËÌt t¯eba hned.
				
		stimmen = stimmen + 1;
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_05"); //A co se t˝Ëe ostatnÌch mistr˘...
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_06"); //Thorben ti dal svÈ poûehn·nÌ.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_07"); //Star˝ dobr˝ Thorben by byl r·d, kdyby sis nap¯ed vyprosil boûÌ poûehn·nÌ. MyslÌm, ûe to je dobr˝ n·pad.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_08"); //Thorben pr˝ s tebou jeötÏ nemluvil.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_09"); //Bosper se mi to snaûil vymluvit - chce tÏ totiû za uËednÌka s·m.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_10"); //MÏl jsem s nÌm na tohle tÈma kr·tkou, ale ostrou diskusi.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_11"); //Nakonec souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_12"); //Poû·dal mÏ, zda bych mu nedovolil, aby ti mohl svou profesi aspoÚ p¯edstavit.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_13"); //Takûe si to omrkni - potom se m˘ûeö vûdycky rozhodnout. Tedy leda ûe bys nechtÏl jeho hlas, samoz¯ejmÏ.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_14"); //A Bosper tÏ zatÌm v˘bec nezn·.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_15"); //Constantinovi je jako vûdycky vöecko jedno. Co se jeho t˝Ëe, tak pr˝ m˘ûeö zaËÌt, u koho chceö.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_16"); //Constantino tvrdÌ, ûes tady ve mÏstÏ sp·chal nÏjak˝ zloËin - je to pravda?
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_17"); //Jestli jo, tak bys to mÏl jÌt okamûitÏ napravit!
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_18"); //Constantino o tobÏ jeötÏ v˘bec neslyöel.
		};
		
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_19"); //A Matteo hl·sÌ, ûes mu vr·til jeho zlato. Zd· se, ûe jsi opravdu Ëestn˝ muû.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_20"); //A Matteo tvrdÌ, ûe mu jeötÏ po¯·d nÏco dluûÌö. NevÌm, co mezi sebou m·te, ale mÏl bys to d·t rychle do po¯·dku.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_21"); //A Matteo pr˝ s tebou na tohle tÈma jeötÏ v˘bec nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_22"); //A Matteo tÏ pr˝ ve svÈm kr·mku jeötÏ nevidÏl.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_23"); //To znamen·, ûes zÌskal doporuËenÌ ode vöech mistr˘!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_24"); //To znamen·, ûes zÌskal doporuËenÌ od Ëty¯ mistr˘. Coû pro p¯ijetÌ do uËenÌ staËÌ.
			};
			
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_25"); //Chceö tedy vstoupit do uËenÌ ke mnÏ?
			
			Info_ClearChoices (DIA_Harad_LEHRLING);
			Info_AddChoice (DIA_Harad_LEHRLING, "Dob¯e - rozmyslÌm si to.", DIA_Harad_LEHRLING_Later);
			Info_AddChoice (DIA_Harad_LEHRLING, "Jdu do toho!", DIA_Harad_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_26"); //Pot¯ebujeö doporuËenÌ alespoÚ od Ëty¯ mistr˘, jinak tÏ nikdo v dolnÌ Ë·sti mÏsta do uËenÌ nep¯ijme.
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_27"); //MÏl by sis proto promluvit se vöemi, kterÈ jsi jeötÏ nep¯esvÏdËil.
		};
	}
	else //Mission nicht erf¸llt
	{
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_28"); //Dokud mi nedok·ûeö, ûe nejsi ˙pln˝ budiûkniËemu, nem·ö öanci.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_00"); //Jdu do toho!
	AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_01"); //V˝bornÏ! A teÔ tÏ nauËÌm, jak vykovat pÏkn˝ meË.
	
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_02"); //To uû umÌm!
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_03"); //No tak tÌm lÌp!
	};
	
	if (other.attribute[ATR_STRENGTH] < (T_MED-30))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_04"); //Krom toho bys mÏl taky trochu posilovat. Vûdyù se mi ˙plnÏ ztr·cÌö p¯ed oËima!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Harad_StartGuild = other.guild;
	
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("schmied", GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry (Topic_Bonus,"Harad mÏ p¯ijal za uËednÌka. NynÌ m·m p¯Ìstup i do hornÌ Ëtvrti.");
	B_LogEntry (Topic_Bonus,"Harad za dobrou cenu odkoupÌ zbranÏ, kterÈ vykov·m.");
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_CityTeacher, "Harad mÏ vyuËÌ kov·¯skÈmu umÏnÌ a takÈ se s jeho pomocÌ mohu st·t silnÏjöÌm.");
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_Later_15_00"); //Dob¯e - rozmyslÌm si to.
	if (!Npc_IsDead (Brian))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_Later_12_01"); //é·dn˝ spÏch, Brian tu jeötÏ nÏjakou dobu z˘stane.
	};
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

// *****************************************************
// 						Zustimmung
// *****************************************************
instance DIA_Harad_Zustimmung		(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  2;
	condition	 = 	DIA_Harad_Zustimmung_Condition;
	information	 = 	DIA_Harad_Zustimmung_Info;
	permanent    =  TRUE;
	description	 = 	"Mohu se zapsat do uËenÌ k nÏkterÈmu z ostatnÌch mistr˘?";
};

func int DIA_Harad_Zustimmung_Condition ()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

//------------------------------------
var int DIA_Harad_Zustimmung_Permanent;
//------------------------------------

func void DIA_Harad_Zustimmung_Info ()
{
	AI_Output (other, self, "DIA_Harad_Zustimmung_15_00"); //Mohu se zapsat do uËenÌ k nÏkterÈmu z ostatnÌch mistr˘?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_01"); //Jsi dobr˝ ËlovÏk.
		if (MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_02"); //Hakon mi lÌËil, jak ses vypo¯·dal s bandity.
		};
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_03"); //D·m ti svÈ doporuËenÌ.
		
		if (DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP (XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry (Topic_Lehrling,"Harad mÏ doporuËÌ, pokud se budu chtÌt st·t uËednÌkem nÏkde jinde.");
		
		if (!Npc_IsDead(Brian))
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_04"); //Brian tu jeötÏ nÏjakou dobu pobude. A Ëasem jistÏ najdu jinÈho sil·ka, kter˝ ho zastoupÌ.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_05"); //OstatnÌ mist¯i ti svÈ svolenÌ klidnÏ d·t mohou, ale j· tÏ nedoporuËÌm, dokud mÏ nep¯esvÏdËÌö, ûe nejsi jenom neschopnÈ jelito!
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Harad_MILKommentar;
	var int Harad_PALKommentar;
	var int Harad_INNOSKommentar;
// ----------------------------------

instance DIA_Harad_AlsLehrling (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 1;
	condition   = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Harad_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Harad)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Harad_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Harad_StartGuild != GIL_MIL)
	&& (Harad_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_00"); //Takûe tys vstoupil do ¯ad domobrany? Jsem na tebe hrd˝!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_01"); //BÏhem sluûby v arm·dÏ nejspÌö nebudeö moci z·roveÚ plnit svÈ uËednickÈ povinnosti. Ani to od tebe neËek·m.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_02"); //Ale kdyû budeö nÏco pot¯ebovat, klidnÏ p¯ijÔ.
		Harad_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Harad_StartGuild != GIL_PAL)
	&& (Harad_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_03"); //Kouk·m, ûe ses dok·zal dostat mezi paladiny!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_04"); //Jsem r·d, ûe jsem tÏ p¯ijal do uËenÌ. I kdyû jsi za kovadlinou zrovna moc Ëasu nestr·vil.
		
		Harad_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Harad_StartGuild != GIL_NOV)
	&& (Harad_StartGuild != GIL_KDF)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_05"); //Takûe tys vstoupil do kl·ötera. J· osobnÏ bych byl radöi, kdybys z˘stal ve mÏstÏ. Pot¯ebujeme kaûdÈho muûe.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_06"); //Ale kdyû tÏ Innos povolal, asi to tak m· b˝t.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_07"); //Kdyû budeö nÏco pot¯ebovat, jsem ti vûdycky k dispozici.
		Harad_INNOSKommentar = TRUE;
	}
	
	else if (Harad_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Harad_MILKommentar == FALSE)
	&& (Harad_PALKommentar == FALSE)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_08"); //Uû ses tu hezkou dobu neuk·zal. Kdepak ses toulal, co?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_09"); //Tak tÏ tu m·me zas.
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

// *****************************************************
// 					Verkaufst du Waffen?
// *****************************************************
instance DIA_Harad_Waffen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Waffen_Condition;
	information	 = 	DIA_Harad_Waffen_Info;
	permanent    =  FALSE;
	description	 = 	"Prod·v·ö takÈ zbranÏ?";
};
func int DIA_Harad_Waffen_Condition ()
{	
	if (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Harad_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Waffen_15_00"); //Prod·v·ö takÈ zbranÏ?
	AI_Output (self, other, "DIA_Harad_Waffen_12_01"); //Na to zapomeÚ. Vöechno, co vyrobÌm, si berou paladinovÈ nebo domobrana.
	AI_Output (self ,other, "DIA_Harad_Add_12_00"); //Od lorda Hagena jsem dostal zak·zku na 100 meË˘ - chce s nimi vybavit mÏstskou str·û.
};

// *****************************************************
// 					Aufgaben als Lehrling
// *****************************************************
instance DIA_Harad_Aufgaben	(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  1;
	condition	 = 	DIA_Harad_Aufgaben_Condition;
	information	 = 	DIA_Harad_Aufgaben_Info;
	permanent    =  FALSE;
	description	 = 	"JakÈ m·m jako uËednÌk povinnosti?";
};

func int DIA_Harad_Aufgaben_Condition ()
{	
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};
func void DIA_Harad_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_00"); //JakÈ m·m jako uËednÌk povinnosti?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_01"); //Celkem t¯i.
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_02"); //Kovat, kovat a kovat.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_03"); //Nejsi tak hloup˝, jak vypad·ö. Za kaûd˝ meË ti zaplatÌm - takûe kdyû se budeö fl·kat, û·dnÈ penÌzky se neposypou. Jak prostÈ.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_05"); //Krom toho tÏ m˘ûu nauËit, jak vyrobit prost˝ meË.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_06"); //MagickÈ meËe mohou vyr·bÏt pouze zkuöenÌ kov·¯i - a k tomu m·ö jeötÏ hodnÏ daleko.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_07"); //Jestli pot¯ebujeö nocleh, m˘ûeö se uloûit nÏkde v mÈm domÏ. Uû je ti vöechno jasnÈ?
};

// ************************************************************
// 						Klingen verkaufen
// ************************************************************
instance DIA_Harad_SellBlades (C_INFO)
{
	npc			 = VLK_412_Harad;
	nr			 = 200;
	condition	 = DIA_Harad_SellBlades_Condition;
	information	 = DIA_Harad_SellBlades_Info;
	permanent    = TRUE;
	description	 = "ChtÏl bych prodat zbranÏ, co jsem vykoval.";
};
func int DIA_Harad_SellBlades_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};
func void DIA_Harad_SellBlades_Info ()
{
	AI_Output (other, self, "DIA_Harad_SellBlades_15_00"); //ChtÏl bych prodat zbranÏ, co jsem vykoval.
	
	var C_ITEM equipWeap; equipWeap = Npc_GetEquippedMeleeWeapon(other);
	
	var int anzahl_common; anzahl_common = Npc_HasItems (other, ItMw_1H_Common_01);
	if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE) { anzahl_common = anzahl_common - 1; };
	var int anzahl_schwert1; anzahl_schwert1 = Npc_HasItems (other, ItMw_Schwert1);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) { anzahl_schwert1 = anzahl_schwert1 - 1; };
	var int anzahl_schwert4; anzahl_schwert4 = Npc_HasItems (other, ItMw_Schwert4);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE) { anzahl_schwert4 = anzahl_schwert4 - 1; };
	var int anzahl_rubinklinge; anzahl_rubinklinge = Npc_HasItems (other, ItMw_Rubinklinge);
	if (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE) { anzahl_rubinklinge = anzahl_rubinklinge - 1; };
	var int anzahl_elbastardo; anzahl_elbastardo = Npc_HasItems (other, ItMw_ElBastardo);
	if (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE) { anzahl_elbastardo = anzahl_elbastardo - 1; };
	
	var int gesamt; gesamt = (anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo);
	
    if (gesamt == 0)
	{
		if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) 
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE)  
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_01"); //Jedinou, kterou bych mohl p¯ijmout, m·ö zrovna p¯ipnutou u pasu, a tu si radöi nechej.
		}
		else
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_04"); //Tak nÏjakÈ vykovej! P¯ijÌm·m pouze prostÈ meËe.
		};
	}
	else //(gesamt >= 1) - die verbeliebenden Klingen verkaufen ------
	{
		AI_Output (self, other, "DIA_Harad_SellBlades_12_02"); //Prima - dej to sem.
		
		Npc_RemoveInvItems (other, ItMw_1H_Common_01, anzahl_common);
		Npc_RemoveInvItems (other, ItMw_Schwert1, anzahl_Schwert1);
		Npc_RemoveInvItems (other, ItMw_Schwert4, anzahl_Schwert4);
		Npc_RemoveInvItems (other, ItMw_Rubinklinge, anzahl_Rubinklinge);
		Npc_RemoveInvItems (other, ItMw_ElBastardo, anzahl_ElBastardo);
		
				var string concatText;
				concatText = ConcatStrings(IntToString(gesamt), PRINT_ItemsGegeben);		// "x Gegenst‰nde gegeben"
				AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
				
		AI_Output (self, other, "DIA_Harad_SellBlades_12_03"); //Tak, a tady m·ö v˝platu.
		var int lohn;
		lohn 	= (anzahl_common * Value_Common1)
				+ (anzahl_schwert1 * Value_Schwert1)
				+ (anzahl_schwert4 * Value_Schwert4)
				+ (anzahl_rubinklinge * Value_Rubinklinge)
				+ (anzahl_elbastardo * Value_ElBastardo);
				
		lohn 	= (lohn / 3);
		
		B_GiveInvItems (self, other, itmi_gold, lohn);
	};
};
	
// ************************************************************
// 						Weapon_Common Lehrer
// ************************************************************
func void B_Harad_TeachSmith()
{
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_01"); //Je to docela snadnÈ, hochu. StaËÌ mÌt kousek surovÈ oceli a podrûet ji v ohni, dokud nezËerven·.
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_02"); //Pak Ëepel na kovadlinÏ n·leûitÏ vyklepeö.
};
// ------------------------------------------------------------
func void B_HaradSmithChoices()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
	Info_AddChoice	(DIA_Harad_TeachSmith, DIALOG_BACK, DIA_Harad_TeachSmith_BACK);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_04))		,DIA_Harad_TeachSmith_Harad04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_03))		,DIA_Harad_TeachSmith_Harad03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_02))		,DIA_Harad_TeachSmith_Harad02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_01))		,DIA_Harad_TeachSmith_Harad01);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice	(DIA_Harad_TeachSmith, B_BuildLearnString("NauËit se kov·¯stvÌ"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Harad_TeachSmith_Common);
	};
};
// ------------------------------------------------------------
instance DIA_Harad_TeachSmith (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  50;
	condition	 = 	DIA_Harad_TeachSmith_Condition;
	information	 = 	DIA_Harad_TeachSmith_Info;
	permanent    =  TRUE;
	description	 = 	"NauË mÏ vykovat prost˝ meË!";
};

func int DIA_Harad_TeachSmith_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Harad_TeachCommon_15_00"); //NauË mÏ vykovat prost˝ meË!
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
};
func void DIA_Harad_TeachSmith_Common()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_Common)
	{
		B_Harad_TeachSmith();
		AI_Output (self, other, "DIA_Harad_TeachCommon_12_03"); //NapoprvÈ to asi nebude û·dn˝ z·zrak, ale vöechno ostatnÌ se Ëasem taky nauËÌö.
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad01()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_01)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad02()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_02)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad03()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_03)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad04()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_04)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};

// ************************************************************
// 							STR Lehrer bis 50
// ************************************************************
// -------------------------
	var int Harad_Merke_STR;
// -------------------------	

INSTANCE DIA_Harad_TeachSTR (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 100;
	condition	= DIA_Harad_TeachSTR_Condition;
	information	= DIA_Harad_TeachSTR_Info;
	permanent	= 1;
	description = "Chci se st·t silnÏjöÌm!";
};                       

FUNC INT DIA_Harad_TeachSTR_Condition()
{
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Harad_TeachSTR_Info()
{	
	AI_Output (other, self, "DIA_Harad_TeachSTR_15_00"); //Chci se st·t silnÏjöÌm!
	
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if (Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_01"); //Uû jsi zase o nÏco svalnatÏjöÌ.
	};

	if (other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_02"); //Vraù se, aû se budeö chtÌt dozvÏdÏt vÌc.
	};
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};

// ------ 5 St‰rke ------
func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};




//############################
//##						##
//##		Kapitel 2		##
//##						##
//############################

// *****************************************************
// 					Immer noch
// *****************************************************
instance DIA_Harad_ImmerNoch (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_ImmerNoch_Condition;
	information	 = 	DIA_Harad_ImmerNoch_Info;
	permanent    =  FALSE;
	description	 = 	"JeötÏ po¯·d pracujeö pro paladiny?";
};
func int DIA_Harad_ImmerNoch_Condition ()
{	
	if (Kapitel >= 2)
	{
		return TRUE;
	};	
};

func void DIA_Harad_ImmerNoch_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_01"); //JeötÏ po¯·d pracujeö pro paladiny?
	AI_Output (self ,other,"DIA_Harad_Add_12_02"); //Se sluûbou u lorda Hagena jsem uû skonËil.
	AI_Output (self ,other,"DIA_Harad_Add_12_03"); //TeÔ pro nÏj vyr·bÌm meËe z magickÈ rudy - ale tentokr·t mi za nÏ platÌ.
	AI_Output (self ,other,"DIA_Harad_Add_12_04"); //Ale aspoÚ teÔ sem tam m˘ûu bokem vyrobit p·r zbranÌ, kterÈ poskytnu kupc˘m na trûiöti.
	AI_Output (self ,other,"DIA_Harad_Add_12_05"); //Takûe jestli hled·ö dobr˝ meË, mÏl bys to zkusit u nich.
};

// *****************************************************
// 					About Erzklingen
// *****************************************************
instance DIA_Harad_AboutErzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_AboutErzklingen_Condition;
	information	 = 	DIA_Harad_AboutErzklingen_Info;
	permanent    =  FALSE;
	description	 = 	"ProzraÔ mi nÏco bliûöÌho o b¯itech z magickÈ rudy!";
};
func int DIA_Harad_AboutErzklingen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};	
};

func void DIA_Harad_AboutErzklingen_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_06"); //ProzraÔ mi nÏco bliûöÌho o b¯itech z magickÈ rudy!
	AI_Output (self, other, "DIA_Harad_Waffen_12_02"); //Proces v˝roby magick˝ch b¯it˘ je velmi sloûit˝ a drah˝, ale v˝sledkem je Ëepel, kter· se velmi dob¯e ovl·d· a je prakticky nezniËiteln·.
	AI_Output (self, other, "DIA_Harad_Waffen_12_03"); //MeË je urËitÏ velmi kvalitnÌ, ale jeho skuteËn· moc se projevÌ teprve v rukou paladina.
	AI_Output (self, other, "DIA_Harad_Waffen_12_04"); //Paladinsk˝ meË je zasvÏcen˝ Innosovi. V˝sledkem je, ûe takto oËarovan· zbraÚ je neskuteËnÏ ˙Ëinn·!
};

// *****************************************************
// 					Ich mˆchte eine Erzklinge kaufen
// *****************************************************
instance DIA_Harad_Erzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Erzklingen_Condition;
	information	 = 	DIA_Harad_Erzklingen_Info;
	permanent    =  TRUE;
	description	 = 	"Chci si koupit magick˝ meË z rudy.";
};
func int DIA_Harad_Erzklingen_Condition ()
{	
	if (OreBladeBought == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};	
};

//---------------------------------------------

var int OreBladeBought;

//---------------------------------------------

func void DIA_Harad_Erzklingen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Erzklingen_15_00"); //Chci si koupit meË z magickÈ rudy.
	if (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_01"); //MagickÈ b¯ity prod·v·m pouze paladin˘m, a to vûdy pouze jeden kus.
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_02"); //Jako paladinovÈ m˘ûete b˝t r·di, ûe m˘ûete t¯Ìmat tak skvÏlÈ zbranÏ.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_03"); //Dle rozkazu lorda Hagena ti mohu prodat pouze jedinou magickou zbraÚ.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_04"); //Takûe co ti mohu nabÌdnout?
		
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"ObouruËnÌ meË (2000 zlaù·k˘)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"JednoruËnÌ meË (2000 zlaù·k˘)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC void B_Harad_NotEnoughGold ()
{
	AI_Output (self ,other,"B_Harad_NotEnoughGold_12_00"); //Nem·ö dost zlata.
};

FUNC VOID B_Harad_HaveFunWithYourSword ()
{
	AI_Output (self,other,"B_Harad_HaveGunWithYourSword_12_00"); //Starej se o svou novou zbraÚ dob¯e. Je cennÏjöÌ neû vöechen tv˘j majetek.
	
	OreBladeBought = TRUE;
	
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC VOID DIA_Harad_Erzklingen_2h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_2h_15_00"); //Vezmu si obouruËnÌ meË!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_2H_1);
		CreateInvItems (self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_2H_Blessed_01,1);
	
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"ObouruËnÌ meË (2000 zlaù·k˘)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"JednoruËnÌ meË (2000 zlaù·k˘)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_1h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_1h_15_00"); //Vezmu si jednoruËnÌ meË!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_1H_1);
		CreateInvItems (self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_1H_Blessed_01,1);
		
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"ObouruËnÌ meË (2000 zlaù·k˘)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"JednoruËnÌ meË (2000 zlaù·k˘)",DIA_Harad_Erzklingen_1h);
	};
};



//############################
//##						##
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	Kannst du auch Schmuckst¸cke reparieren?
//*********************************************************************
instance DIA_Harad_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_RepairNecklace_Condition;
	information	 = 	DIA_Harad_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"UmÌö opravit i klenoty?";
};

func int DIA_Harad_RepairNecklace_Condition ()
{
	if 	((MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	 ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||    (MIS_SCKnowsInnosEyeIsBroken  == TRUE))) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Harad_RepairNecklace_15_00"); //UmÌö opravit i öperky?
	AI_Output (self	,other,"DIA_Harad_RepairNecklace_12_01"); //Jsem kov·¯, ne zlatnÌk. Budeö si tady ve mÏstÏ muset najÌt nÏkoho jinÈho, kdo ti pom˘ûe.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_02"); //Lidi majÌ jednu kapsu pr·zdnou a druhou vysypanou - uû hezkou dobu tady nikdo nezbohatnul.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_03"); //VÏtöinou jsou r·di, ûe majÌ co do ˙st.
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//	Wo finde ich einen Goldschmied?
//*********************************************************************
instance DIA_Harad_Goldsmith		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_Goldsmith_Condition;
	information	 = 	DIA_Harad_Goldsmith_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde bych sehnal nÏjakÈho zlatnÌka?";
};

func int DIA_Harad_Goldsmith_Condition ()
{
	if 	(Npc_KnowsInfo (other,DIA_Harad_RepairNecklace)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_Goldsmith_Info ()
{
	AI_Output (other,self ,"DIA_Harad_Goldsmith_15_00"); //Kde bych sehnal nÏjakÈho zlatnÌka?
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_01"); //NÏjak˝ se pr˝ p¯idal k ûold·k˘m na OnarovÏ farmÏ.
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_02"); //Zkus se po nÏm poohlÈdnout tam.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Harad_PICKPOCKET (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 900;
	condition	= DIA_Harad_PICKPOCKET_Condition;
	information	= DIA_Harad_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Harad_PICKPOCKET_Condition()
{
	C_Beklauen (14, 35);
};
 
FUNC VOID DIA_Harad_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Harad_PICKPOCKET);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_BACK 		,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};
	
func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};


