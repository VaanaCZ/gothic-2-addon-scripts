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
	AI_Output (self, other, "DIA_Torlof_Hallo_01_00"); //(brummig) Was willst du von mir?
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
	description	= "Ich will mich den S�ldnern anschlie�en!";
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
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Ich will mich den S�ldnern anschlie�en!
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //So? Und warum glaubst du, sollte ich wohl daf�r sein, dass du hier aufgenommen wirst?
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
	description	= "Stell mich auf die Probe!";
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
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Stell mich auf die Probe!
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Hat Lee dich zu mir geschickt?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //Er sagte, du w�rdest mir weiterhelfen.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //(seufzt) Gut. Dann wollen wir mal: Es gibt zwei Dinge, die du tun musst, bevor du bei uns mitmachen kannst.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Erstens: Du musst beweisen, dass du f�hig bist, die Aufgaben zu meistern, die du als S�ldner zu erf�llen hast. Ich werde dich auf die Probe stellen.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //Und zweitens: Du musst dir den Respekt der anderen S�ldner verdienen.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Start"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Um bei den S�ldnern aufgenommen zu werden, wird Torlof mich auf die Probe stellen und ich muss mir den Respekt der anderen S�ldner verdienen.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Nein.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Was quatschst du mich dann voll?
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
	description	= "Wie verdiene ich mir den Respekt der anderen S�ldner?";
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
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Wie verdiene ich mir den Respekt der anderen S�ldner?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //Den meisten wird es reichen, wenn du meine Aufgabe erf�llst und deine Probe bestehst.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //Aber einige unter ihnen wirst du auf andere Art �berzeugen m�ssen.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //Manche werden versuchen, deine Situation auszunutzen, und wieder anderen passt vielleicht deine Visage nicht.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //Du solltest versuchen, mit m�glichst vielen der Jungs gut auszukommen - aber wenn nichts mehr hilft, kannst du dich immer noch auf ein Duell einlassen.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Wenn du gewinnst, wird das den meisten Respekt beibringen. Aber achte darauf, dass du nicht versehentlich einen dabei umbringst. Denn dann hast du ein fettes Problem.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Damit die S�ldner mich respektieren, sollte ich die Aufgabe erledigen, die Torlof mir stellt. Zudem werden die S�ldner von mir �berzeugt sein, wenn ich ihnen helfe oder sie im Duell besiege.");
	
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
	description	= "Was sind die Duellregeln?";
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
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Was sind die Duellregeln?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Ganz einfach. Beide Gegner m�ssen Gelegenheit haben, ihre Waffe zu ziehen, bevor der erste Schlag gef�hrt wird.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Du kannst nicht einfach hingehen und einem der M�nner ohne Warnung eins �berbraten.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Es muss eine Art Herausforderung ausgesprochen werden. Eine Beleidigung oder ein anderer Grund zu k�mpfen.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //Keiner der anderen M�nner wird sich in so einen Kampf einmischen. Es sei denn, einer der beiden wird bei dem Duell get�tet.
	
	B_LogEntry (TOPIC_SLDRespekt,"Die Duellregeln: Ein Duell muss durch eine Herausforderung begonnen werden, dann wird sich auch kein anderer einmischen. Beim Duell darf nicht get�tet werden.");
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
	description	= "Was ist mit dir? Wirst du f�r mich stimmen?";
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
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //Was ist mit dir? Wirst du f�r mich stimmen?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Wenn du beweisen kannst, dass du die Aufgaben eines S�ldners erf�llen kannst, ja.
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
	description	= "Wie ist mein Ruf bei den S�ldnern?";
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
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Wie ist mein Ruf bei den S�ldnern?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Mal sehen ...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Wolf sagt, er hat nichts dagegen, wenn du mitmachst.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis meint, du stehst auf der richtigen Seite.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis ist sich noch nicht sicher, ob du auf der richtigen Seite stehst.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Er hat keine Lust, dass noch mehr Leute nach Sylvios Pfeife tanzen. Ich �brigens auch nicht.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord denkt, du w�rst gut genug, um anzufangen.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Cord ist der Meinung, du m�sstest erst lernen, besser mit der Waffe umzugehen.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher sagt, f�r ihn w�re sonnenklar, dass du mitmachst. Irgendwas schien ihn ziemlich zu freuen.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher sagt, du schuldest ihm noch einen kleinen Gefallen. Du w�sstest schon, worum es geht.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod will einfach nur sein Schwert wiederhaben.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Rod hast du wohl �berzeugt, dass du stark genug bist.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod h�lt dich f�r einen Schw�chling.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza will f�r dich stimmen. Er sagte, du w�rest ein sehr vern�nftiger Mann.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza will nicht f�r dich stimmen. Er sagt, du schuldest ihm noch 50 Goldst�cke.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul ist gegen dich, ich glaube, er kann dich nicht leiden.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //Von Sylvio und Bullco brauche ich wohl gar nicht erst zu reden. Die beiden Schwachk�pfe sind gegen jeden.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster meinte, du w�rest okay.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //Obwohl du gegen ihn verloren hast.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster hat erz�hlt, du h�ttest den Schwanz eingekniffen, als er dich herausgefordert hat.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //So was ist keine gute Idee. Vielleicht solltest du noch mal zum Vorposten gehen und ihn herausfordern.
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //Und Dar h�lt dich f�r ein Kameradenschwein. Aber seine Stimme z�hlt hier sowieso nicht viel.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Der Rest der S�ldner hat nichts gesagt.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //Die meisten warten einfach ab, ob du die Probe bestehst.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //Die meisten hast du wohl �berzeugt, in dem du die Probe bestanden hast.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //(grinst) Auch wenn Cord dabei etwas nachgeholfen hat ...
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //Obwohl viele meinen, einem Bauern die Pacht abzukn�pfen, w�re f�r eine Probe zu leicht gewesen.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //Meine Stimme hast du jedenfalls.
		Points_Sld = Points_Sld + 1;
	};
	
	// --------------------
	// ------ Duelle ------
	// --------------------
	if (Sld_Duelle_gewonnen >= 3)//ge�ndert M.F.
	{
		Points_Sld = Points_Sld + 1;
		
		if (Points_Sld >= 9)//ge�ndert M.F.
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //Und du hast einige faire Duelle gewonnen.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //Viele der S�ldner respektieren das.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //Immerhin hast du schon einige faire Duelle gewonnen.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //ge�ndert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 f�r Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //Die meisten S�ldner sind f�r dich - von unserer Seite aus kannst du jederzeit bei uns anfangen.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //Geh zu Lee. Er wird dir alles weitere erz�hlen.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Ich habe genug Respekt bei den S�ldnern. Jetzt sollte ich mal mit Lee sprechen."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //Das ist schon 'ne ganze Menge, aber es reicht noch nicht.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Du wirst dich noch 'ne Weile mit den Jungs rumschlagen m�ssen.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Du bist noch lange nicht so weit, Kleiner. Wenn du bei uns aufgenommen werden willst, musst du schon was daf�r tun.
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
	description	= "Welche Aufgaben habe ich als S�ldner zu erf�llen?";
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
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //Welche Aufgaben habe ich als S�ldner zu erf�llen?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar hat uns aus zwei Gr�nden angeheuert: Er will, dass wir ihm die Milizen vom Hals halten und dass wir auf seinen H�fen f�r Ordnung sorgen.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //Dazu z�hlt auch, dass wir die Pacht eintreiben, wenn die kleinen Bauern mal wieder nicht zahlen.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //Also, was darf's sein?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Lass mich die Pacht eintreiben!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Mit den Milizen werde ich schon fertig!", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Gut. H�r zu. Der Bauer Sekob hat schon seit Wochen keine Pacht mehr an Onar gezahlt.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar will, dass er 50 Goldm�nzen ausspuckt. Noch Fragen?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Wo ist Sekobs Hof?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //Im Norden des Tals. Das ist von hier aus gesehen an der gro�en Feldkreuzung rechts.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Wenn du Probleme hast, werden die Bauern auf den Feldern dir helfen, dich hier in der Gegend zurechtzufinden.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof hat mich beauftragt, die Pacht vom Bauer Sekob einzutreiben. Es sind 50 Goldst�cke die er zahlen soll.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Der Bauern Bengar hat sich beklagt, dass ihm in letzter Zeit die Milizen aus der Stadt immer mehr auf den Wecker gehen.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Sie setzen den Bauern unter Druck - wollen wohl erreichen, dass er sich von Onar lossagt.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Ich will, dass du zu seinem Hof gehst und den Milizen klarmachst, dass sie dort nichts verloren haben! Fragen?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Wo finde ich Bengars Hof?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //Im S�dwesten des Tals ist eine gro�e Treppe, die zu einer Hochebene f�hrt. Dort liegt Bengars Hof.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Wenn du dich verlaufen solltest, frag die Bauern auf den Feldern, wie du dich in der Gegend hier zurechtfindest.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof hat mich beauftragt, die Miliz von Bauer Bengars Hof zu vertreiben. Der Hof liegt auf der Hochebene.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Lass mich die Pacht eintreiben!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Mit den Milizen werde ich schon fertig!
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
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Daf�r hast du dir aber auch ganz sch�n Zeit gelassen. Onar wird nicht sehr erfreut sein.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //Und ihm ist es egal, ob die Paladine im Minental von Drachen gefressen werden oder nicht...
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Gut gemacht! Wenn ich was Neues habe, sag ich dir Bescheid.
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
	description	= "Ich habe die Pacht von Sekob eingetrieben.";
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
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Ich habe die Pacht von Sekob eingetrieben.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //Und? Hat er freiwillig gezahlt?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //Nun, er hatte einen t�dlichen Unfall.
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Ich musste ihn erst �berzeugen.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Gut gemacht! Du hast deine Probe bestanden. Das wird viele der S�ldner �berzeugen, dass du zu was zu gebrauchen bist.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Die Aufgabe, die Torlof mir gestellt hat, habe ich erf�llt."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //Und? Hast du sie versoffen? Bring mir das Geld! Aber 'n bisschen schnell!
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
	description	= "Ich hab mich um Bengars Milizproblem gek�mmert.";
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
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Ich hab mich um Bengars Milizproblem gek�mmert.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Hast du auch daf�r gesorgt, dass sie morgen nicht wieder bei ihm auf der Matte stehen?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //Das d�rfte ihnen sehr schwer fallen.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Gut gemacht!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Du hast deine Probe bestanden. Wenn du mit den Milizen fertig wirst, werden dich die meisten hier respektieren.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Die Aufgabe, die Torlof mir gestellt hat, habe ich erf�llt."); 
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
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //Willkommen bei den S�ldnern, Kleiner!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //Danke!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Sobald ich etwas f�r dich zu tun habe, lasse ich es dich wissen.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Wo hast du dich 'rumgetrieben?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //Ich war im Minental! Dort gibt es Drachen! Sie haben den Paladinen ganz sch�n zugesetzt!
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //So? Dann ist an den Geschichten also tats�chlich was dran!
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Das wird Lee interessieren...
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
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Gut, dass du hier bist. Ich hab was zu tun f�r dich ...
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //Worum geht's?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //Und sieh zu, dass du die Sache bis morgen �ber die B�hne bringst!
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
	description = "Kannst du mir helfen, meine F�higkeiten zu verbessern?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //Kannst du mir helfen, meine F�higkeiten zu verbessern?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Ich k�nnte dir zeigen, wie du deine St�rke besser im Nahkampf einsetzen kannst.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Viele K�mpfer sind sehr schwach, weil sie die Technik nicht beherrschen, ihre St�rke richtig einzusetzen.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //Dasselbe gilt f�r Geschicklichkeit und Fernwaffen.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof kann mir dabei helfen, mein Geschick und meine St�rke zu verbessern.");
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
	description = "Ich will meine F�higkeiten verbessern!";
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
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Ich will meine F�higkeiten verbessern!
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
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //Ich sagte, ich K�NNTE dir helfen, nicht ich WERDE.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Solange du keiner von uns bist, kannst du dir einen anderen suchen, der dich unterrichtet!
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //Gut! Jetzt kannst du deine F�higkeiten noch besser einsetzen!
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

	description	 = 	"Hast du was zu tun f�r mich?";
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
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Hast du was zu tun f�r mich?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Hast du diese schwarzen Kapuzentypen hier vorbei schleichen sehen? Mir sind die Typen nicht ganz geheuer, sag ich dir.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Als ich damals noch zur See gefahren bin, habe ich ja schon einige seltsame Dinge gesehen, aber diese Kerle machen mir Angst.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //Sie sind in Richtung des Banditenlagers in den Bergen am s�dlichen Ende des Tals gezogen.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Das Beste wird sein, du gehst da mal nach dem Rechten sehen und legst die Kerle um!
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"Beim Banditenlager in den Bergen im S�den des Tals sollen sich einige dieser schwarzen Kapuzentypen aufhalten. Torlof bekommt bei ihrer Anwesendheit Sodbrennen. Ich soll die Sache f�r ihn erledigen."); 

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

	description	 = 	"Die schwarzen M�nner in den Bergen sind von uns gegangen.";
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
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Die schwarzen M�nner in den Bergen sind von uns gegangen.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Du konntest es mit ihnen aufnehmen? Guter Mann!
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Die Kerle waren mir nicht geheuer. H�tten bestimmt noch 'ne Menge �rger gemacht ...
	
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

	description	 = 	"Einige der S�ldner sind weg?";
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
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //Einige der S�ldner sind weg?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio hat sich ein paar von den Jungs mitgenommen und ist �ber den Pass verschwunden.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //Es wird gemunkelt, dass es dort Drachen geben soll. Als er das geh�rt hat, war er nicht mehr zu bremsen.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Wer wei�? So eine Drachentroph�e bringt auf dem freien Markt sicher eine Menge Gold.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //F�r mich ist das nichts. Ich bin Seemann. Ich geh�re aufs Meer und nicht in einen stickigen Drachenbau.

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

	description	 = 	"Du bist Seemann?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //Du bist Seemann?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //Hast du das auch endlich geschnallt? Ja, verdammt noch mal, ich bin Seemann. Warum fragst du?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Ich k�nnte deine F�higkeiten gebrauchen. Ich muss zu einer Insel.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //(lacht) Zu einer Insel? Du hast doch noch nicht einmal ein Schiff, geschweige denn eine Mannschaft, um es zu f�hren.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Nee, mein Junge. Wenn du meine Dienste als Kapit�n und St�rkelehrer in Anspruch nehmen willst, dann musst du mir erst einmal beweisen, dass du wei�t, wovon du da redest.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Au�erdem habe ich gerade ganz andere Sorgen. Die Paladine ziehen nicht wie erwartet aus der Stadt ab.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Es m�sste schon etwas Gravierendes passieren, das sie veranlasst, das Feld zu r�umen.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //Geh in die Burg im Minental. Klaue der Torwache den Schl�ssel f�r das Haupttor und �ffne es. Den Rest werden die Orks besorgen!

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Bevor Torlof den Kapit�nsposten annehmen wird, muss ich daf�r sorgen, dass die Paladine aus der Stadt abziehen. Er meint ich sollte einen kleinen Zwischfall in der Burg des Minentals arrangieren. Er will, dass ich der Torwache den Schl�ssel zum Hauptor stehle und die Orks in die Burg lasse. Er hofft, dass die Paladine dann die Stadt verlassen um ihren Kameraden zu helfen.");
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

	description	 = 	"Das Tor zur Burg im Minental ist ge�ffnet...";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Das Tor zur Burg im Minental ist ge�ffnet und hat sich verklemmt. Die Orks konnten ungehindert die Burg st�rmen.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Die Paladine in der Burg haben schwere Verluste gegen die Orks erlitten.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //Es dauert nicht mehr lange, sch�tze ich, bis die Paladine aus der Stadt ins Minental vorr�cken, um die Jungs aus der Burg zu holen.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //Das ist eine erfreuliche Nachricht. Dann steht ja einer Flucht aus diesem verfluchten Landstrich nichts mehr im Wege.
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

	description	 = 	"Wirst du mir jetzt helfen zur Insel zu kommen? ";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Wirst du mir jetzt helfen zur Insel zu kommen?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //Ach ja. Du wolltest ja zu einer Insel. Mmh. Ich mach dir einen Vorschlag.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Du zahlst mir 2500 Goldm�nzen und ich f�hre dein Schiff.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Daf�r werde ich dich dort auch in St�rke und Geschick unterrichten, wohin du auch immer segeln willst.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "Das ist eine verdammte Menge Geld.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "In Ordnung. Hier hast du das Geld.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //Das ist eine verdammte Menge Gold.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //Tja. Guter Dienst ist eben teuer. Du hast gar keine andere Wahl. Du wirst in dieser Gegend keinen anderen finden, der ein Schiff f�hren kann.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Also zahl das Gold und mach hier keine Zicken.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof ist jetzt bereit das Schif zu steuern. Leider m�chte er noch eine Entlohnung von 2500 Goldst�cken haben.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //In Ordnung. Hier hast du das Gold.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //Wunderbar. Jetzt musst du mir nur noch genau sagen, was ich machen soll.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Nachdem ich Torlof 2500 Goldst�cke in den Rache gestopft habe, ist er jetzt endlich bereit mir zu folgen.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Mit den paar Kr�ten willst du mich abspeisen? Besorg dir erst mal das Gold. Dann sehen wir weiter.
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

	description	 = 	"Sei mein Kapit�n.";
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
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //Sei mein Kapit�n.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //In Ordnung. Besorg mir ein Schiff und eine ausreichend starke Mannschaft und ich bring dich zu der verdammten Insel.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //Hast du eine Seekarte? Ohne so ein Ding werden wir nicht weit kommen.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //Lass das meine Sorge sein. Wir sehen uns am Hafen.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //Da bin ich ja mal gespannt.
	
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

	description	 = 	"Lass uns zur Insel aufbrechen.";
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
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Lass uns zur Insel aufbrechen.

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Alles klar. Her mir der Karte und dann geht's los.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //(ruft) Alle an Bord.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Denk daran, dass du auch wirklich alles dabei hast, was du brauchen k�nntest. Es gibt keinen Weg zur�ck.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Wenn du dir sicher bist, hau dich erst mal in der Kapit�nskaj�te aufs Ohr. Die Reise wird einige Zeit dauern.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //Ohne Schiff, Mannschaft und Seekarte keine Reise, mein Freund.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Ich will hier mindestens 5 M�nner sehen, die willens und f�hig sind, ein Schiff zu f�hren.
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

	description	 = 	"Ich habe mich f�r einen anderen Kapit�n entschieden.";
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
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Ich habe mich f�r einen anderen Kapit�n entschieden. Du kannst mir mein Gold wiedergeben.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //Das k�nnte dir so passen. Nix da. Wenn du mich bezahlst und dann meine Dienste nicht in Anspruch nimmst, ist das dein Problem, mein Freund.
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

































































