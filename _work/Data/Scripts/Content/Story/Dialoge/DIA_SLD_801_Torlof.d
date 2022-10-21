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
	AI_Output (self, other, "DIA_Torlof_Hallo_01_00"); //Oj czego ode mnie chcesz?
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
	description	= "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
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
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Chc� si� przy��czy� do najemnik�w.
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Tak? A dlaczego niby mia�bym pozwoli�, �eby� do nas do��czy�?
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
	description	= "Poddaj mnie pr�bie!";
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
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Poddaj mnie pr�bie!
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Czy to Lee przys�a� ci� do mnie?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //Powiedzia�, �e mo�esz mi pom�c.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //Aj... No dobra, niech ju� b�dzie. Zanim pozwolimy ci do nas do��czy�, musisz zrobi� dwie rzeczy.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Po pierwsze: musisz udowodni�, �e nadajesz si� do roboty najemnika. W tym celu poddam ci� pr�bie.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //Po drugie: musisz zas�u�y� na szacunek pozosta�ych ch�opak�w.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Start"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Aby m�c zosta� najemnikiem, musz� podda� si� pr�bie Torlofa i zyska� szacunek pozosta�ych najemnik�w.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Nie.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Wi�c po choler� zawracasz mi g�ow�?
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
	description	= "Jak mog� zdoby� szacunek pozosta�ych najemnik�w?";
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
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Jak mog� zdoby� szacunek pozosta�ych najemnik�w?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //Wi�kszo�ci z nich wystarczy, �e wype�nisz moje zadanie.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //Ale cz�� z nich trzeba b�dzie przekona� w inny spos�b.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //Niekt�rzy spr�buj� wykorzysta� sytuacj�, innym mo�e si� po prostu nie spodoba� twoja bu�ka.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //Spr�buj skumplowa� si� z mo�liwie du�� cz�ci� grupy. Ostatecznie zawsze mo�esz wzi�� udzia� w pojedynku.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Je�li wygrasz, zdob�dziesz szacunek wi�kszo�ci najemnik�w. Tylko w �adnym razie nie zabij kt�rego� z nich, bo dopiero wtedy b�dziesz mia� problem.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Je�li chc� zyska� szacunek pozosta�ych najemnik�w, musz� przej�� przez pr�b� Torlofa albo pokona� ich w pojedynku.");
	
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
	description	= "Jakie s� regu�y pojedynku?";
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
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Jakie s� zasady pojedynku?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Bardzo proste. Uczestnicy musz� mie� szans� na wyci�gni�cie or�a, nim padnie pierwszy cios.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Nie mo�esz tak po prostu przy�o�y� komu�, bez ostrze�enia.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Walk� musi poprzedzi� s�owne wyzwanie. Wystarczy solidna obelga lub inny pow�d do bitki.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //�aden z widz�w nie ma prawa w��czy� si� do walki, chyba �e jeden z jej uczestnik�w zostanie zabity.
	
	B_LogEntry (TOPIC_SLDRespekt,"Zasady pojedynku: nale�y zacz�� od wyzwania przeciwnika, dzi�ki czemu w walk� nie zaanga�uj� si� osoby postronne. Nie wolno zabi� rywala.");
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
	description	= "A co z tob�? Mog� liczy� na tw�j g�os?";
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
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //A co z tob�? Mog� liczy� na tw�j g�os?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Je�li udowodnisz mi, �e poradzisz sobie jako najemnik - tak.
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
	description	= "Co s�dz� o mnie najemnicy?";
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
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Co s�dz� o mnie najemnicy?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Pomy�lmy...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Wilk m�wi, �e nie ma nic przeciwko tobie.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis s�dzi, �e si� nadasz.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis ci�gle nie jest pewien, czy si� nadasz.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Nie chce tutaj wi�cej idiot�w pokroju Sylvia. Prawd� m�wi�c - ja te� nie.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord uwa�a, �e mo�esz do nas do��czy�.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Cord uwa�a, �e musisz najpierw podszkoli� si� troch� w walce or�em.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher m�wi, �e musimy ci� koniecznie przyj��. Chyba ma o tobie bardzo wysokie mniemanie.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher m�wi, �e jeste� mu winien przys�ug�, i �e b�dziesz wiedzia�, o co chodzi.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod chce po prostu odzyska� sw�j miecz.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Chyba przekona�e� Roda, �e jeste� wystarczaj�co silny.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod uwa�a ci� za mi�czaka.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza b�dzie na ciebie g�osowa�. Twierdzi, �e r�wny z ciebie go��.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza nie b�dzie na ciebie g�osowa�. Podobno jeste� mu winien 50 sztuk z�ota.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul jest przeciw tobie. Facet chyba ci� po prostu nie lubi.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //O Sylviu i Bullku nie musz� chyba nawet m�wi�. Ci dwaj kretyni nie popr� nikogo.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster m�wi, �e jeste� w porz�dku.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //Chocia� z nim przegra�e�.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster powiedzia� mi, �e stch�rzy�e�, gdy wyzwa� ci� na pojedynek.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //To by� kiepski pomys�. Mo�e powiniene� wr�ci� i wyzwa� go jeszcze raz?
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //A Dar ma ci� za kapusia. Na szcz�cie dla ciebie jego g�osem nikt si� tutaj nie przejmuje.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Reszta najemnik�w nie zaj�a �adnego stanowiska.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //Wi�kszo�� z nich czeka, aby przekona� si�, czy przejdziesz moj� pr�b�.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //Wi�kszo�� z nich przekona�e�, przechodz�c pr�b�.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //Nawet je�li Cord si� temu troch� przys�u�y�...
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //Chocia� niekt�rzy s�dz�, �e zmuszenie farmera do zap�acenia czynszu to zbyt �atwe zadanie.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //Na m�j g�os mo�esz w ka�dym razie liczy�.
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
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //I wygra�e� kilka uczciwych pojedynk�w.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //Dla najemnik�w to bardzo wa�ne.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //W ka�dym razie wygra�e� ju� par� uczciwych pojedynk�w.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //ge�ndert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 f�r Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //Wi�kszo�� najemnik�w stoi za tob�. Je�li o mnie chodzi - mo�esz zaczyna� od zaraz.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //Id� do Lee. On ci wyja�ni ca�� reszt�.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Zdoby�em szacunek najemnik�w. Czas na rozmow� z Lee."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //Ca�kiem nie�le, ale to ci�gle za ma�o.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Musisz si� jeszcze troch� powysila�.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Musisz si� jeszcze d�ugo stara�, ch�opcze. Je�li chcesz do nas do��czy�, musisz si� troch� pom�czy�.
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
	description	= "Jakie b�d� moje obowi�zki?";
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
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //Jakie b�d� moje obowi�zki?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar wynaj�� nas z dw�ch powod�w: mamy trzyma� na dystans stra�nik�w i pilnowa� porz�dku na farmach.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //A to obejmuje tak�e �ci�ganie czynszu, gdy pomniejsi farmerzy nie chc� p�aci�.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //No wi�c, jak b�dzie?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Zdob�d� te pieni�dze!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Bez obaw. Zajm� si� tymi stra�nikami.", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Dobrze. S�uchaj: od kilku tygodni farmer Sekob nie p�aci Onarowi czynszu.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar chce, �eby�my wydusili z niego 50 sztuk z�ota. Jakie� pytania?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Gdzie le�y farma Sekoba?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //W p�nocnej cz�ci doliny. Patrz�c st�d, musisz skr�ci� w prawo na du�ych rozstajach dr�g.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Gdyby� si� zgubi�, wie�niacy na polach wska�� ci w�a�ciw� drog�.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof prosi� mnie o odebranie czynszu od farmera Sekoba, kt�ry jest winien 50 sztuk z�ota.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Farmer Bengar marudzi, �e miejscy stra�nicy strasznie mu si� ostatnio naprzykrzaj�.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Utrudniaj� mu �ycie, jak mog�. Pewnie chc�, �eby zerwa� z Onarem.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Chc�, �eby� poszed� na jego farm� i wbi� tym stra�nikom do g�owy, �e nie maj� tam czego szuka�. Jakie� pytania?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Gdzie le�y farma Bengara?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //W po�udniowo-zachodniej cz�ci doliny znajdziesz wielkie schody, prowadz�ce na p�askowy�. Tam le�y farma Bengara.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Gdyby� si� zgubi�, wie�niacy na polach wska�� ci w�a�ciw� drog�.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof prosi� mnie o pozbycie si� najemnik�w z farmy Bengara, znajduj�cej si� na p�askowy�u.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Zdob�d� te pieni�dze!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Bez obaw. Zajm� si� tymi stra�nikami.
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
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Cholernie d�ugo ci zesz�o. Onar nie b�dzie zachwycony.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //A los paladyn�w w G�rniczej Dolinie ma g��boko... w powa�aniu.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Dobra robota! Gdyby pojawi�o si� co� nowego, dam ci zna�!
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
	description	= "Odebra�em zaleg�y czynsz od Sekoba.";
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
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Odebra�em zaleg�y czynsz od Sekoba.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //Tak? Stwarza jakie� problemy?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //C�, mia�... �miertelny wypadek.
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Musia�em go najpierw przekona�.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Dobra robota! Przeszed�e� pr�b�. To powinno przekona� wielu najemnik�w, �e nadajesz si� do tej roboty.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Wykona�em zadanie, kt�re otrzyma�em od Torlofa."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //I co? Przepi�e� wszystko? Dawaj pieni�dze, i to szybko!
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
	description	= "Rozwi�za�em problemy Bengara ze stra�nikami.";
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
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Rozwi�za�em problemy Bengara ze stra�nikami.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Upewni�e� si�, �e nie wr�c� na jego farm� nast�pnego dnia?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //No c�, raczej im si� to nie uda... zwi�le m�wi�c.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Dobra robota!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Przeszed�e� pr�b�. Kto�, kto poradzi� sobie ze stra�nikami, zas�uguje na nasz szacunek.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Wykona�em zadanie, kt�re otrzyma�em od Torlofa."); 
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
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //Witamy w�r�d najemnik�w!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //Dzi�ki!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Jak tylko pojawi si� jaka� robota, dam ci zna�.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Gdzie si� podziewa�e�?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //By�em w G�rniczej Dolinie. Tam s� smoki! Paladynom nie�le si� od nich oberwa�o.
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Czy�by? Zatem w tych opowie�ciach jest jednak troch� prawdy.
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Lee na pewno si� tym zainteresuje.
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
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Dobrze, �e tu jeste�. Mam dla ciebie rob�tk�...
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //O co chodzi?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //Tylko masz sko�czy� do jutra!
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
	description = "Pomo�esz mi popracowa� nad moimi umiej�tno�ciami?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //Pomo�esz mi popracowa� nad moimi umiej�tno�ciami?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //M�g�bym ci pokaza�, jak wykorzystywa� swoj� si�� w bezpo�redniej walce.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Wielu wojownik�w dostaje baty, bo nie potrafi odpowiednio spo�ytkowa� swojej si�y.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //Podobnie jest ze zr�czno�ci� i walk� na dystans.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof mo�e mi pokaza�, jak sta� si� zr�czniejszym i silniejszym.");
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
	description = "Pom� mi popracowa� nad moimi umiej�tno�ciami.";
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
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Chc� zwi�kszy� moje umiej�tno�ci.
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
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //Powiedzia�em, �e M�G�BYM ci pom�c, a nie, �e to ZROBI�.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Dop�ki nie zostaniesz jednym z nas, szukaj sobie innego nauczyciela.
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //�wietnie! Teraz mo�esz skuteczniej wykorzystywa� swoje umiej�tno�ci.
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

	description	 = 	"Masz dla mnie jakie� nowe zadania?";
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
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Masz dla mnie jakie� nowe zadania?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Widzia�e� tych go�ci w czarnych kapturach, kt�rzy kr�c� si� w pobli�u? Jest z nimi co� nie tak, m�wi� ci.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Gdy by�em na morzu, widywa�em r�ne dziwne rzeczy, ale tych zakapturzonych naprawd� si� boj�.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //Poszli w kierunku obozu bandyt�w, pod g�rami na po�udniowym kra�cu doliny.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Mo�e powiniene� si� tam wybra� i zrobi� z nimi porz�dek?
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"W g�rskim obozie bandyt�w, znajduj�cym si� na po�udnie od doliny, pono� przebywa kilku z tych zakapturzonych m�czyzn, kt�rzy ostatnio sprawiali problemy Torlofowi. Zamierzam rozwi�za� ten problem raz na zawsze."); 

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

	description	 = 	"Nie musisz si� ju� obawia� tych zakapturzonych postaci z g�r.";
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
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Nie musisz ju� si� obawia� tych zakapturzonych postaci z g�r.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Za�atwi�e� ich? Gratuluj�.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Co� mi si� w nich nie podoba�o. Za�o�� si�, �e mieliby�my przez nich niez�e k�opoty.
	
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

	description	 = 	"Cz�� najemnik�w odesz�a chyba z farmy?";
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
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //Cz�� najemnik�w odesz�a chyba z farmy?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio zabra� kilku ch�opak�w i poprowadzi� ich na prze��cz.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //Plotka g�osi, �e pokaza�y si� tam smoki. Jak Sylvio si� o tym dowiedzia�, nie mo�na go by�o powstrzyma�.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Kto wie? Za smoczy �eb mo�na pewnie dosta� kup� pieni�dzy.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //Ale to nie dla mnie. Jestem �eglarzem. Moje miejsce jest na morzu, a nie w cuchn�cej smoczej jamie.

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

	description	 = 	"Jeste� �eglarzem?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //Jeste� �eglarzem?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //No, nareszcie za�apa�e�! Tak, do diaska, jestem. Czemu pytasz?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Przyda�by mi si� kto� taki jak ty. Zamierzam pop�yn�� na pewn� wysp�.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //Na wysp�? Nie masz nawet statku, nie m�wi�c o za�odze.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Nie nie nie, ch�opcze. Je�li mam by� twoim kapitanem i nauczycielem, musisz mi najpierw udowodni�, �e wiesz, o co w tym wszystkim chodzi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Mam zreszt� teraz inne zmartwienie. Wbrew naszym przewidywaniom, paladyni nie opu�cili miasta.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Potrzeba nie lada powodu, by ich wyci�gn�� w pole.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //Id� do zamku w G�rniczej Dolinie, wykradnij stra�nikowi klucz do g��wnej bramy i otw�rz j�. Reszt� zajm� si� orkowie.

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Zanim Torlof przyjmie posad� kapitana, musz� pozby� si� z miasta paladyn�w. Torlof wpad� na pomys� zaaran�owania niewielkiego wypadku na zamku w G�rniczej Dolinie - chce, abym ukrad� stra�nikowi klucz od g��wnej bramy i wpu�ci� ork�w do �rodka. Ma nadziej�, �e paladyni z miasta wyrusz� wtedy z odsiecz�.");
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

	description	 = 	"Brama do zamku w G�rniczej Dolinie jest ju� otwarta...";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Brama do zamku w G�rniczej Dolinie jest ju� otwarta i zablokowana. Nic teraz nie powstrzyma szturmu ork�w.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Za�oga zamku ponios�a ci�kie straty.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //Paladyni z miasta powinni wkr�tce wyruszy� do Doliny, by wyci�gn�� swoich towarzyszy z obl�onego zamku.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //To �wietna wiadomo��. Teraz nic mnie ju� nie powstrzyma przed wyrwaniem si� z tego przekl�tego miejsca.
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

	description	 = 	"Czy teraz pomo�esz mi dosta� si� na wysp�?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Czy teraz pomo�esz mi dosta� si� na wysp�?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //A, fakt. Chcia�e�, �ebym z tob� pop�yn��. S�uchaj, zrobimy tak:
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Zap�a� mi 2500 sztuk z�ota, a ja poprowadz� tw�j okr�t.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Za t� sum� naucz� ci� tak�e wszystkiego, co wiem o sile i zr�czno�ci.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "To bardzo du�a suma.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "W porz�dku. Oto twoje z�oto.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //To bardzo du�a suma.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //Pomoc specjalisty musi kosztowa�. Poza tym, nie masz wyboru. Nie znajdziesz tutaj nikogo innego, kto potrafi dowodzi� okr�tem.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Tak wi�c p�a� i nie marud�.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof zgadza si� obj�� obowi�zki kapitana statku, jednak ��da za to zap�aty w wysoko�ci 2500 sztuk z�ota.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //W porz�dku. Oto twoje z�oto.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //�wietnie. Teraz musisz mi tylko powiedzie�, co mam zrobi�.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Torlof dosta� ode mnie 2500 sztuk z�ota i jest got�w wyruszy� w ka�dej chwili.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Chcesz mi zmydli� oczy paroma monetami? Zdob�d� ca�� sum�, a wtedy pogadamy.
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

	description	 = 	"Zosta� kapitanem mojego statku.";
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
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //Zosta� kapitanem mojego statku.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //W porz�dku. Daj mi statek i odpowiedni� za�og�, a pop�yn� z tob� nawet na koniec �wiata.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //A masz odpowiedni� map� morsk�? Bez niej daleko nie dop�yniemy.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //To ju� moje zmartwienie. Spotkamy si� na przystani.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //Ciekaw jestem. jak tego dokonasz.
	
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

	description	 = 	"Mo�emy rusza� w drog�.";
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
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Mo�emy rusza� w drog�.

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Dobra. Daj mi map� i odp�ywamy.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //Wszyscy na pok�ad!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Na pewno masz wszystko, czego potrzeba? Nie b�dziemy zawraca� w p� drogi!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Je�li jeste� pewien, walnij si� na koj� w kajucie kapitana. Podr� troch� potrwa.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //Nie ma statku, nie ma za�ogi, nie ma mapy, nie ma podr�y!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Potrzebuj� co najmniej pi�ciu ludzi zdatnych do pomocy na morzu.
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

	description	 = 	"Zdecydowa�em si� na innego kapitana.";
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
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Zdecydowa�em si� na innego kapitana. Mo�esz mi odda� moje pieni�dze.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //Chyba �nisz! Nie ma mowy! Jak p�acisz z g�ry, a potem zmieniasz zdanie, to ju� tw�j problem.
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

































































