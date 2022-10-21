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
	description	= "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
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
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Chcê siê przy³¹czyæ do najemników.
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Tak? A dlaczego niby mia³bym pozwoliæ, ¿ebyœ do nas do³¹czy³?
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
	description	= "Poddaj mnie próbie!";
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
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Poddaj mnie próbie!
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Czy to Lee przys³a³ ciê do mnie?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //Powiedzia³, ¿e mo¿esz mi pomóc.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //Aj... No dobra, niech ju¿ bêdzie. Zanim pozwolimy ci do nas do³¹czyæ, musisz zrobiæ dwie rzeczy.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Po pierwsze: musisz udowodniæ, ¿e nadajesz siê do roboty najemnika. W tym celu poddam ciê próbie.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //Po drugie: musisz zas³u¿yæ na szacunek pozosta³ych ch³opaków.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Start"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Aby móc zostaæ najemnikiem, muszê poddaæ siê próbie Torlofa i zyskaæ szacunek pozosta³ych najemników.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Nie.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Wiêc po cholerê zawracasz mi g³owê?
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
	description	= "Jak mogê zdobyæ szacunek pozosta³ych najemników?";
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
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Jak mogê zdobyæ szacunek pozosta³ych najemników?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //Wiêkszoœci z nich wystarczy, ¿e wype³nisz moje zadanie.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //Ale czêœæ z nich trzeba bêdzie przekonaæ w inny sposób.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //Niektórzy spróbuj¹ wykorzystaæ sytuacjê, innym mo¿e siê po prostu nie spodobaæ twoja buŸka.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //Spróbuj skumplowaæ siê z mo¿liwie du¿¹ czêœci¹ grupy. Ostatecznie zawsze mo¿esz wzi¹æ udzia³ w pojedynku.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Jeœli wygrasz, zdobêdziesz szacunek wiêkszoœci najemników. Tylko w ¿adnym razie nie zabij któregoœ z nich, bo dopiero wtedy bêdziesz mia³ problem.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Jeœli chcê zyskaæ szacunek pozosta³ych najemników, muszê przejœæ przez próbê Torlofa albo pokonaæ ich w pojedynku.");
	
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
	description	= "Jakie s¹ regu³y pojedynku?";
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
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Jakie s¹ zasady pojedynku?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Bardzo proste. Uczestnicy musz¹ mieæ szansê na wyci¹gniêcie orê¿a, nim padnie pierwszy cios.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Nie mo¿esz tak po prostu przy³o¿yæ komuœ, bez ostrze¿enia.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Walkê musi poprzedziæ s³owne wyzwanie. Wystarczy solidna obelga lub inny powód do bitki.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //¯aden z widzów nie ma prawa w³¹czyæ siê do walki, chyba ¿e jeden z jej uczestników zostanie zabity.
	
	B_LogEntry (TOPIC_SLDRespekt,"Zasady pojedynku: nale¿y zacz¹æ od wyzwania przeciwnika, dziêki czemu w walkê nie zaanga¿uj¹ siê osoby postronne. Nie wolno zabiæ rywala.");
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
	description	= "A co z tob¹? Mogê liczyæ na twój g³os?";
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
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //A co z tob¹? Mogê liczyæ na twój g³os?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Jeœli udowodnisz mi, ¿e poradzisz sobie jako najemnik - tak.
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
	description	= "Co s¹dz¹ o mnie najemnicy?";
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
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Co s¹dz¹ o mnie najemnicy?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Pomyœlmy...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Wilk mówi, ¿e nie ma nic przeciwko tobie.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis s¹dzi, ¿e siê nadasz.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis ci¹gle nie jest pewien, czy siê nadasz.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Nie chce tutaj wiêcej idiotów pokroju Sylvia. Prawdê mówi¹c - ja te¿ nie.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord uwa¿a, ¿e mo¿esz do nas do³¹czyæ.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Cord uwa¿a, ¿e musisz najpierw podszkoliæ siê trochê w walce orê¿em.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher mówi, ¿e musimy ciê koniecznie przyj¹æ. Chyba ma o tobie bardzo wysokie mniemanie.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher mówi, ¿e jesteœ mu winien przys³ugê, i ¿e bêdziesz wiedzia³, o co chodzi.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod chce po prostu odzyskaæ swój miecz.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Chyba przekona³eœ Roda, ¿e jesteœ wystarczaj¹co silny.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod uwa¿a ciê za miêczaka.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza bêdzie na ciebie g³osowa³. Twierdzi, ¿e równy z ciebie goœæ.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza nie bêdzie na ciebie g³osowa³. Podobno jesteœ mu winien 50 sztuk z³ota.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul jest przeciw tobie. Facet chyba ciê po prostu nie lubi.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //O Sylviu i Bullku nie muszê chyba nawet mówiæ. Ci dwaj kretyni nie popr¹ nikogo.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster mówi, ¿e jesteœ w porz¹dku.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //Chocia¿ z nim przegra³eœ.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster powiedzia³ mi, ¿e stchórzy³eœ, gdy wyzwa³ ciê na pojedynek.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //To by³ kiepski pomys³. Mo¿e powinieneœ wróciæ i wyzwaæ go jeszcze raz?
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //A Dar ma ciê za kapusia. Na szczêœcie dla ciebie jego g³osem nikt siê tutaj nie przejmuje.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Reszta najemników nie zajê³a ¿adnego stanowiska.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //Wiêkszoœæ z nich czeka, aby przekonaæ siê, czy przejdziesz moj¹ próbê.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //Wiêkszoœæ z nich przekona³eœ, przechodz¹c próbê.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //Nawet jeœli Cord siê temu trochê przys³u¿y³...
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //Chocia¿ niektórzy s¹dz¹, ¿e zmuszenie farmera do zap³acenia czynszu to zbyt ³atwe zadanie.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //Na mój g³os mo¿esz w ka¿dym razie liczyæ.
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
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //I wygra³eœ kilka uczciwych pojedynków.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //Dla najemników to bardzo wa¿ne.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //W ka¿dym razie wygra³eœ ju¿ parê uczciwych pojedynków.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //geändert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 für Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //Wiêkszoœæ najemników stoi za tob¹. Jeœli o mnie chodzi - mo¿esz zaczynaæ od zaraz.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //IdŸ do Lee. On ci wyjaœni ca³¹ resztê.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Zdoby³em szacunek najemników. Czas na rozmowê z Lee."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //Ca³kiem nieŸle, ale to ci¹gle za ma³o.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Musisz siê jeszcze trochê powysilaæ.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Musisz siê jeszcze d³ugo staraæ, ch³opcze. Jeœli chcesz do nas do³¹czyæ, musisz siê trochê pomêczyæ.
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
	description	= "Jakie bêd¹ moje obowi¹zki?";
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
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //Jakie bêd¹ moje obowi¹zki?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar wynaj¹³ nas z dwóch powodów: mamy trzymaæ na dystans stra¿ników i pilnowaæ porz¹dku na farmach.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //A to obejmuje tak¿e œci¹ganie czynszu, gdy pomniejsi farmerzy nie chc¹ p³aciæ.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //No wiêc, jak bêdzie?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Zdobêdê te pieni¹dze!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Bez obaw. Zajmê siê tymi stra¿nikami.", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Dobrze. S³uchaj: od kilku tygodni farmer Sekob nie p³aci Onarowi czynszu.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar chce, ¿ebyœmy wydusili z niego 50 sztuk z³ota. Jakieœ pytania?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Gdzie le¿y farma Sekoba?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //W pó³nocnej czêœci doliny. Patrz¹c st¹d, musisz skrêciæ w prawo na du¿ych rozstajach dróg.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Gdybyœ siê zgubi³, wieœniacy na polach wska¿¹ ci w³aœciw¹ drogê.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof prosi³ mnie o odebranie czynszu od farmera Sekoba, który jest winien 50 sztuk z³ota.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Farmer Bengar marudzi, ¿e miejscy stra¿nicy strasznie mu siê ostatnio naprzykrzaj¹.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Utrudniaj¹ mu ¿ycie, jak mog¹. Pewnie chc¹, ¿eby zerwa³ z Onarem.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Chcê, ¿ebyœ poszed³ na jego farmê i wbi³ tym stra¿nikom do g³owy, ¿e nie maj¹ tam czego szukaæ. Jakieœ pytania?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Gdzie le¿y farma Bengara?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //W po³udniowo-zachodniej czêœci doliny znajdziesz wielkie schody, prowadz¹ce na p³askowy¿. Tam le¿y farma Bengara.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Gdybyœ siê zgubi³, wieœniacy na polach wska¿¹ ci w³aœciw¹ drogê.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof prosi³ mnie o pozbycie siê najemników z farmy Bengara, znajduj¹cej siê na p³askowy¿u.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Zdobêdê te pieni¹dze!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Bez obaw. Zajmê siê tymi stra¿nikami.
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
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Cholernie d³ugo ci zesz³o. Onar nie bêdzie zachwycony.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //A los paladynów w Górniczej Dolinie ma g³êboko... w powa¿aniu.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Dobra robota! Gdyby pojawi³o siê coœ nowego, dam ci znaæ!
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
	description	= "Odebra³em zaleg³y czynsz od Sekoba.";
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
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Odebra³em zaleg³y czynsz od Sekoba.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //Tak? Stwarza jakieœ problemy?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //Có¿, mia³... œmiertelny wypadek.
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Musia³em go najpierw przekonaæ.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Dobra robota! Przeszed³eœ próbê. To powinno przekonaæ wielu najemników, ¿e nadajesz siê do tej roboty.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Wykona³em zadanie, które otrzyma³em od Torlofa."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //I co? Przepi³eœ wszystko? Dawaj pieni¹dze, i to szybko!
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
	description	= "Rozwi¹za³em problemy Bengara ze stra¿nikami.";
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
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Rozwi¹za³em problemy Bengara ze stra¿nikami.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Upewni³eœ siê, ¿e nie wróc¹ na jego farmê nastêpnego dnia?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //No có¿, raczej im siê to nie uda... zwiêŸle mówi¹c.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Dobra robota!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Przeszed³eœ próbê. Ktoœ, kto poradzi³ sobie ze stra¿nikami, zas³uguje na nasz szacunek.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Wykona³em zadanie, które otrzyma³em od Torlofa."); 
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
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //Witamy wœród najemników!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //Dziêki!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Jak tylko pojawi siê jakaœ robota, dam ci znaæ.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Gdzie siê podziewa³eœ?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //By³em w Górniczej Dolinie. Tam s¹ smoki! Paladynom nieŸle siê od nich oberwa³o.
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Czy¿by? Zatem w tych opowieœciach jest jednak trochê prawdy.
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Lee na pewno siê tym zainteresuje.
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
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Dobrze, ¿e tu jesteœ. Mam dla ciebie robótkê...
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //O co chodzi?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //Tylko masz skoñczyæ do jutra!
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
	description = "Pomo¿esz mi popracowaæ nad moimi umiejêtnoœciami?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //Pomo¿esz mi popracowaæ nad moimi umiejêtnoœciami?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Móg³bym ci pokazaæ, jak wykorzystywaæ swoj¹ si³ê w bezpoœredniej walce.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Wielu wojowników dostaje baty, bo nie potrafi odpowiednio spo¿ytkowaæ swojej si³y.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //Podobnie jest ze zrêcznoœci¹ i walk¹ na dystans.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof mo¿e mi pokazaæ, jak staæ siê zrêczniejszym i silniejszym.");
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
	description = "Pomó¿ mi popracowaæ nad moimi umiejêtnoœciami.";
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
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Chcê zwiêkszyæ moje umiejêtnoœci.
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
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //Powiedzia³em, ¿e MÓG£BYM ci pomóc, a nie, ¿e to ZROBIÊ.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Dopóki nie zostaniesz jednym z nas, szukaj sobie innego nauczyciela.
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //Œwietnie! Teraz mo¿esz skuteczniej wykorzystywaæ swoje umiejêtnoœci.
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

	description	 = 	"Masz dla mnie jakieœ nowe zadania?";
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
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Masz dla mnie jakieœ nowe zadania?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Widzia³eœ tych goœci w czarnych kapturach, którzy krêc¹ siê w pobli¿u? Jest z nimi coœ nie tak, mówiê ci.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Gdy by³em na morzu, widywa³em ró¿ne dziwne rzeczy, ale tych zakapturzonych naprawdê siê bojê.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //Poszli w kierunku obozu bandytów, pod górami na po³udniowym krañcu doliny.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Mo¿e powinieneœ siê tam wybraæ i zrobiæ z nimi porz¹dek?
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"W górskim obozie bandytów, znajduj¹cym siê na po³udnie od doliny, ponoæ przebywa kilku z tych zakapturzonych mê¿czyzn, którzy ostatnio sprawiali problemy Torlofowi. Zamierzam rozwi¹zaæ ten problem raz na zawsze."); 

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

	description	 = 	"Nie musisz siê ju¿ obawiaæ tych zakapturzonych postaci z gór.";
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
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Nie musisz ju¿ siê obawiaæ tych zakapturzonych postaci z gór.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Za³atwi³eœ ich? Gratulujê.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Coœ mi siê w nich nie podoba³o. Za³o¿ê siê, ¿e mielibyœmy przez nich niez³e k³opoty.
	
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

	description	 = 	"Czêœæ najemników odesz³a chyba z farmy?";
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
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //Czêœæ najemników odesz³a chyba z farmy?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio zabra³ kilku ch³opaków i poprowadzi³ ich na prze³êcz.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //Plotka g³osi, ¿e pokaza³y siê tam smoki. Jak Sylvio siê o tym dowiedzia³, nie mo¿na go by³o powstrzymaæ.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Kto wie? Za smoczy ³eb mo¿na pewnie dostaæ kupê pieniêdzy.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //Ale to nie dla mnie. Jestem ¿eglarzem. Moje miejsce jest na morzu, a nie w cuchn¹cej smoczej jamie.

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

	description	 = 	"Jesteœ ¿eglarzem?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //Jesteœ ¿eglarzem?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //No, nareszcie za³apa³eœ! Tak, do diaska, jestem. Czemu pytasz?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Przyda³by mi siê ktoœ taki jak ty. Zamierzam pop³yn¹æ na pewn¹ wyspê.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //Na wyspê? Nie masz nawet statku, nie mówi¹c o za³odze.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Nie nie nie, ch³opcze. Jeœli mam byæ twoim kapitanem i nauczycielem, musisz mi najpierw udowodniæ, ¿e wiesz, o co w tym wszystkim chodzi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Mam zreszt¹ teraz inne zmartwienie. Wbrew naszym przewidywaniom, paladyni nie opuœcili miasta.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Potrzeba nie lada powodu, by ich wyci¹gn¹æ w pole.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //IdŸ do zamku w Górniczej Dolinie, wykradnij stra¿nikowi klucz do g³ównej bramy i otwórz j¹. Reszt¹ zajm¹ siê orkowie.

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Zanim Torlof przyjmie posadê kapitana, muszê pozbyæ siê z miasta paladynów. Torlof wpad³ na pomys³ zaaran¿owania niewielkiego wypadku na zamku w Górniczej Dolinie - chce, abym ukrad³ stra¿nikowi klucz od g³ównej bramy i wpuœci³ orków do œrodka. Ma nadziejê, ¿e paladyni z miasta wyrusz¹ wtedy z odsiecz¹.");
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

	description	 = 	"Brama do zamku w Górniczej Dolinie jest ju¿ otwarta...";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Brama do zamku w Górniczej Dolinie jest ju¿ otwarta i zablokowana. Nic teraz nie powstrzyma szturmu orków.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Za³oga zamku ponios³a ciê¿kie straty.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //Paladyni z miasta powinni wkrótce wyruszyæ do Doliny, by wyci¹gn¹æ swoich towarzyszy z oblê¿onego zamku.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //To œwietna wiadomoœæ. Teraz nic mnie ju¿ nie powstrzyma przed wyrwaniem siê z tego przeklêtego miejsca.
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

	description	 = 	"Czy teraz pomo¿esz mi dostaæ siê na wyspê?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Czy teraz pomo¿esz mi dostaæ siê na wyspê?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //A, fakt. Chcia³eœ, ¿ebym z tob¹ pop³yn¹³. S³uchaj, zrobimy tak:
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Zap³aæ mi 2500 sztuk z³ota, a ja poprowadzê twój okrêt.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Za tê sumê nauczê ciê tak¿e wszystkiego, co wiem o sile i zrêcznoœci.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "To bardzo du¿a suma.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "W porz¹dku. Oto twoje z³oto.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //To bardzo du¿a suma.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //Pomoc specjalisty musi kosztowaæ. Poza tym, nie masz wyboru. Nie znajdziesz tutaj nikogo innego, kto potrafi dowodziæ okrêtem.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Tak wiêc p³aæ i nie marudŸ.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof zgadza siê obj¹æ obowi¹zki kapitana statku, jednak ¿¹da za to zap³aty w wysokoœci 2500 sztuk z³ota.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //W porz¹dku. Oto twoje z³oto.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //Œwietnie. Teraz musisz mi tylko powiedzieæ, co mam zrobiæ.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Torlof dosta³ ode mnie 2500 sztuk z³ota i jest gotów wyruszyæ w ka¿dej chwili.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Chcesz mi zmydliæ oczy paroma monetami? Zdob¹dŸ ca³¹ sumê, a wtedy pogadamy.
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

	description	 = 	"Zostañ kapitanem mojego statku.";
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
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //Zostañ kapitanem mojego statku.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //W porz¹dku. Daj mi statek i odpowiedni¹ za³ogê, a pop³ynê z tob¹ nawet na koniec œwiata.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //A masz odpowiedni¹ mapê morsk¹? Bez niej daleko nie dop³yniemy.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //To ju¿ moje zmartwienie. Spotkamy siê na przystani.
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

	description	 = 	"Mo¿emy ruszaæ w drogê.";
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
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Mo¿emy ruszaæ w drogê.

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Dobra. Daj mi mapê i odp³ywamy.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //Wszyscy na pok³ad!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Na pewno masz wszystko, czego potrzeba? Nie bêdziemy zawracaæ w pó³ drogi!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Jeœli jesteœ pewien, walnij siê na kojê w kajucie kapitana. Podró¿ trochê potrwa.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //Nie ma statku, nie ma za³ogi, nie ma mapy, nie ma podró¿y!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Potrzebujê co najmniej piêciu ludzi zdatnych do pomocy na morzu.
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

	description	 = 	"Zdecydowa³em siê na innego kapitana.";
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
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Zdecydowa³em siê na innego kapitana. Mo¿esz mi oddaæ moje pieni¹dze.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //Chyba œnisz! Nie ma mowy! Jak p³acisz z góry, a potem zmieniasz zdanie, to ju¿ twój problem.
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

































































