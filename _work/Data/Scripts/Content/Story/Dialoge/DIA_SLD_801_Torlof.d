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
	description	= "Chcę się przyłączyć do najemników. Masz coś przeciwko temu?";
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
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Chcę się przyłączyć do najemników.
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Tak? A dlaczego niby miałbym pozwolić, żebyś do nas dołączył?
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
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Czy to Lee przysłał cię do mnie?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //Powiedział, że możesz mi pomóc.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //Aj... No dobra, niech już będzie. Zanim pozwolimy ci do nas dołączyć, musisz zrobić dwie rzeczy.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Po pierwsze: musisz udowodnić, że nadajesz się do roboty najemnika. W tym celu poddam cię próbie.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //Po drugie: musisz zasłużyć na szacunek pozostałych chłopaków.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Start"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Aby móc zostać najemnikiem, muszę poddać się próbie Torlofa i zyskać szacunek pozostałych najemników.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Nie.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Więc po cholerę zawracasz mi głowę?
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
	description	= "Jak mogę zdobyć szacunek pozostałych najemników?";
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
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Jak mogę zdobyć szacunek pozostałych najemników?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //Większości z nich wystarczy, że wypełnisz moje zadanie.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //Ale część z nich trzeba będzie przekonać w inny sposób.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //Niektórzy spróbują wykorzystać sytuację, innym może się po prostu nie spodobać twoja buźka.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //Spróbuj skumplować się z możliwie dużą częścią grupy. Ostatecznie zawsze możesz wziąć udział w pojedynku.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Jeśli wygrasz, zdobędziesz szacunek większości najemników. Tylko w żadnym razie nie zabij któregoś z nich, bo dopiero wtedy będziesz miał problem.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Jeśli chcę zyskać szacunek pozostałych najemników, muszę przejść przez próbę Torlofa albo pokonać ich w pojedynku.");
	
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
	description	= "Jakie są reguły pojedynku?";
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
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Jakie są zasady pojedynku?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Bardzo proste. Uczestnicy muszą mieć szansę na wyciągnięcie oręża, nim padnie pierwszy cios.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Nie możesz tak po prostu przyłożyć komuś, bez ostrzeżenia.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Walkę musi poprzedzić słowne wyzwanie. Wystarczy solidna obelga lub inny powód do bitki.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //Żaden z widzów nie ma prawa włączyć się do walki, chyba że jeden z jej uczestników zostanie zabity.
	
	B_LogEntry (TOPIC_SLDRespekt,"Zasady pojedynku: należy zacząć od wyzwania przeciwnika, dzięki czemu w walkę nie zaangażują się osoby postronne. Nie wolno zabić rywala.");
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
	description	= "A co z tobą? Mogę liczyć na twój głos?";
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
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //A co z tobą? Mogę liczyć na twój głos?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Jeśli udowodnisz mi, że poradzisz sobie jako najemnik - tak.
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
	description	= "Co sądzą o mnie najemnicy?";
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
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Co sądzą o mnie najemnicy?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Pomyślmy...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Wilk mówi, że nie ma nic przeciwko tobie.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis sądzi, że się nadasz.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis ciągle nie jest pewien, czy się nadasz.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Nie chce tutaj więcej idiotów pokroju Sylvia. Prawdę mówiąc - ja też nie.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord uważa, że możesz do nas dołączyć.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Cord uważa, że musisz najpierw podszkolić się trochę w walce orężem.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher mówi, że musimy cię koniecznie przyjąć. Chyba ma o tobie bardzo wysokie mniemanie.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher mówi, że jesteś mu winien przysługę, i że będziesz wiedział, o co chodzi.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod chce po prostu odzyskać swój miecz.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Chyba przekonałeś Roda, że jesteś wystarczająco silny.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod uważa cię za mięczaka.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza będzie na ciebie głosował. Twierdzi, że równy z ciebie gość.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza nie będzie na ciebie głosował. Podobno jesteś mu winien 50 sztuk złota.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul jest przeciw tobie. Facet chyba cię po prostu nie lubi.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //O Sylviu i Bullku nie muszę chyba nawet mówić. Ci dwaj kretyni nie poprą nikogo.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster mówi, że jesteś w porządku.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //Chociaż z nim przegrałeś.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster powiedział mi, że stchórzyłeś, gdy wyzwał cię na pojedynek.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //To był kiepski pomysł. Może powinieneś wrócić i wyzwać go jeszcze raz?
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //A Dar ma cię za kapusia. Na szczęście dla ciebie jego głosem nikt się tutaj nie przejmuje.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Reszta najemników nie zajęła żadnego stanowiska.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //Większość z nich czeka, aby przekonać się, czy przejdziesz moją próbę.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //Większość z nich przekonałeś, przechodząc próbę.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //Nawet jeśli Cord się temu trochę przysłużył...
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //Chociaż niektórzy sądzą, że zmuszenie farmera do zapłacenia czynszu to zbyt łatwe zadanie.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //Na mój głos możesz w każdym razie liczyć.
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
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //I wygrałeś kilka uczciwych pojedynków.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //Dla najemników to bardzo ważne.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //W każdym razie wygrałeś już parę uczciwych pojedynków.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //geändert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 für Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //Większość najemników stoi za tobą. Jeśli o mnie chodzi - możesz zaczynać od zaraz.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //Idź do Lee. On ci wyjaśni całą resztę.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Zdobyłem szacunek najemników. Czas na rozmowę z Lee."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //Całkiem nieźle, ale to ciągle za mało.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Musisz się jeszcze trochę powysilać.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Musisz się jeszcze długo starać, chłopcze. Jeśli chcesz do nas dołączyć, musisz się trochę pomęczyć.
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
	description	= "Jakie będą moje obowiązki?";
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
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //Jakie będą moje obowiązki?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar wynajął nas z dwóch powodów: mamy trzymać na dystans strażników i pilnować porządku na farmach.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //A to obejmuje także ściąganie czynszu, gdy pomniejsi farmerzy nie chcą płacić.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //No więc, jak będzie?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Zdobędę te pieniądze!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Bez obaw. Zajmę się tymi strażnikami.", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Dobrze. Słuchaj: od kilku tygodni farmer Sekob nie płaci Onarowi czynszu.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar chce, żebyśmy wydusili z niego 50 sztuk złota. Jakieś pytania?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Gdzie leży farma Sekoba?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //W północnej części doliny. Patrząc stąd, musisz skręcić w prawo na dużych rozstajach dróg.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Gdybyś się zgubił, wieśniacy na polach wskażą ci właściwą drogę.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof prosił mnie o odebranie czynszu od farmera Sekoba, który jest winien 50 sztuk złota.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Farmer Bengar marudzi, że miejscy strażnicy strasznie mu się ostatnio naprzykrzają.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Utrudniają mu życie, jak mogą. Pewnie chcą, żeby zerwał z Onarem.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Chcę, żebyś poszedł na jego farmę i wbił tym strażnikom do głowy, że nie mają tam czego szukać. Jakieś pytania?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Gdzie leży farma Bengara?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //W południowo-zachodniej części doliny znajdziesz wielkie schody, prowadzące na płaskowyż. Tam leży farma Bengara.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Gdybyś się zgubił, wieśniacy na polach wskażą ci właściwą drogę.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof prosił mnie o pozbycie się najemników z farmy Bengara, znajdującej się na płaskowyżu.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Zdobędę te pieniądze!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Bez obaw. Zajmę się tymi strażnikami.
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
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Cholernie długo ci zeszło. Onar nie będzie zachwycony.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //A los paladynów w Górniczej Dolinie ma głęboko... w poważaniu.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Dobra robota! Gdyby pojawiło się coś nowego, dam ci znać!
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
	description	= "Odebrałem zaległy czynsz od Sekoba.";
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
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Odebrałem zaległy czynsz od Sekoba.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //Tak? Stwarza jakieś problemy?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //Cóż, miał... śmiertelny wypadek.
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Musiałem go najpierw przekonać.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Dobra robota! Przeszedłeś próbę. To powinno przekonać wielu najemników, że nadajesz się do tej roboty.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Wykonałem zadanie, które otrzymałem od Torlofa."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //I co? Przepiłeś wszystko? Dawaj pieniądze, i to szybko!
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
	description	= "Rozwiązałem problemy Bengara ze strażnikami.";
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
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Rozwiązałem problemy Bengara ze strażnikami.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Upewniłeś się, że nie wrócą na jego farmę następnego dnia?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //No cóż, raczej im się to nie uda... zwięźle mówiąc.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Dobra robota!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Przeszedłeś próbę. Ktoś, kto poradził sobie ze strażnikami, zasługuje na nasz szacunek.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Wykonałem zadanie, które otrzymałem od Torlofa."); 
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
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //Witamy wśród najemników!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //Dzięki!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Jak tylko pojawi się jakaś robota, dam ci znać.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Gdzie się podziewałeś?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //Byłem w Górniczej Dolinie. Tam są smoki! Paladynom nieźle się od nich oberwało.
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Czyżby? Zatem w tych opowieściach jest jednak trochę prawdy.
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Lee na pewno się tym zainteresuje.
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
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Dobrze, że tu jesteś. Mam dla ciebie robótkę...
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //O co chodzi?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //Tylko masz skończyć do jutra!
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
	description = "Pomożesz mi popracować nad moimi umiejętnościami?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //Pomożesz mi popracować nad moimi umiejętnościami?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Mógłbym ci pokazać, jak wykorzystywać swoją siłę w bezpośredniej walce.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Wielu wojowników dostaje baty, bo nie potrafi odpowiednio spożytkować swojej siły.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //Podobnie jest ze zręcznością i walką na dystans.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof może mi pokazać, jak stać się zręczniejszym i silniejszym.");
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
	description = "Pomóż mi popracować nad moimi umiejętnościami.";
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
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Chcę zwiększyć moje umiejętności.
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
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //Powiedziałem, że MÓGŁBYM ci pomóc, a nie, że to ZROBIĘ.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Dopóki nie zostaniesz jednym z nas, szukaj sobie innego nauczyciela.
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //Świetnie! Teraz możesz skuteczniej wykorzystywać swoje umiejętności.
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

	description	 = 	"Masz dla mnie jakieś nowe zadania?";
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
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Masz dla mnie jakieś nowe zadania?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Widziałeś tych gości w czarnych kapturach, którzy kręcą się w pobliżu? Jest z nimi coś nie tak, mówię ci.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Gdy byłem na morzu, widywałem różne dziwne rzeczy, ale tych zakapturzonych naprawdę się boję.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //Poszli w kierunku obozu bandytów, pod górami na południowym krańcu doliny.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Może powinieneś się tam wybrać i zrobić z nimi porządek?
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"W górskim obozie bandytów, znajdującym się na południe od doliny, ponoć przebywa kilku z tych zakapturzonych mężczyzn, którzy ostatnio sprawiali problemy Torlofowi. Zamierzam rozwiązać ten problem raz na zawsze."); 

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

	description	 = 	"Nie musisz się już obawiać tych zakapturzonych postaci z gór.";
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
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Nie musisz już się obawiać tych zakapturzonych postaci z gór.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Załatwiłeś ich? Gratuluję.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Coś mi się w nich nie podobało. Założę się, że mielibyśmy przez nich niezłe kłopoty.
	
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

	description	 = 	"Część najemników odeszła chyba z farmy?";
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
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //Część najemników odeszła chyba z farmy?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio zabrał kilku chłopaków i poprowadził ich na przełęcz.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //Plotka głosi, że pokazały się tam smoki. Jak Sylvio się o tym dowiedział, nie można go było powstrzymać.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Kto wie? Za smoczy łeb można pewnie dostać kupę pieniędzy.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //Ale to nie dla mnie. Jestem żeglarzem. Moje miejsce jest na morzu, a nie w cuchnącej smoczej jamie.

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

	description	 = 	"Jesteś żeglarzem?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //Jesteś żeglarzem?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //No, nareszcie załapałeś! Tak, do diaska, jestem. Czemu pytasz?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Przydałby mi się ktoś taki jak ty. Zamierzam popłynąć na pewną wyspę.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //Na wyspę? Nie masz nawet statku, nie mówiąc o załodze.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Nie nie nie, chłopcze. Jeśli mam być twoim kapitanem i nauczycielem, musisz mi najpierw udowodnić, że wiesz, o co w tym wszystkim chodzi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Mam zresztą teraz inne zmartwienie. Wbrew naszym przewidywaniom, paladyni nie opuścili miasta.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Potrzeba nie lada powodu, by ich wyciągnąć w pole.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //Idź do zamku w Górniczej Dolinie, wykradnij strażnikowi klucz do głównej bramy i otwórz ją. Resztą zajmą się orkowie.

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Zanim Torlof przyjmie posadę kapitana, muszę pozbyć się z miasta paladynów. Torlof wpadł na pomysł zaaranżowania niewielkiego wypadku na zamku w Górniczej Dolinie - chce, abym ukradł strażnikowi klucz od głównej bramy i wpuścił orków do środka. Ma nadzieję, że paladyni z miasta wyruszą wtedy z odsieczą.");
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

	description	 = 	"Brama do zamku w Górniczej Dolinie jest już otwarta...";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Brama do zamku w Górniczej Dolinie jest już otwarta i zablokowana. Nic teraz nie powstrzyma szturmu orków.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Załoga zamku poniosła ciężkie straty.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //Paladyni z miasta powinni wkrótce wyruszyć do Doliny, by wyciągnąć swoich towarzyszy z oblężonego zamku.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //To świetna wiadomość. Teraz nic mnie już nie powstrzyma przed wyrwaniem się z tego przeklętego miejsca.
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

	description	 = 	"Czy teraz pomożesz mi dostać się na wyspę?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Czy teraz pomożesz mi dostać się na wyspę?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //A, fakt. Chciałeś, żebym z tobą popłynął. Słuchaj, zrobimy tak:
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Zapłać mi 2500 sztuk złota, a ja poprowadzę twój okręt.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Za tę sumę nauczę cię także wszystkiego, co wiem o sile i zręczności.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "To bardzo duża suma.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "W porządku. Oto twoje złoto.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //To bardzo duża suma.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //Pomoc specjalisty musi kosztować. Poza tym, nie masz wyboru. Nie znajdziesz tutaj nikogo innego, kto potrafi dowodzić okrętem.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Tak więc płać i nie marudź.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof zgadza się objąć obowiązki kapitana statku, jednak żąda za to zapłaty w wysokości 2500 sztuk złota.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //W porządku. Oto twoje złoto.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //Świetnie. Teraz musisz mi tylko powiedzieć, co mam zrobić.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Torlof dostał ode mnie 2500 sztuk złota i jest gotów wyruszyć w każdej chwili.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Chcesz mi zmydlić oczy paroma monetami? Zdobądź całą sumę, a wtedy pogadamy.
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

	description	 = 	"Zostań kapitanem mojego statku.";
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
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //Zostań kapitanem mojego statku.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //W porządku. Daj mi statek i odpowiednią załogę, a popłynę z tobą nawet na koniec świata.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //A masz odpowiednią mapę morską? Bez niej daleko nie dopłyniemy.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //To już moje zmartwienie. Spotkamy się na przystani.
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

	description	 = 	"Możemy ruszać w drogę.";
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
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Możemy ruszać w drogę.

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Dobra. Daj mi mapę i odpływamy.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //Wszyscy na pokład!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Na pewno masz wszystko, czego potrzeba? Nie będziemy zawracać w pół drogi!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Jeśli jesteś pewien, walnij się na koję w kajucie kapitana. Podróż trochę potrwa.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //Nie ma statku, nie ma załogi, nie ma mapy, nie ma podróży!
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Potrzebuję co najmniej pięciu ludzi zdatnych do pomocy na morzu.
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

	description	 = 	"Zdecydowałem się na innego kapitana.";
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
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Zdecydowałem się na innego kapitana. Możesz mi oddać moje pieniądze.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //Chyba śnisz! Nie ma mowy! Jak płacisz z góry, a potem zmieniasz zdanie, to już twój problem.
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

































































