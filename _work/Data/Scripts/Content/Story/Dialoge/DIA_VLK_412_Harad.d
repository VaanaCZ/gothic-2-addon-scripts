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
	AI_Output (self, other, "DIA_Harad_Hallo_12_00"); //(nevrle) Co chceš?
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
	description = "Hledám práci.";
};
func int DIA_Harad_Arbeit_Condition ()
{
	return TRUE;
};
func void DIA_Harad_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Harad_Arbeit_15_00"); //Hledám práci!
	AI_Output (self, other, "DIA_Harad_Arbeit_12_01"); //Hm - hodil by se mi nový učedník.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_02"); //Brian brzy dokončí své učení a potom opustí męsto.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_03"); //Umíš nęco?
	AI_Output (other, self, "DIA_Harad_Arbeit_15_04"); //Jestli máš na mysli kováâství...
	AI_Output (self, other, "DIA_Harad_Arbeit_12_05"); //Ne, to jsem zrovna nemyslel.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_06"); //Dâív nebo pozdęji skâeti celé tohle męsto obklíčí a pak budou nęco platní pouze ti, kteâí je dokáží ubránit.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Harad_Arbeit_12_07"); //A já si do učení nevezmu žádného budižkničemu, který pâi první známce potíží uteče z męsta se ženami a ostatními poseroutky, místo aby zůstal tady a bránil pevnost.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Pokud se mi podaâí pâesvędčit Harada, že nejsem žádný budižkničemu, pâijme mę za svého učnę.");
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
	description = "Já nejsem žádný budižkničemu!";
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
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_00"); //Já nejsem žádný budižkničemu!
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_01"); //To jsou silná slova! Můžeš to ale podložit i nęjakými skutky?
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_02"); //A to jakými?
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_03"); //Pâines mi nęjakou skâetí zbraŕ.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_04"); //Skâeti už byli zpozorováni pâímo u męsta, takže s trochou štęstí nebudeš hledat dlouho.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_05"); //Jestli se ti povede nęjakého skolit, tak tę pâijmu do učení.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_06"); //Pokud s tím tedy budou souhlasit i ostatní mistâi.
	
	MIS_Harad_Orc = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HaradOrk,LOG_RUNNING);
	B_LogEntry (TOPIC_HaradOrk,"Za męstem se usadil skâet, kterého mám na prosbu kováâe Harada zabít. Jako důkaz mu postačí jakákoliv skâetí zbraŕ.");
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
	description = "Promluvme si ještę o té skâetí záležitosti...";
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
	AI_Output (other, self, "DIA_Harad_OrcRunning_15_00"); //Promluvme si ještę o té skâetí záležitosti...
	AI_Output (self, other, "DIA_Harad_OrcRunning_12_01"); //(stroze) Co?
	
	Info_ClearChoices (DIA_Harad_OrcRunning);	
	Info_AddChoice (DIA_Harad_OrcRunning, "Ten tvůj skâet už je teë mrtvý!", DIA_Harad_OrcRunning_Done);
	Info_AddChoice (DIA_Harad_OrcRunning, "Skâet je zatracenę tuhý protivník...", DIA_Harad_OrcRunning_TooHard);

	//AI_Output (self, other, "DIA_Harad_OrcRunning_12_02"); //Ah, ich verstehe schon. Du hast Wichtigeres zu tun. Schon in Ordnung, die Sache hat sich erledigt.
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_00"); //Ale skâet je zatracenę tuhý protivník.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_01"); //Hm - jak tak na tebe koukám, možná máš pravdu. Jsi fakt docela vyžle, ale to se může zmęnit.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_02"); //Stejnę mi musíš dokázat, že se nebojíš bojovat.
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_03"); //Takže by to mohlo být nęco menšího?
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_04"); //Hm - (pâemýšlí) Hakon, co na tržišti obchoduje se zbranęmi, se mi svęâil, že ho pâed pár dny pâepadli banditi.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_05"); //Prý se potulují nękde za jižní branou.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_06"); //Ti zbabęlí lupiči nejspíš moc rozumu nepobrali.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_07"); //Tak je všechny pochytej - až do posledního! Tak mi dokážeš, že nám tady ve męstę snad pâece jen budeš nęco platný.
	
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	
	if (MIS_HakonBandits != LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Lehrling, "Harad mi âekl, že nęjací bandité okradli za męstem kupce Hakona. Jestli se mi je podaâí dostihnout, pâesvędčím ho, že za nęco stojím. Męl bych si tedy promluvit s Hakonem - snad bude spíš vędęt, kde se ti bandité potloukají.");
	}
	else
	{
		B_LogEntry (TOPIC_Lehrling, "Harad mi âekl, že nęjací bandité okradli za męstem kupce Hakona. Jestli se mi je podaâí dostihnout, pâesvędčím ho, že za nęco stojím.");
	};
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_Done_15_00"); //Jako by ten skâet byl už teë mrtvý!
	AI_Output (self, other, "DIA_Harad_OrcRunning_Done_12_01"); //Dobâe! Tak teë pâestaŕ plýtvat dechem a koukej, aă za tebe mluví činy!
	
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
	description = "Získal jsem tu skâetí zbraŕ, jak jsi chtęl.";
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
	AI_Output (other, self, "DIA_Harad_OrcSuccess_15_00"); //Získal jsem tu skâetí zbraŕ, jak jsi chtęl.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_01"); //Ukaž...
	
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
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_02"); //Tak tys to PÂECE dokázal! Tos tedy fakt dobrý!
	};
	
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_03"); //Takovou zbraŕ už jsem nemęl v ruce, ani nepamatuju - naposledy, když jsem sloužil jako voják ve skâetí válce.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_04"); //To byly krušné časy, to ti povím.
	
	if (Player_IsApprentice == APP_Harad)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_05"); //Já vędęl, že udęlám dobâe, když tę pâijmu do učení. Skvęlá práce!
	}
	else if (Player_IsApprentice == APP_NONE) 
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_06"); //Nevęâil jsem, že to zvládneš. Je to obdivuhodné.
	}
	else //anderer Weg
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_07"); //Škoda že ses rozhodl pro jinou dráhu.
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_08"); //Opravdu bych tu pro tebe našel uplatnęní.
	};
	
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP (XP_Harad_Orc);
	B_LogEntry (Topic_Lehrling,"Harad mę pâijme jako svého učedníka, pokud s tím budou souhlasit i ostatní mistâi.");
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
	description = "Kdy můžu jako tvůj učedník začít?";
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
	
	AI_Output (other, self, "DIA_Harad_LEHRLING_15_00"); //Kdy můžu jako tvůj učedník začít?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		// ------ Harad ------
		if (MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_01"); //Chlap, který dokáže skolit skâeta, se nám opravdu hodí.
			
			if (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_02"); //Krom toho se mi Hakon pochlubil, jak statečnę ses vypoâádal s bandity. To tę šlechtí!
			};
		}
		else //HakonBandits SUCCESS
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_03"); //Sice jsi nezabil žádného skâeta, ale Hakon se chlubil, jak skvęle ses vypoâádal s bandity. To tę šlechtí!
		};
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_04"); //Co se mę týče, můžeš začít tâeba hned.
				
		stimmen = stimmen + 1;
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_05"); //A co se týče ostatních mistrů...
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_06"); //Thorben ti dal své požehnání.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_07"); //Starý dobrý Thorben by byl rád, kdyby sis napâed vyprosil boží požehnání. Myslím, že to je dobrý nápad.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_08"); //Thorben prý s tebou ještę nemluvil.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_09"); //Bosper se mi to snažil vymluvit - chce tę totiž za učedníka sám.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_10"); //Męl jsem s ním na tohle téma krátkou, ale ostrou diskusi.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_11"); //Nakonec souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_12"); //Požádal mę, zda bych mu nedovolil, aby ti mohl svou profesi aspoŕ pâedstavit.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_13"); //Takže si to omrkni - potom se můžeš vždycky rozhodnout. Tedy leda že bys nechtęl jeho hlas, samozâejmę.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_14"); //A Bosper tę zatím vůbec nezná.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_15"); //Constantinovi je jako vždycky všecko jedno. Co se jeho týče, tak prý můžeš začít, u koho chceš.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_16"); //Constantino tvrdí, žes tady ve męstę spáchal nęjaký zločin - je to pravda?
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_17"); //Jestli jo, tak bys to męl jít okamžitę napravit!
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_18"); //Constantino o tobę ještę vůbec neslyšel.
		};
		
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_19"); //A Matteo hlásí, žes mu vrátil jeho zlato. Zdá se, že jsi opravdu čestný muž.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_20"); //A Matteo tvrdí, že mu ještę poâád nęco dlužíš. Nevím, co mezi sebou máte, ale męl bys to dát rychle do poâádku.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_21"); //A Matteo prý s tebou na tohle téma ještę vůbec nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_22"); //A Matteo tę prý ve svém krámku ještę nevidęl.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_23"); //To znamená, žes získal doporučení ode všech mistrů!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_24"); //To znamená, žes získal doporučení od čtyâ mistrů. Což pro pâijetí do učení stačí.
			};
			
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_25"); //Chceš tedy vstoupit do učení ke mnę?
			
			Info_ClearChoices (DIA_Harad_LEHRLING);
			Info_AddChoice (DIA_Harad_LEHRLING, "Dobâe - rozmyslím si to.", DIA_Harad_LEHRLING_Later);
			Info_AddChoice (DIA_Harad_LEHRLING, "Jdu do toho!", DIA_Harad_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_26"); //Potâebuješ doporučení alespoŕ od čtyâ mistrů, jinak tę nikdo v dolní části męsta do učení nepâijme.
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_27"); //Męl by sis proto promluvit se všemi, které jsi ještę nepâesvędčil.
		};
	}
	else //Mission nicht erfüllt
	{
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_28"); //Dokud mi nedokážeš, že nejsi úplný budižkničemu, nemáš šanci.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_00"); //Jdu do toho!
	AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_01"); //Výbornę! A teë tę naučím, jak vykovat pękný meč.
	
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_02"); //To už umím!
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_03"); //No tak tím líp!
	};
	
	if (other.attribute[ATR_STRENGTH] < (T_MED-30))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_04"); //Krom toho bys męl taky trochu posilovat. Vždyă se mi úplnę ztrácíš pâed očima!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Harad_StartGuild = other.guild;
	
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("schmied", GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry (Topic_Bonus,"Harad mę pâijal za učedníka. Nyní mám pâístup i do horní čtvrti.");
	B_LogEntry (Topic_Bonus,"Harad za dobrou cenu odkoupí zbranę, které vykovám.");
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_CityTeacher, "Harad mę vyučí kováâskému umęní a také se s jeho pomocí mohu stát silnęjším.");
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_Later_15_00"); //Dobâe - rozmyslím si to.
	if (!Npc_IsDead (Brian))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_Later_12_01"); //Žádný spęch, Brian tu ještę nęjakou dobu zůstane.
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
	description	 = 	"Mohu se zapsat do učení k nękterému z ostatních mistrů?";
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
	AI_Output (other, self, "DIA_Harad_Zustimmung_15_00"); //Mohu se zapsat do učení k nękterému z ostatních mistrů?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_01"); //Jsi dobrý človęk.
		if (MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_02"); //Hakon mi líčil, jak ses vypoâádal s bandity.
		};
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_03"); //Dám ti své doporučení.
		
		if (DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP (XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry (Topic_Lehrling,"Harad mę doporučí, pokud se budu chtít stát učedníkem nękde jinde.");
		
		if (!Npc_IsDead(Brian))
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_04"); //Brian tu ještę nęjakou dobu pobude. A časem jistę najdu jiného siláka, který ho zastoupí.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_05"); //Ostatní mistâi ti své svolení klidnę dát mohou, ale já tę nedoporučím, dokud mę nepâesvędčíš, že nejsi jenom neschopné jelito!
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
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_00"); //Takže tys vstoupil do âad domobrany? Jsem na tebe hrdý!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_01"); //Bęhem služby v armádę nejspíš nebudeš moci zároveŕ plnit své učednické povinnosti. Ani to od tebe nečekám.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_02"); //Ale když budeš nęco potâebovat, klidnę pâijë.
		Harad_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Harad_StartGuild != GIL_PAL)
	&& (Harad_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_03"); //Koukám, že ses dokázal dostat mezi paladiny!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_04"); //Jsem rád, že jsem tę pâijal do učení. I když jsi za kovadlinou zrovna moc času nestrávil.
		
		Harad_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Harad_StartGuild != GIL_NOV)
	&& (Harad_StartGuild != GIL_KDF)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_05"); //Takže tys vstoupil do kláštera. Já osobnę bych byl radši, kdybys zůstal ve męstę. Potâebujeme každého muže.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_06"); //Ale když tę Innos povolal, asi to tak má být.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_07"); //Když budeš nęco potâebovat, jsem ti vždycky k dispozici.
		Harad_INNOSKommentar = TRUE;
	}
	
	else if (Harad_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Harad_MILKommentar == FALSE)
	&& (Harad_PALKommentar == FALSE)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_08"); //Už ses tu hezkou dobu neukázal. Kdepak ses toulal, co?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_09"); //Tak tę tu máme zas.
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
	description	 = 	"Prodáváš také zbranę?";
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
	AI_Output (other, self, "DIA_Harad_Waffen_15_00"); //Prodáváš také zbranę?
	AI_Output (self, other, "DIA_Harad_Waffen_12_01"); //Na to zapomeŕ. Všechno, co vyrobím, si berou paladinové nebo domobrana.
	AI_Output (self ,other, "DIA_Harad_Add_12_00"); //Od lorda Hagena jsem dostal zakázku na 100 mečů - chce s nimi vybavit męstskou stráž.
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
	description	 = 	"Jaké mám jako učedník povinnosti?";
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
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_00"); //Jaké mám jako učedník povinnosti?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_01"); //Celkem tâi.
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_02"); //Kovat, kovat a kovat.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_03"); //Nejsi tak hloupý, jak vypadáš. Za každý meč ti zaplatím - takže když se budeš flákat, žádné penízky se neposypou. Jak prosté.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_05"); //Krom toho tę můžu naučit, jak vyrobit prostý meč.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_06"); //Magické meče mohou vyrábęt pouze zkušení kováâi - a k tomu máš ještę hodnę daleko.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_07"); //Jestli potâebuješ nocleh, můžeš se uložit nękde v mém domę. Už je ti všechno jasné?
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
	description	 = "Chtęl bych prodat zbranę, co jsem vykoval.";
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
	AI_Output (other, self, "DIA_Harad_SellBlades_15_00"); //Chtęl bych prodat zbranę, co jsem vykoval.
	
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
			AI_Output (self, other, "DIA_Harad_SellBlades_12_01"); //Jedinou, kterou bych mohl pâijmout, máš zrovna pâipnutou u pasu, a tu si radši nechej.
		}
		else
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_04"); //Tak nęjaké vykovej! Pâijímám pouze prosté meče.
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
				concatText = ConcatStrings(IntToString(gesamt), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
				AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
				
		AI_Output (self, other, "DIA_Harad_SellBlades_12_03"); //Tak, a tady máš výplatu.
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
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_01"); //Je to docela snadné, hochu. Stačí mít kousek surové oceli a podržet ji v ohni, dokud nezčervená.
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_02"); //Pak čepel na kovadlinę náležitę vyklepeš.
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
		Info_AddChoice	(DIA_Harad_TeachSmith, B_BuildLearnString("Naučit se kováâství"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Harad_TeachSmith_Common);
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
	description	 = 	"Nauč mę vykovat prostý meč!";
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
	AI_Output (other, self, "DIA_Harad_TeachCommon_15_00"); //Nauč mę vykovat prostý meč!
	
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
		AI_Output (self, other, "DIA_Harad_TeachCommon_12_03"); //Napoprvé to asi nebude žádný zázrak, ale všechno ostatní se časem taky naučíš.
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
	description = "Chci se stát silnęjším!";
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
	AI_Output (other, self, "DIA_Harad_TeachSTR_15_00"); //Chci se stát silnęjším!
	
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
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_01"); //Už jsi zase o nęco svalnatęjší.
	};

	if (other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_02"); //Vraă se, až se budeš chtít dozvędęt víc.
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

// ------ 5 Stärke ------
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
	description	 = 	"Ještę poâád pracuješ pro paladiny?";
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
	AI_Output (other, self,"DIA_Harad_Add_15_01"); //Ještę poâád pracuješ pro paladiny?
	AI_Output (self ,other,"DIA_Harad_Add_12_02"); //Se službou u lorda Hagena jsem už skončil.
	AI_Output (self ,other,"DIA_Harad_Add_12_03"); //Teë pro nęj vyrábím meče z magické rudy - ale tentokrát mi za nę platí.
	AI_Output (self ,other,"DIA_Harad_Add_12_04"); //Ale aspoŕ teë sem tam můžu bokem vyrobit pár zbraní, které poskytnu kupcům na tržišti.
	AI_Output (self ,other,"DIA_Harad_Add_12_05"); //Takže jestli hledáš dobrý meč, męl bys to zkusit u nich.
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
	description	 = 	"Prozraë mi nęco bližšího o bâitech z magické rudy!";
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
	AI_Output (other, self,"DIA_Harad_Add_15_06"); //Prozraë mi nęco bližšího o bâitech z magické rudy!
	AI_Output (self, other, "DIA_Harad_Waffen_12_02"); //Proces výroby magických bâitů je velmi složitý a drahý, ale výsledkem je čepel, která se velmi dobâe ovládá a je prakticky nezničitelná.
	AI_Output (self, other, "DIA_Harad_Waffen_12_03"); //Meč je určitę velmi kvalitní, ale jeho skutečná moc se projeví teprve v rukou paladina.
	AI_Output (self, other, "DIA_Harad_Waffen_12_04"); //Paladinský meč je zasvęcený Innosovi. Výsledkem je, že takto očarovaná zbraŕ je neskutečnę účinná!
};

// *****************************************************
// 					Ich möchte eine Erzklinge kaufen
// *****************************************************
instance DIA_Harad_Erzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Erzklingen_Condition;
	information	 = 	DIA_Harad_Erzklingen_Info;
	permanent    =  TRUE;
	description	 = 	"Chci si koupit magický meč z rudy.";
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
	AI_Output (other, self, "DIA_Harad_Erzklingen_15_00"); //Chci si koupit meč z magické rudy.
	if (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_01"); //Magické bâity prodávám pouze paladinům, a to vždy pouze jeden kus.
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_02"); //Jako paladinové můžete být rádi, že můžete tâímat tak skvęlé zbranę.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_03"); //Dle rozkazu lorda Hagena ti mohu prodat pouze jedinou magickou zbraŕ.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_04"); //Takže co ti mohu nabídnout?
		
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Obouruční meč (2000 zlaăáků)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Jednoruční meč (2000 zlaăáků)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC void B_Harad_NotEnoughGold ()
{
	AI_Output (self ,other,"B_Harad_NotEnoughGold_12_00"); //Nemáš dost zlata.
};

FUNC VOID B_Harad_HaveFunWithYourSword ()
{
	AI_Output (self,other,"B_Harad_HaveGunWithYourSword_12_00"); //Starej se o svou novou zbraŕ dobâe. Je cennęjší než všechen tvůj majetek.
	
	OreBladeBought = TRUE;
	
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC VOID DIA_Harad_Erzklingen_2h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_2h_15_00"); //Vezmu si obouruční meč!
	
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
		Info_AddChoice (DIA_Harad_Erzklingen,"Obouruční meč (2000 zlaăáků)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Jednoruční meč (2000 zlaăáků)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_1h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_1h_15_00"); //Vezmu si jednoruční meč!
	
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
		Info_AddChoice (DIA_Harad_Erzklingen,"Obouruční meč (2000 zlaăáků)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Jednoruční meč (2000 zlaăáků)",DIA_Harad_Erzklingen_1h);
	};
};



//############################
//##						##
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Harad_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_RepairNecklace_Condition;
	information	 = 	DIA_Harad_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Umíš opravit i klenoty?";
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
	AI_Output (other,self ,"DIA_Harad_RepairNecklace_15_00"); //Umíš opravit i šperky?
	AI_Output (self	,other,"DIA_Harad_RepairNecklace_12_01"); //Jsem kováâ, ne zlatník. Budeš si tady ve męstę muset najít nękoho jiného, kdo ti pomůže.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_02"); //Lidi mají jednu kapsu prázdnou a druhou vysypanou - už hezkou dobu tady nikdo nezbohatnul.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_03"); //Vętšinou jsou rádi, že mají co do úst.
	
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
	description	 = 	"Kde bych sehnal nęjakého zlatníka?";
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
	AI_Output (other,self ,"DIA_Harad_Goldsmith_15_00"); //Kde bych sehnal nęjakého zlatníka?
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_01"); //Nęjaký se prý pâidal k žoldákům na Onarovę farmę.
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_02"); //Zkus se po nęm poohlédnout tam.
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


