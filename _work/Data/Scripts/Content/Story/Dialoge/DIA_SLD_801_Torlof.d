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
	AI_Output (self, other, "DIA_Torlof_Hallo_01_00"); //(nevrle) Co po mn� chce�?
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
	description	= "Chci se p�idat k �oldn���m!";
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
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Chci se p�idat k �oldn���m!
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Hm? A pro� si mysl�, �e bych m�l b�t pro, abychom t� sem p�ijali?
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
	description	= "Nech m� proj�t zkou�kou!";
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
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Nech m� proj�t zkou�kou!
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //Poslal t� za mnou Lee?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //�ekl, �e mi pom��e�.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //(vzdychne si) Fajn. Tak dobr�. Ne� se k n�m bude� moct p�idat, mus� ud�lat dv� v�ci.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Za prv� - mus� prok�zat, �e bude� schopn� zvl�dnout �koly, kter� bude� jako �oldn�� dost�vat. S�m t� ozkou��m.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //A za druh� - mus� si vyslou�it respekt ostatn�ch �old�k�.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Start"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Aby m� �oldn��i p�ijali mezi sebe, mus�m podstoupit zkou�ku, kterou mi zad� Torlof, a vyslou�it si respekt ostatn�ch.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Ne.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Tak co tady plk�?
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
	description	= "Jak si z�sk�m respekt ostatn�ch �old�k�?";
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
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Jak si vyslou��m respekt ostatn�ch �oldn���?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //V�t�in� z nich bude sta�it, kdy� spln� sv�j �kol a projde� m�m testem.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //N�kter� ale bude� muset p�esv�d�it jinak a s�m mus� zjistit jak.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //N�kte�� budou cht�t vyu��t toho, v jak� jsi situaci, jin�m se prost� nebude l�bit tv�j ksicht.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //M�l by ses sna�it naj�t spole�nou �e� s co nejv�ce z nich - ale kdy� nepom��e nic jin�ho, m��e� se v�dycky utkat v souboji.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Kdy� vyhraje�, z�sk� si u v�t�iny uzn�n�. Dej si ale pozor, abys n�koho n�hodou nezabil. V tom p��pad� bys byl v p�kn� ka�i.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Spln�m-li Torlofovu zkou�ku, z�sk�m si t�m respekt i u ostatn�ch �oldn���. Tak� na n� mohu zap�sobit, pokud n�kter� z nich p�em��u v souboji.");
	
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
	description	= "Jak� jsou pravidla pro souboj?";
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
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Jak� jsou pravidla pro souboj?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //Je to prost�. P�ed prvn�m �derem musej� m�t oba soupe�i mo�nost vytasit zbra�.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Nem��e� jen tak n�koho prop�chnout bez varov�n�.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Mus� doj�t k n�jak� form� �stn� v�zvy. Ur�ce, nebo jin�mu d�vodu k boji.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //Do takov�ho souboje se nebude nikdo jin� m�chat. Leda �e by b�hem n�j n�kdo z t�ch dvou zem�el.
	
	B_LogEntry (TOPIC_SLDRespekt,"Pravidla souboje: souboj mus� za��t v�zvou, aby do n�j ji� nikdo dal�� nezasahoval. Tak� p�i n�m nikdo nesm� b�t zabit.");
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
	description	= "A co ty? Bude� pro m� hlasovat?";
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
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //A co ty? Bude� pro m� hlasovat?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Pokud prok�e�, �e jsi schopn� plnit �koly �oldn��e, tak ano.
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
	description	= "Jak to vypad� s moj� reputac� mezi �oldn��i?";
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
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Jak to vypad� s moj� reputac� mezi �oldn��i?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Tak se na to pod�vejme...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Vlk nem� nic proti tomu, aby ses p�idal.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis si mysl�, �e stoj� na spr�vn� stran�.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis si st�le nen� jist�, jestli stoj� na spr�vn� stran�.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Nechce, aby n�kdo dal�� tancoval tak, jak Sylvio p�sk�. Kdy� jsme u toho, tak j� tak� ne.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord si mysl�, �e bys mohl b�t dost dobr� na to, abychom t� p�ijali.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Podle Cordova n�zoru se bude� muset nejd��v nau�it po��dn� zach�zet s me�em, ne� se bude� moci p�idat.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher ��k�, �e pro n�j bylo od za��tku jasn�, �e by ses k n�m m�l p�idat. Vypad� to, �e ho n�co v�n� pot�ilo.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher ��k�, �e mu dlu�� laskavost a �e v�, o �em je �e�.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod chce jen dostat zp�tky sv�j me�.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Zd� se, �es Roda p�esv�d�il o tom, �e jsi dostate�n� siln�.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod si mysl�, �e jsi slaboch.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza pro tebe ruku zvedne. ��k�, �e ses zachoval velice rozumn�.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza pro tebe ruku nezvedne. ��k�, �e mu st�le dlu�� 50 zlat�ch.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul je proti tob�. Mysl�m, �e t� nem��e vyst�t.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //O Sylviovi a Bullcovi mluvit nemus�m. Ti dva tupci jsou proti ka�d�mu.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster ��k�, �e jsi v pohod�.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //I kdy� jsi prohr�l.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster ��k�, �e kdy� t� vyzval, tak jsi vym�kl.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //To nebyl dobr� n�pad. Mo�n� bys za n�m m�l zaj�t a vyzvat ho.
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //A Dar ��k�, �e jsi �vanil. Ale jeho hlas tady moc neznamen�.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Zbytek �oldn��� ne�ekl nic.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //V�t�ina z nich �ek�, jak si povede� b�hem zkou�ky.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //V�t�inu z nich jsi p�esv�d�il t�m, �e jsi pro�el zkou�kou.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //(u�kl�bne se) I kdy� v tom m� trochu prsty Cord.
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //I kdy� hodn� z nich ��k�, �e p�esv�d�it farm��e, aby zaplatil sv�j n�jem, bylo na zkou�ku moc jednoduch�.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //M�j hlas ka�dop�dn� m�.
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
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //A vyhr�l jsi n�kolik �estn�ch souboj�.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //To hodn� �oldn��� respektuje.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //Ka�dop�dn� jsi vyhr�l n�kolik �estn�ch souboj�.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //ge�ndert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 f�r Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //V�t�ina �oldn��� stoj� za tebou - co se n�s t��e, m��e� u n�s za��t, kdy se ti zl�b�.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //B� za Leem. Vysv�tl� ti v�echno pot�ebn�.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"Mezi �oldn��i u� jsem si vyslou�il dost �cty. Te� bych m�l prohodit p�r slov s Leem."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //To je dost, ale po��d to nesta��.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Bude� se muset s chlapci je�t� chv�li pr�t.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Nem� to ani zdaleka za sebou, chlap�e. Jestli chce�, abychom t� p�ijali mezi sebe, bude� pro to muset ud�lat trochu v�c.
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
	description	= "Jak� m�m jako �oldn�� povinnosti?";
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
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //Jak� m�m jako �oldn�� povinnosti?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar n�s najal ze dvou d�vod�: chce, abychom od n�j dr�eli d�l domobranu a udr�ovali po��dek na jeho farm�ch.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //To zahrnuje vyb�r�n� pachtovn�ho, kdy� nebudou cht�t drobn� farm��i zaplatit.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //Tak�e, co to bude?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Nech m� vybrat ten n�jem!", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Vypo��d�m se s domobranou, ��dn� obavy!", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Dobr�. Poslouchej. Farm�� Sekob u� n�kolik t�dn� Onarovi nezaplatil n�jem.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar po n�m chce, aby vysolil 50 zlat�ch. N�jak� ot�zky?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Kde je Sekobova farma?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //V severn� ��sti �dol�. Kdy� se d�v� odsud, je to napravo u t� velk� k�i�ovatky.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Kdybys m�l n�jak� probl�my, farm��i na pol�ch ti pom��ou naj�t cestu.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof m� po��dal, abych od sedl�ka Sekoba vyinkasoval n�jemn�, kter� �in� 50 zla��k�.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Farm�� Bengar si st�oval, �e mu domobrana z m�sta v posledn� dob� leze na nervy.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Vyv�jej� na toho farm��e n�tlak - nejsp� cht�j�, aby se oto�il k Onarovi z�dy.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Chci, abys �el na jeho farmu a vyjasnil domobran�, �e tady nemaj� co pohled�vat! Ot�zky?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Jak najdu Bengarovu farmu?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //Na jihoz�pad� �dol� je velk� schodi�t�, kter� vede na planinu. Tam m� Bengar svou farmu.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Kdyby ses ztratil, zeptej se farm��� na pol�ch, kudy se d�t.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof m� pov��il, abych na planin� ze statku sedl�ka Bengara vyhnal domobranu.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Nech m� vybrat ten n�jem!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Vypo��d�m se s domobranou, ��dn� obavy!
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
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Trvalo ti to stra�n� dlouho. Onar nebude m�t radost.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //A je mu jedno, jestli paladiny n�co se�ere v Hornick�m �dol�, nebo ne.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Dobr� pr�ce! A� budu m�t n�co dal��ho, d�m ti v�d�t.
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
	description	= "Vybral jsem n�jem od Sekoba.";
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
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Vybral jsem n�jem od Sekoba.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //A? Zaplatil dobrovoln�?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //No, potkal ho smrteln� �raz...
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Nejd��v jsem ho musel p�esv�d�it.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Dobr� pr�ce! Pro�el jsi zkou�kou. To p�esv�d�� hodn� �oldn��� o tom, �e v�, co se slu�� a pat��.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem �kol, kter� mi sv��il Torlof."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //A? Utratil jsi to snad za chlast? P�ines mi pen�ze! A hezky z�erstva!
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
	description	= "Postaral jsem se o Bengar�v probl�m s domobranou.";
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
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Postaral jsem se o Bengar�v probl�m s domobranou.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Ujistil ses, �e nebudou z�tra zase st�t na jeho z�pra��?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //S t�m by m�li docela pot�e...
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Dobr� pr�ce!
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Pro�el jsi zkou�kou. Kdy� dok�e� zvl�dnout domobranu, v�t�ina t� tady bude uzn�vat.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Splnil jsem �kol, kter� mi sv��il Torlof."); 
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
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //V�tej mezi �oldn��i, chlap�e!
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //D�ky!
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Jakmile pro tebe budu m�t n�co na pr�ci, d�m ti v�d�t.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Kde jsi byl?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //Byl jsem v Hornick�m �dol�! Jsou tam draci! Dali paladin�m p�kn� zabrat!
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Fakt? Tak�e na v�ech t�ch pov�da�k�ch v�n� n�co je!
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Leeho to bude zaj�mat.
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
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Dob�e �e jsi tady. M�m pro tebe n�co na pr�ci.
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //O co jde?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //A postarej se o to, a� je to do z�tra hotov�!
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
	description = "Pomohl bys mi vylep�it moje schopnosti?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //M��e� mi pomoci vylep�it moje schopnosti?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Mohl bych ti uk�zat, jak l�pe vyu��t svou s�lu p�i boji na bl�zko.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Spousta bojovn�k� je stra�n� slab�, proto�e nemaj� spr�vnou techniku, s jej� pomoc� by spr�vn� vyu��vali svou s�lu.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //To sam� plat� u st�eln�ch zbran� a obratnosti.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof mi pom��e vylep�it obratnost a s�lu.");
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
	description = "Chci si vylep�it schopnosti!";
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
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Chci si vylep�it schopnosti!
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
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //�ekl jsem, �e bych ti MOHL pomoci, ne �e ti POMَU.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Dokud nejsi jedn�m z n�s, mus� si naj�t n�koho jin�ho, kdo by t� u�il!
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //Dobr�! Nyn� dok�e� pou��vat svoje schopnosti l�pe!
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

	description	 = 	"Nem� pro m� n�co na pr�ci?";
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
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Nem� pro m� n�co na pr�ci?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Vid�ls ty chlap�ky s �ern�mi k�p�mi, co se potuluj� po okol�? �eknu ti, b�h� mi z nich mr�z po z�dech.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Kdy� jsem byl na mo�i, vid�l jsem p�r v�n� divn�ch v�c�, ale tihle lidi m� v�n� d�s�.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //�li sm�rem k t�boru bandit�, co je v hor�ch na ji�n�m konci �dol�.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Mo�n� by ses tam m�l vydat, zjistit, co jsou za�, a vypo��dat se s nimi!
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"P�r t�ch zakuklenc� se nejsp� bude skr�vat v t�bo�e bandit� v hor�ch ji�n� od �dol�. Torlofovi po��dn� pij� krev - m�m pro n�j tenhle probl�m vy�e�it."); 

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

	description	 = 	"Ti �ernok�pn�ci z hor u� nejsou mezi n�mi.";
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
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Ti �ernok�pn�ci z hor u� nejsou mezi n�mi.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Dok�zal jsi je vy��dit? Frajer!
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Ani za m�k jsem t�m chlap�k�m nev��il. Jenom by d�lali trable.
	
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

	description	 = 	"N�kte�� �oldn��i ode�li?";
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
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //N�kte�� �oldn��i ode�li?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio sebral p�r chlapc� a zmizel s nimi na druhou stranu pr�smyku.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //Pov�d� se, �e se tam objevili draci. Kdy� se to doslechl, ne�lo ho zastavit.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //Kdo v�? Za dra�� trofej by dostal na trhu hromadu pen�z.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //To pro m� nen�. Jsem n�mo�n�k. Pat��m na mo�e, a ne do n�jak�ho smradlav�ho dra��ho doup�te.

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

	description	 = 	"Ty jsi n�mo�n�k?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //Ty jsi n�mo�n�k?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //Kone�n� t� to trklo? Jo, ksakru, jsem n�mo�n�k. Pro� se pt�?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Hodily by se mi tvoje schopnosti. Pot�ebuji se dostat na jeden ostrov.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //(zasm�je se) Na ostrov? V�dy� ani nem� lo�, nato� pos�dku, kter� by ji ��dila.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Ne, chlap�e. Jestli chce� vyu��t m�ch slu�eb jako kapit�na a u�itele s�ly, mus� mi nejd��v dok�zat, �e v�, o �em mluv�.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Krom� toho m�m u� tak dost sv�ch vlastn�ch starost�. Paladinov� se nest�hli z m�sta, jak jsme o�ek�vali.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Muselo by se st�t n�co opravdu v�n�ho, aby vyklidili pole.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //B� do hradu v Hornick�m �dol�. Ukradni str��m kl�� od hlavn� br�ny a otev�i ji. Sk�eti se u� postaraj� o zbytek!

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Je�t� ne� Torlof p�ijme funkci kapit�na, mus�m p�im�t paladiny, aby opustili m�sto. Kdy� mu pomohu, spole�n� na hrad� v Hornick�m �dol� nastra��me malou lest. Mus�m str�ci ukr�st kl�� od hlavn� br�ny a otev��t ji, aby do hradu mohli proniknout sk�eti. Torlof douf�, �e tahle pohroma p�im�je paladiny, aby ode�li z m�sta a vydali se na pomoc sv�m kamar�d�m.");
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

	description	 = 	"Br�na od hradu v Hornick�m �dol� je otev�ena...";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //Br�na do hradu v Hornick�m �dol� je otev�en� a zaseknut�. Sk�et�m u� nic nebr�n� v tom, aby vzali hrad �tokem.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Paladinov� utrp�li v bitv� se sk�ety v�n� ztr�ty.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //�ekl bych, �e u� nebude trvat dlouho, ne� se paladinov� odsud z m�sta vydaj� do Hornick�ho �dol�, aby dostali sv� kamar�dy pry� z hradu.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //To jsou p��jemn� zpr�vy. Tak�e u� nic nestoj� v cest� tomu, abych utekl z tohohle proklet�ho kraje.
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

	description	 = 	"Te� u� mi pom��e� dostat se na ten ostrov?";
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
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Te� u� mi pom��e� dostat se na ten ostrov?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //No jasn�. Cht�l jsi jet na n�jak� ostrov. Hmm. D�m ti jeden n�vrh.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Zaplat� mi 2500 zlat�ch a j� se ujmu velen� tv� lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Nav�c t� budu tr�novat v s�le a obratnosti, kdykoliv to jen bude� cht�t.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "To je stra�n� spousta pen�z.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "Dobr�. Tady m� sv� pen�ze.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //To je stra�n� spousta pen�z.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //To jo. Dobr� pomoc je drah�. Nem� na v�b�r. Tady v okol� nenajde� nikoho dal��ho, kdo by velel tv� lodi.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Tak zapla� a ned�lej vlny.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof je nyn� ochoten ��dit lo�. Bohu�el za to ale po�aduje 2500 zla��k�.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //Dobr�. Tady m� sv� pen�ze.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //N�dhera. Te� mi jen p�esn� �ekni, co po mn� bude� cht�t.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Potom, co jsem mu p�edal 2500 zla��k�, se Torlof kone�n� uvolil dopravit m� k c�li.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Sna�� se m� oblbnout p�r mincemi? Nejd��v p�ines pen�ze. Pak uvid�me.
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

	description	 = 	"Bu� m�m kapit�nem.";
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
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //Bu� m�m kapit�nem.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //Dobr�. Se�e� mi lo� a dostate�n� silnou pos�dku a j� t� dostanu na ten tv�j mizern� ostrov.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //M� n�mo�n� mapy? Bez nich se moc daleko nedostaneme.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //O to se postar�m. Setk�me se v p��stavu.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //Jsem v�n� zv�dav�, jak to chce� ud�lat.
	
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

	description	 = 	"Vzh�ru na ostrov!";
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
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Vzh�ru na ostrov!

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Dobr�. Dej mi mapy a m��eme vyplout.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //(zavol�) V�ichni na palubu.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Ujisti se, �e m� opravdu v�echno, co bys mohl pot�ebovat. Vracet se nem��eme.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Jestli si jsi jist�, b� se nat�hnout do kapit�nsk� kajuty. Za chv�li vyraz�me na cestu.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //��dn� lo�, ��dn� pos�dka, ��dn� mapa, ��dn� v�let, p��teli.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Chci vid�t aspo� p�t chlap� ochotn�ch a schopn�ch plavby.
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

	description	 = 	"Rozhodl jsem se pro jin�ho kapit�na.";
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
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //Rozhodl jsem se pro jin�ho kapit�na. M��e� mi hned vr�tit m� pen�ze.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //To by ne�lo. Nic takov�ho. Kdy� mi nejd��v zaplat� a pak nakonec moje slu�by odm�t�, je to tv�j probl�m.
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

































































